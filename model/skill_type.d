module model.skill_type;

/**
 * Skill type. In some game modes a wizard can not learn skills (see `game.skillsEnabled`).
 * $(BR)
 * There is three skill groups: active, passive and auras.
 * $(UL
 * $(LI
 * Active skills provide an ability to perform a new action, not available before.
 * )
 * $(LI
 * Passive skills are constantly improving some characteristic of the wizard for a certain value.
 * )
 * $(LI
 * Auras are constantly improving some characteristic of the wizard and all friendly wizards in the
 * `game.auraSkillRange`.
 * )
 * )
 */
enum SkillType : byte
{
    /**
     * Passive skill. Increases cast range by `game.rangeBonusPerSkillLevel`.
     */
    RangeBonusPassive1,

    /**
     * Aura. Increases cast range by `game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `RangeBonusPassive1`.
     */
    RangeBonusAura1,

    /**
     * Passive skill. Increases cast range by `2.0 * game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `RangeBonusAura1`.
     */
    RangeBonusPassive2,

    /**
     * Aura. Increases cast range by `2.0 * game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `RangeBonusPassive2`.
     */
    RangeBonusAura2,

    /**
     * Passive skill. Removes the `MagicMissile` spell delay.
     * The common action delay `game.wizardActionCooldownTicks` still applies.
     * $(BR)
     * Requires `RangeBonusAura2`.
     */
    AdvancedMagicMissile,

    /**
     * Passive skill. Increases instant magical damage by `game.magicalDamageBonusPerSkillLevel`.
     */
    MagicalDamageBonusPassive1,

    /**
     * Aura. Increases instant magical damage by `game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageBonusPassive1`.
     */
    MagicalDamageBonusAura1,

    /**
     * Passive skill. Increases instant magical damage by `2.0 * game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageBonusAura1`.
     */
    MagicalDamageBonusPassive2,

    /**
     * Aura. Increases instant magical damage by `2.0 * game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageBonusPassive2`.
     */
    MagicalDamageBonusAura2,

    /**
     * Active skill. A wizard can now use the `FrostBolt` spell.
     * $(BR)
     * Requires `MagicalDamageBonusAura2`.
     */
    FrostBolt,

    /**
     * Passive skill. Increases staff damage by `game.staffDamageBonusPerSkillLevel`.
     */
    StaffDamageBonusPassive1,

    /**
     * Aura. Increases staff damage by  `game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `StaffDamageBonusPassive1`.
     */
    StaffDamageBonusAura1,

    /**
     * Passive skill. Increases staff damage by `2.0 * game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `StaffDamageBonusAura1`.
     */
    StaffDamageBonusPassive2,

    /**
     * Aura. Increases staff damage by `2.0 * game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `StaffDamageBonusPassive2`.
     */
    StaffDamageBonusAura2,

    /**
     * Active skill. A wizard can now use the `Fireball` spell.
     * $(BR)
     * Requires `StaffDamageBonusAura2`.
     */
    Fireball,

    /**
     * Passive skill. Increases movement speed by `1.0 + game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Summarily `MovementBonusFactorPassive2` and `MovementBonusFactorAura2` increase movement
     * speed by `1.0 + 4.0 * game.movementBonusFactorPerSkillLevel` times.
     */
    MovementBonusFactorPassive1,

    /**
     * Aura. Increases movement speed by `1.0 + game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `MovementBonusFactorPassive1`.
     */
    MovementBonusFactorAura1,

    /**
     * Passive skill. Increases movement speed by `1.0 + 2.0 * game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `MovementBonusFactorAura1`.
     */
    MovementBonusFactorPassive2,

    /**
     * Aura. Increases movement speed by `1.0 + 2.0 * game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `MovementBonusFactorPassive2`.
     */
    MovementBonusFactorAura2,

    /**
     * Active skill. A wizard can now use the `Haste` spell.
     * $(BR)
     * Requires `MovementBonusFactorAura2`.
     */
    Haste,

    /**
     * Passive skill. Decreases received magical damage by `game.magicalDamageAbsorptionPerSkillLevel`.
     */
    MagicalDamageAbsorptionPassive1,

    /**
     * Aura. Decreases received magical damage by `game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageAbsorptionPassive1`.
     */
    MagicalDamageAbsorptionAura1,

    /**
     * Passive skill. Decreases received magical damage by `2.0 * game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageAbsorptionAura1`.
     */
    MagicalDamageAbsorptionPassive2,

    /**
     * Aura. Decreases received magical damage by `2.0 * game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `MagicalDamageAbsorptionPassive2`.
     */
    MagicalDamageAbsorptionAura2,

    /**
     * Active skill. A wizard can now use the `Shield` spell.
     * $(BR)
     * Requires `MagicalDamageAbsorptionAura2`.
     */
    Shield
}
