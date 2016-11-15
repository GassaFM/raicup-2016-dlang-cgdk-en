module model.circular_unit;

import model.unit;
import model.faction;

/**
 * This base class describes any circular unit in the game world.
 */
abstract immutable class CircularUnit : Unit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the radius of this unit.
     */
    double radius;

    protected this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable Faction faction,
        double radius)
    {
        super (id, x, y, speedX, speedY, angle, faction);

        this.radius = radius;
    }
}
