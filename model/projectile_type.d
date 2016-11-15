module model.projectile_type;

import model.projectile;

/**
 * Projectile type.
 */
enum ProjectileType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * A small piece of pure energy, that inflicts damage to a living unit upon a direct hit.
     */
    magicMissile,

    /**
     * Inflicts damage upon a direct hit and freezes a target for `game.frozenDurationTicks`.
     * A frozen unit can not move or perform any actions.
     */
    frostBolt,

    /**
     * Explodes when reaching maximal cast range or upon a collision with living unit.
     * Damages and burns any living unit, if a distance to the center of this unit is not greater than
     * `game.fireballExplosionMinDamageRange + livingUnit.radius`.
     * The greater the distance, the less the instant damage.
     */
    fireball,

    /**
     * Sharp thing flying at high speed. Inflicts damage upon a direct hit.
     */
    dart
}
