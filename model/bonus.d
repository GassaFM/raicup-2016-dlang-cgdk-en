module model.bonus;

import model.bonus_type;
import model.circular_unit;
import model.faction;

/**
 * This class describes a bonus. Bonus is a static useful circular unit.
 */
immutable class Bonus : CircularUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the bonus type.
     */
    BonusType type;

    this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable Faction faction,
        double radius,
        immutable BonusType type)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius);

        this.type = type;
    }
}
