module model.unit;

import model.faction;
import std.math;

/**
 * Base class that describes any object (``unit'') in the game world.
 */
abstract immutable class Unit
{
    /**
     * Returns: the unique unit id.
     */
    long id;
    /**
     * Returns: the X of the unit's center. The X-axis is directed from left to right.
     */
    double x;
    /**
     * Returns: the Y of the unit's center. The Y-axis is directed downward.
     */
    double y;
    /**
     * Returns: the X speed component or the last tick X-coordinate change, if this unit can instantly change its speed.
     * The X-axis is directed from left to right.
     */
    double speedX;
    /**
     * Returns: the Y speed component or the last tick Y-coordinate change, if this unit can instantly change its speed.
     * The Y-axis is directed downward.
     */
    double speedY;
    /**
     * Returns: the turn angle in radians of this unit. Direction of the X-axis has zero angle.
     * Positive angle corresponds to the rotation in a clockwise direction.
     */
    double angle;
    /**
     * Returns: the faction of this unit.
     */
    Faction faction;

    protected this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable Faction faction)
    {
        this.id = id;
        this.x = x;
        this.y = y;
        this.speedX = speedX;
        this.speedY = speedY;
        this.angle = angle;
        this.faction = faction;
    }

    /**
     * Params:
     *   x = X-coordinate of the point to get the angle to.
     *   y = Y-coordinate of the point to get the angle to.
     * Returns: the relative angle to the specified point.
     * The angle is in range of `-PI` to `PI` both inclusive.
     */
    double getAngleTo (
        double x,
        double y) const
    {
        double absoluteAngleTo = atan2 (y - this.y, x - this.x);
        double relativeAngleTo = absoluteAngleTo - angle;

        while (relativeAngleTo > PI) {
            relativeAngleTo -= 2.0 * PI;
        }

        while (relativeAngleTo < -PI) {
            relativeAngleTo += 2.0 * PI;
        }

        return relativeAngleTo;
    }

    /**
     * Params:
     *   unit = the unit to get the angle to.
     * Returns: the relative angle to the center of the specified unit.
     * The angle is in range of `-PI` to `PI` both inclusive.
     */
    double getAngleTo (
        immutable Unit unit) const
    {
        return getAngleTo (unit.x, unit.y);
    }

    /**
     * Params:
     *   x = X-coordinate of the point to get the distance to.
     *   y = Y-coordinate of the point to get the distance to.
     * Returns: the range between the specified point and the center of this unit.
     */
    double getDistanceTo (
        double x,
        double y) const
    {
        return hypot (x - this.x, y - this.y);
    }

    /**
     * Params:
     *   unit = the unit to get the distance to.
     * Returns: the range between the center of the specified unit and the center of this unit.
     */
    double getDistanceTo (
        immutable Unit unit) const
    {
        return getDistanceTo (unit.x, unit.y);
    }
}
