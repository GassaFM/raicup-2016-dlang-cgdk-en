// This is the ``Quick Start'' strategy: http://russianaicup.ru/p/quick.
// To use it, make a backup copy of your file
// ../my_strategy.d, and then copy this file there.
module my_strategy;

import std.algorithm;
import std.array;
import std.math;
import std.random;
import std.range;
import std.typecons;

import model;
import strategy;

/**
 * The class in which to implement the strategy.
 */
final class MyStrategy : Strategy
{
    /**
     * Main strategy method for controlling the wizard.
     * The game engine calls this method once each time tick.
     *
     * Params:
     * self  = the wizard controlled by this strategy.
     * world = the current world snapshot.
     * game  = many game constants.
     * move  = the object that encapsulates all strategy instructions
     * to the wizard.
     */
    void move (immutable Wizard self, immutable World world,
        immutable Game game, Move move)
    {
        initializeStrategy (self, game);
        initializeTick (self, world, game, move);

        // Moving from side to side to make it harder to hit us.
        // Think you can come up with a more efficient evasion algorithm?
        // Try it! ;)
        move.strafeSpeed = game.wizardStrafeSpeed *
            (uniform (0, 2, random) ? +1 : -1);

        // Retreat at low hitpoints.
        if (self.life < self.maxLife * lowHPFactor)
        {
            goTo (getPreviousWaypoint ());
            return;
        }

        auto nearestTarget = getNearestTarget ();

        // If we see an enemy ...
        if (nearestTarget !is null)
        {
            auto distance = self.getDistanceTo (nearestTarget);

            // ... and the enemy is in the range of our offensive spells, ...
            if (distance <= self.castRange)
            {
                auto angle = self.getAngleTo (nearestTarget);

                // ... we are turning toward the enemy.
                move.turn = angle;

                // If the target is already in the front of our wizard, ...
                if (abs (angle) < game.staffSector * 0.5)
                {
                    // ... ATTACK!
                    move.action = ActionType.magicMissile;
                    move.castAngle = angle;
                    move.minCastDistance = distance -
                        nearestTarget.radius + game.magicMissileRadius;
                }

                return;
            }
        }

        // If there are no other actions, advance to the next waypoint.
        goTo (getNextWaypoint ());
    }

private:
    static immutable double waypointRadius = 100.0;
    static immutable double lowHPFactor = 0.25;

    /**
     * Waypoints for each lane.
     * $(BR)
     * If everything is OK, move to the next point and attack opponents.
     * Retreat at low hitpoints.
     */
    Point2D [] [LaneType] waypointsByLane;

    Random random;

    LaneType lane;
    Point2D [] waypoints;

    Rebindable !(immutable Wizard) self;
    Rebindable !(immutable World) world;
    Rebindable !(immutable Game) game;
    Move theMove;

    /**
     * Initialize our strategy.
     * $(BR)
     * Usually you can use a constructor, but in this case
     * we want to initialize the random number generator
     * with the value obtained from the game engine.
     */
    private void initializeStrategy (immutable Wizard self,
        immutable Game game)
    {
        if (waypointsByLane is null)
        {
            random.seed (cast (uint) (game.randomSeed));

            auto mapSize = game.mapSize;

            waypointsByLane[LaneType.middle] = [
                Point2D (100.0, mapSize - 100.0),
                uniform (0, 2, random) ? Point2D (600.0, mapSize - 200.0) :
                                         Point2D (200.0, mapSize - 600.0),
                Point2D (800.0, mapSize - 800.0),
                Point2D (mapSize - 600.0, 600.0),
            ];

            waypointsByLane[LaneType.top] = [
                Point2D (100.0, mapSize - 100.0),
                Point2D (100.0, mapSize - 400.0),
                Point2D (200.0, mapSize - 800.0),
                Point2D (200.0, mapSize *  0.75),
                Point2D (200.0, mapSize *  0.50),
                Point2D (200.0, mapSize *  0.25),
                Point2D (200.0, 200.0),
                Point2D (mapSize  * 0.25, 200.0),
                Point2D (mapSize  * 0.50, 200.0),
                Point2D (mapSize  * 0.75, 200.0),
                Point2D (mapSize - 200.0, 200.0),
            ];

            waypointsByLane[LaneType.bottom] = [
                Point2D (100.0, mapSize - 100.0),
                Point2D (400.0, mapSize - 100.0),
                Point2D (800.0, mapSize - 200.0),
                Point2D (mapSize *  0.25, mapSize - 200.0),
                Point2D (mapSize *  0.50, mapSize - 200.0),
                Point2D (mapSize *  0.75, mapSize - 200.0),
                Point2D (mapSize - 200.0, mapSize - 200.0),
                Point2D (mapSize - 200.0, mapSize *  0.75),
                Point2D (mapSize - 200.0, mapSize *  0.50),
                Point2D (mapSize - 200.0, mapSize *  0.25),
                Point2D (mapSize - 200.0, 200.0),
            ];

            switch (self.id)
            {
                case 1:
                case 2:
                case 6:
                case 7:
                    lane = LaneType.top;
                    break;
                case 3:
                case 8:
                    lane = LaneType.middle;
                    break;
                case 4:
                case 5:
                case 9:
                case 10:
                    lane = LaneType.bottom;
                    break;
                default:
                    assert (false);
            }

            waypoints = waypointsByLane[lane];

            // Our strategy assumes that the waypoints are sorted
            // by the distance to the last waypoint in descending order.
            // You can check that fact here
            // if you plan to change the waypoints.

            /*
            Point2D lastWaypoint = waypoints.back;

            if (!waypoints
                .map !(point => -point.getDistanceTo (lastWaypoint))
                .isSorted)
            {
                assert (false);
            }
            */
        }
    }

    /**
     * Save all input data in the strategy fields for simpler access.
     */
    private void initializeTick (immutable Wizard self, immutable World world,
        immutable Game game, Move move)
    {
        this.self = self;
        this.world = world;
        this.game = game;
        this.theMove = move;
    }

    /**
     * This method assumes that the waypoints are sorted by the distance
     * to the last waypoint in descending order.
     * It finds the first waypoint that is closer to the last waypoint
     * than the wizard.
     * $(BR)
     * But first, if the wizard is very close to some waypoint,
     * then we immediately return the next waypoint.
     */
    Point2D getNextWaypoint ()
    {
        return getWaypoint (waypoints);
    }

    /**
     * The effect of this method is the same as the effect of the
     * `getNextWaypoint` method if you reverse the `waypoints` array.
     */
    Point2D getPreviousWaypoint ()
    {
        return getWaypoint (waypoints.retro);
    }

    Point2D getWaypoint (R) (R waypoints)
        if (is (typeof (waypoints.front) == Point2D))
    {
        auto closeWaypoint = waypoints.find !(waypoint =>
            waypoint.getDistanceTo (self) <= waypointRadius).drop (1);
        if (!closeWaypoint.empty)
        {
            return closeWaypoint.front;
        }

        auto lastWaypoint = waypoints.back;

        auto result = waypoints.dropBack (1).find !(waypoint =>
            lastWaypoint.getDistanceTo (waypoint) <
            lastWaypoint.getDistanceTo (self));
        if (!result.empty)
        {
            return result.front;
        }

        return lastWaypoint;
    }

    /**
     * The simplest way to move the wizard.
     */
    void goTo (Point2D point)
    {
        double angle = self.getAngleTo (point.x, point.y);

        theMove.turn = angle;

        if (abs (angle) < game.staffSector * 0.25)
        {
            theMove.speed = game.wizardForwardSpeed;
        }
    }

    /**
     * Find the nearest target to attack, regardless of its type
     * and other characteristics.
     */
    immutable (LivingUnit) getNearestTarget ()
    {
        immutable (LivingUnit) [] targets;
        foreach (unit; world.buildings)
        {
            targets ~= cast (immutable LivingUnit) (unit);
        }
        foreach (unit; world.wizards)
        {
            targets ~= cast (immutable LivingUnit) (unit);
        }
        foreach (unit; world.minions)
        {
            targets ~= cast (immutable LivingUnit) (unit);
        }
        auto result = targets
            .filter !(target => target.faction != Faction.neutral &&
                                target.faction != self.faction)
            .minPos !((a, b) =>
            a.getDistanceTo (self) < b.getDistanceTo (self));
        return (result.empty ? null : result.front);
    }
}

/**
 * Helper struct to store positions on the map.
 */
struct Point2D
{
    double x;
    double y;

    double getDistanceTo (double x, double y) const
    {
        return hypot (this.x - x, this.y - y);
    }

    double getDistanceTo (T) (T point) const
        if (is (typeof (point.x) : double) &&
            is (typeof (point.y) : double))
    {
        return getDistanceTo (point.x, point.y);
    }
}
