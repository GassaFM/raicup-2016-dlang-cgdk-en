module model.projectile;

import model.projectile_type;
import model.circular_unit;
import model.faction;

/**
 * This class is inherited from a circular unit and describes a projectile.
 */
class Projectile : CircularUnit
{
    /**
     * Returns: the type of the projectile.
     */
    immutable ProjectileType type;
    /**
     * Returns: the Id of the unit created this projectile.
     */
    immutable long ownerUnitId;
    /**
     * Returns: the Id of the player, which unit created this projectile, or `-1`.
     */
    immutable long ownerPlayerId;

    immutable this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable (Faction) faction,
        double radius,
        immutable (ProjectileType) type,
        long ownerUnitId,
        long ownerPlayerId)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius);

        this.type = type;
        this.ownerUnitId = ownerUnitId;
        this.ownerPlayerId = ownerPlayerId;
    }
}
