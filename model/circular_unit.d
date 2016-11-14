module model.circular_unit;

import model.unit;
import model.faction;

/**
 * This base class describes any circular unit in the game world.
 */
abstract class CircularUnit : Unit
{
    /**
     * Returns: the radius of this unit.
     */
    immutable double radius;

    protected immutable this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable (Faction) faction,
        double radius)
    {
        super (id, x, y, speedX, speedY, angle, faction);

        this.radius = radius;
    }
}
