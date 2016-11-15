module model.projectile;

import model.projectile_type;
import model.circular_unit;
import model.faction;

/**
 * This class is inherited from a circular unit and describes a projectile.
 */
immutable class Projectile : CircularUnit
{
    /**
     * Returns: the type of the projectile.
     */
    ProjectileType type;
    /**
     * Returns: the id of the unit created this projectile.
     */
    long ownerUnitId;
    /**
     * Returns: the id of the player, which unit created this projectile, or `-1`.
     */
    long ownerPlayerId;

    this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable Faction faction,
        double radius,
        immutable ProjectileType type,
        long ownerUnitId,
        long ownerPlayerId)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius);

        this.type = type;
        this.ownerUnitId = ownerUnitId;
        this.ownerPlayerId = ownerPlayerId;
    }
}
