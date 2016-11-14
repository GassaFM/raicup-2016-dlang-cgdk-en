module model.action_type;

/**
 * Available wizard actions.
 * $(BR)
 * A wizard can not perform any new action, if he is not yet recovered from his previous action
 * (`wizard.remainingActionCooldownTicks` is greater than `0`).
 * $(BR)
 * A wizard can not perform the specific new action, if it is not yet recovered from its previous usage
 * (`remainingCooldownTicksByAction[actionType.ordinal ()]` is greater than `0`).
 */
enum ActionType : byte
{
    /**
     * Do nothing.
     */
    None,

    /**
     * Perform a melee attack with a staff.
     * $(BR)
     * This attack damages all living units in a sector of `-game.staffSector / 2.0` to
     * `game.staffSector / 2.0`. The distance between wizard and target centers should not exceed
     * `game.staffRange + livingUnit.radius`.
     */
    Staff,

    /**
     * Cast a magic missile.
     * $(BR)
     * Magic missile is a basic spell of any wizard. Inflicts some damage upon a direct hit.
     * $(BR)
     * The center of a newly created magic missile is the same as the center of a caster wizard. The angle of a
     * projectile is equal to `wizard.angle + move.castAngle`, and its speed is `game.magicMissileSpeed`.
     * All collisions between a projectile and its caster are ignored by the game engine.
     * $(BR)
     * Requires `game.magicMissileManacost` manapoints.
     */
    MagicMissile,

    /**
     * Cast a frost bolt.
     * $(BR)
     * A frost bolt inflicts some damage upon a direct hit and freezes a target.
     * $(BR)
     * The center of a newly created frost bolt is the same as the center of a caster wizard. The angle of a
     * projectile is equal to `wizard.angle + move.castAngle`, and its speed is `game.frostBoltSpeed`.
     * All collisions between a projectile and its caster are ignored by the game engine.
     * $(BR)
     * Requires the `FrostBolt` skill and `game.frostBoltManacost` manapoints.
     */
    FrostBolt,

    /**
     * Cast a fireball.
     * $(BR)
     * A fireball explodes when reaching maximal cast range or upon a collision with living unit.
     * Damages and burns all living units nearby.
     * $(BR)
     * The center of a newly created fireball is the same as the center of a caster wizard. The angle of a
     * projectile is equal to `wizard.angle + move.castAngle`, and its speed is `game.fireballSpeed`.
     * All collisions between a projectile and its caster are ignored by the game engine.
     * $(BR)
     * Requires the `Fireball` skill and `game.fireballManacost` manapoints.
     */
    Fireball,

    /**
     * Cast a haste spell, that temporarily speedups the friendly wizard with Id equal to `move.statusTargetId`
     * or the caster himself if the game engine can not find such wizard.
     * $(BR)
     * Requires the `Haste` skill and `game.hasteManacost` manapoints.
     */
    Haste,

    /**
     * Cast a shield spell, that temporarily protects the friendly wizard with Id equal to `move.statusTargetId`
     * or the caster himself if the game engine can not find such wizard.
     * $(BR)
     * Requires the `Shield` skill and `game.shieldManacost` manapoints.
     */
    Shield
}
