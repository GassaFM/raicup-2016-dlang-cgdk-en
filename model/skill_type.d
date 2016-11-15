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
     * Default value.
     */
    unknown = -1,

    /**
     * Passive skill. Increases cast range by `game.rangeBonusPerSkillLevel`.
     */
    rangeBonusPassive1,

    /**
     * Aura. Increases cast range by `game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `rangeBonusPassive1`.
     */
    rangeBonusAura1,

    /**
     * Passive skill. Increases cast range by `2.0 * game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `rangeBonusAura1`.
     */
    rangeBonusPassive2,

    /**
     * Aura. Increases cast range by `2.0 * game.rangeBonusPerSkillLevel`.
     * $(BR)
     * Requires `rangeBonusPassive2`.
     */
    rangeBonusAura2,

    /**
     * Passive skill. Removes the `magicMissile` spell delay.
     * The common action delay `game.wizardActionCooldownTicks` still applies.
     * $(BR)
     * Requires `rangeBonusAura2`.
     */
    advancedMagicMissile,

    /**
     * Passive skill. Increases instant magical damage by `game.magicalDamageBonusPerSkillLevel`.
     */
    magicalDamageBonusPassive1,

    /**
     * Aura. Increases instant magical damage by `game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageBonusPassive1`.
     */
    magicalDamageBonusAura1,

    /**
     * Passive skill. Increases instant magical damage by `2.0 * game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageBonusAura1`.
     */
    magicalDamageBonusPassive2,

    /**
     * Aura. Increases instant magical damage by `2.0 * game.magicalDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageBonusPassive2`.
     */
    magicalDamageBonusAura2,

    /**
     * Active skill. A wizard can now use the `frostBolt` spell.
     * $(BR)
     * Requires `magicalDamageBonusAura2`.
     */
    frostBolt,

    /**
     * Passive skill. Increases staff damage by `game.staffDamageBonusPerSkillLevel`.
     */
    staffDamageBonusPassive1,

    /**
     * Aura. Increases staff damage by  `game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `staffDamageBonusPassive1`.
     */
    staffDamageBonusAura1,

    /**
     * Passive skill. Increases staff damage by `2.0 * game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `staffDamageBonusAura1`.
     */
    staffDamageBonusPassive2,

    /**
     * Aura. Increases staff damage by `2.0 * game.staffDamageBonusPerSkillLevel`.
     * $(BR)
     * Requires `staffDamageBonusPassive2`.
     */
    staffDamageBonusAura2,

    /**
     * Active skill. A wizard can now use the `fireball` spell.
     * $(BR)
     * Requires `staffDamageBonusAura2`.
     */
    fireball,

    /**
     * Passive skill. Increases movement speed by `1.0 + game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Summarily `movementBonusFactorPassive2` and `movementBonusFactorAura2` increase movement
     * speed by `1.0 + 4.0 * game.movementBonusFactorPerSkillLevel` times.
     */
    movementBonusFactorPassive1,

    /**
     * Aura. Increases movement speed by `1.0 + game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `movementBonusFactorPassive1`.
     */
    movementBonusFactorAura1,

    /**
     * Passive skill. Increases movement speed by `1.0 + 2.0 * game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `movementBonusFactorAura1`.
     */
    movementBonusFactorPassive2,

    /**
     * Aura. Increases movement speed by `1.0 + 2.0 * game.movementBonusFactorPerSkillLevel` times.
     * $(BR)
     * Requires `movementBonusFactorPassive2`.
     */
    movementBonusFactorAura2,

    /**
     * Active skill. A wizard can now use the `haste` spell.
     * $(BR)
     * Requires `movementBonusFactorAura2`.
     */
    haste,

    /**
     * Passive skill. Decreases received magical damage by `game.magicalDamageAbsorptionPerSkillLevel`.
     */
    magicalDamageAbsorptionPassive1,

    /**
     * Aura. Decreases received magical damage by `game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageAbsorptionPassive1`.
     */
    magicalDamageAbsorptionAura1,

    /**
     * Passive skill. Decreases received magical damage by `2.0 * game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageAbsorptionAura1`.
     */
    magicalDamageAbsorptionPassive2,

    /**
     * Aura. Decreases received magical damage by `2.0 * game.magicalDamageAbsorptionPerSkillLevel`.
     * $(BR)
     * Requires `magicalDamageAbsorptionPassive2`.
     */
    magicalDamageAbsorptionAura2,

    /**
     * Active skill. A wizard can now use the `shield` spell.
     * $(BR)
     * Requires `magicalDamageAbsorptionAura2`.
     */
    shield
}
