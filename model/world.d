module model.world;

import model.tree;
import model.wizard;
import model.player;
import model.building;
import model.bonus;
import model.minion;
import model.projectile;

/**
 * This class describes a game world. A world contains all players and game objects (``units'').
 */
immutable class World
{
nothrow pure @safe @nogc:

    /**
     * Returns: the current game tick.
     */
    int tickIndex;
    /**
     * Returns: the base game duration in ticks. A real game duration may be lower. Equals to `game.tickCount`.
     */
    int tickCount;
    /**
     * Returns: the world width.
     */
    double width;
    /**
     * Returns: the world height.
     */
    double height;
    /**
     * Returns: all players (in random order). After each tick the player objects are recreated.
     */
    Player [] players;
    /**
     * Returns: visible wizards (in random order). After each tick the wizard objects are recreated.
     */
    Wizard [] wizards;
    /**
     * Returns: visible minions (in random order). After each tick the minion objects are recreated.
     */
    Minion [] minions;
    /**
     * Returns: visible projectiles (in random order). After each tick the projectile objects are recreated.
     */
    Projectile [] projectiles;
    /**
     * Returns: visible bonuses (in random order). After each tick the bonus objects are recreated.
     */
    Bonus [] bonuses;
    /**
     * Returns: visible buildings (in random order). After each tick the building objects are recreated.
     */
    Building [] buildings;
    /**
     * Returns: visible trees (in random order). After each tick the tree objects are recreated.
     */
    Tree [] trees;

    this (
        int tickIndex,
        int tickCount,
        double width,
        double height,
        immutable Player [] players,
        immutable Wizard [] wizards,
        immutable Minion [] minions,
        immutable Projectile [] projectiles,
        immutable Bonus [] bonuses,
        immutable Building [] buildings,
        immutable Tree [] trees)
    {
        this.tickIndex = tickIndex;
        this.tickCount = tickCount;
        this.width = width;
        this.height = height;
        this.players = players;
        this.wizards = wizards;
        this.minions = minions;
        this.projectiles = projectiles;
        this.bonuses = bonuses;
        this.buildings = buildings;
        this.trees = trees;
    }

    /**
     * Returns: your player.
     */
    immutable (Player) getMyPlayer () const
    {
        foreach (immutable player; players)
        {
            if (player.me)
            {
                return player;
            }
        }

        return null;
    }
}
