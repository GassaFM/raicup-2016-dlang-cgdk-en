module model.minion;

import model.living_unit;
import model.minion_type;
import model.status;
import model.faction;

/**
 * This class is inherited from a living unit and describes a minion.
 */
immutable class Minion : LivingUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the minion type.
     */
    MinionType type;
    /**
     * Returns: the maximal range (between units' centers), at which this minion can detect other units.
     */
    double visionRange;
    /**
     * Returns: the damage of one attack.
     */
    int damage;
    /**
     * Returns: the delay between attacks.
     */
    int cooldownTicks;
    /**
     * Returns: the amount of ticks remaining before the next attack.
     */
    int remainingActionCooldownTicks;

    this (
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
        immutable Status [] statuses,
        immutable MinionType type,
        double visionRange,
        int damage,
        int cooldownTicks,
        int remainingActionCooldownTicks)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius, life, maxLife, statuses);

        this.type = type;
        this.visionRange = visionRange;
        this.damage = damage;
        this.cooldownTicks = cooldownTicks;
        this.remainingActionCooldownTicks = remainingActionCooldownTicks;
    }
}
