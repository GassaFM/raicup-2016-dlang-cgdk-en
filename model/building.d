module model.building;

import model.status;
import model.living_unit;
import model.building_type;
import model.faction;

/**
 * This class describes a building. Faction building automatically attack a random enemy in a certain range.
 * $(BR)
 * A building can not be (`frozen`).
 */
immutable class Building : LivingUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the building type.
     */
    BuildingType type;
    /**
     * Returns: the maximal range (between units' centers), at which this building can detect other units.
     */
    double visionRange;
    /**
     * Returns: the maximal range (between units' centers), at which this building can attack other units.
     */
    double attackRange;
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
        immutable BuildingType type,
        double visionRange,
        double attackRange,
        int damage,
        int cooldownTicks,
        int remainingActionCooldownTicks)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius, life, maxLife, statuses);

        this.type = type;
        this.visionRange = visionRange;
        this.attackRange = attackRange;
        this.damage = damage;
        this.cooldownTicks = cooldownTicks;
        this.remainingActionCooldownTicks = remainingActionCooldownTicks;
    }
}
