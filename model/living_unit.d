module model.living_unit;

import model.faction;
import model.circular_unit;
import model.status;

/**
 * This base class is inherited from a circular unit and describes any living unit in the game world.
 */
abstract immutable class LivingUnit : CircularUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the current amount of hitpoints.
     */
    int life;
    /**
     * Returns: the maximal amount of hitpoints.
     */
    int maxLife;
    /**
     * Returns: the magical statuses affecting this living unit.
     */
    Status [] statuses;

    protected this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable Faction faction,
        double radius,
        int life,
        int maxLife,
        immutable Status [] statuses)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius);

        this.life = life;
        this.maxLife = maxLife;
        this.statuses = statuses;
    }
}
