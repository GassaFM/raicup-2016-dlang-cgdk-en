module model.game;

/**
 * An instance of this class contains all game constants.
 */
immutable class Game
{
nothrow pure @safe @nogc:

    /**
     * Returns: the number that your strategy may use to initialize a generator of random numbers.
     */
    long randomSeed;
    /**
     * Returns: the base game duration in ticks. A real game duration may be lower. Equals to `world.tickCount`.
     */
    int tickCount;
    /**
     * Returns: the size (both width and height) of the map.
     */
    double mapSize;
    /**
     * Returns: `true` if and only if the wizards in this game can gain new levels and learn skills.
     */
    bool skillsEnabled;
    /**
     * Returns: `true` if and only if the master wizards in this game can send raw messages.
     */
    bool rawMessagesEnabled;
    /**
     * Returns: Returns the damage part dealt by the wizards one faction to each other as a result of friendly fire.
     * $(BR)
     * The value depends on the game mode, but is always in range of `0.0` to `1.0`.
     * $(BR)
     * Regardless of the game mode, wizards can not damage friendly minions and buildings.
     */
    double friendlyFireDamageFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for the damage dealt to the opposite faction
     * buildings.
     */
    double buildingDamageScoreFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for destroying the opposite faction building.
     * $(BR)
     * Applies to the maximal amount of building's hitpoints.
     */
    double buildingEliminationScoreFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for the damage dealt to the other faction
     * minions.
     */
    double minionDamageScoreFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for killing the other faction minion.
     * $(BR)
     * Applies to the maximal amount of minion's hitpoints.
     */
    double minionEliminationScoreFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for the damage dealt to the opposite faction
     * wizards.
     */
    double wizardDamageScoreFactor;
    /**
     * Returns: the factor of the experience points gained by the wizard for killing the opposite faction wizard.
     * $(BR)
     * Applies to the maximal amount of wizard's hitpoints.
     */
    double wizardEliminationScoreFactor;
    /**
     * Returns: the experience multiplier applied in case, if the enemy unit died near two or more friendly wizards.
     * $(BR)
     * After applying this multiplier, the amount of the experience is rounded down.
     */
    double teamWorkingScoreFactor;
    /**
     * Returns: the amount of experience points received by each player of the faction in case of victory.
     */
    int victoryScore;
    /**
     * Returns: the maximal range, at which a wizard gains experience points in case, if a friendly unit kills an other
     * faction unit.
     * $(BR)
     * The experience is evenly distributed between all the wizards not farther than `scoreGainRange` from a
     * killed unit, and the killer unit if he is also a wizard.
     * $(BR)
     * If the damage is not fatal, this parameter is not used. If the attacker is a wizard, than the experience
     * completely goes to this wizard. If the attacker is a minion or a building, nobody gains an experience.
     * $(BR)
     * The range is considered as the range between units' centers.
     */
    double scoreGainRange;
    /**
     * Returns: the maximal possible length of a raw message.
     * $(BR)
     * If a message has higher length, then it will be completely ignored.
     */
    int rawMessageMaxLength;
    /**
     * Returns: the raw message transmission speed.
     * $(BR)
     * If the raw message is empty, the addressee will receive it in the next game tick. In other case, the time of
     * receipt of the message will be delayed for `ceil (message.rawMessage.length / rawMessageTransmissionSpeed)`
     * game ticks.
     */
    double rawMessageTransmissionSpeed;
    /**
     * Returns: the radius of a wizard.
     */
    double wizardRadius;
    /**
     * Returns: the base cast range of a wizard.
     * $(BR)
     * The effective cast range (`wizard.castRange`) may be higher depending on skills of the wizard and auras of
     * nearby friendly wizards.
     */
    double wizardCastRange;
    /**
     * Returns: the maximal range (between units' centers), at which a wizard can detect other units.
     */
    double wizardVisionRange;
    /**
     * Returns: the base limit of wizard's forward speed.
     * $(BR)
     * The effective forward speed may be higher depending on skills of the wizard and auras of nearby friendly
     * wizards. The `hastened` status can also greatly speed up a wizard.
     */
    double wizardForwardSpeed;
    /**
     * Returns: the base limit of wizard's backward speed.
     * $(BR)
     * The effective backward speed may be higher depending on skills of the wizard and auras of nearby friendly
     * wizards. The `hastened` status can also greatly speed up a wizard.
     */
    double wizardBackwardSpeed;
    /**
     * Returns: the base limit of wizard's strafe speed.
     * $(BR)
     * The effective strafe speed may be higher depending on skills of the wizard and auras of nearby friendly
     * wizards. The `hastened` status can also greatly speed up a wizard.
     */
    double wizardStrafeSpeed;
    /**
     * Returns: the maximal amount of wizard's hitpoints at initial level.
     */
    int wizardBaseLife;
    /**
     * Returns: the growth of wizard's hitpoints per level.
     */
    int wizardLifeGrowthPerLevel;
    /**
     * Returns: the maximal amount of wizard's manapoints at initial level.
     */
    int wizardBaseMana;
    /**
     * Returns: the growth of wizard's manapoints per level.
     */
    int wizardManaGrowthPerLevel;
    /**
     * Returns: the regeneration speed of wizard's hitpoints at initial level.
     */
    double wizardBaseLifeRegeneration;
    /**
     * Returns: the growth of the regeneration speed of wizard's hitpoints.
     */
    double wizardLifeRegenerationGrowthPerLevel;
    /**
     * Returns: the regeneration speed of wizard's manapoints at initial level.
     */
    double wizardBaseManaRegeneration;
    /**
     * Returns: the growth of the regeneration speed of wizard's manapoints.
     */
    double wizardManaRegenerationGrowthPerLevel;
    /**
     * Returns: the base limit of wizard's turn speed.
     * $(BR)
     * The `hastened` status increases this limit by `1.0 + hastenedRotationBonusFactor` times.
     */
    double wizardMaxTurnAngle;
    /**
     * Returns: the maximal possible delay of a wizard's revival.
     */
    int wizardMaxResurrectionDelayTicks;
    /**
     * Returns: the minimal possible delay of a wizard's revival.
     */
    int wizardMinResurrectionDelayTicks;
    /**
     * Returns: the minimal possible interval between any two actions of a wizard.
     */
    int wizardActionCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two staff attacks.
     */
    int staffCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two ``Magic missile'' spell casts.
     */
    int magicMissileCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two ``Frost bolt'' spell casts.
     */
    int frostBoltCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two ``Fireball'' spell casts.
     */
    int fireballCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two ``Haste'' spell casts.
     */
    int hasteCooldownTicks;
    /**
     * Returns: the minimal possible interval between any two ``Shield'' spell casts.
     */
    int shieldCooldownTicks;
    /**
     * Returns: the ``Magic missile'' spell manacost.
     */
    int magicMissileManacost;
    /**
     * Returns: the ``Frost bolt'' spell manacost.
     */
    int frostBoltManacost;
    /**
     * Returns: the ``Fireball'' spell manacost.
     */
    int fireballManacost;
    /**
     * Returns: the ``Haste'' spell manacost.
     */
    int hasteManacost;
    /**
     * Returns: the ``Shield'' spell manacost.
     */
    int shieldManacost;
    /**
     * Returns: the base staff damage.
     * $(BR)
     * The effective damage may be higher depending on skills of the wizard and auras of nearby friendly wizards.
     */
    int staffDamage;
    /**
     * Returns: the wizard's staff sector.
     * $(BR)
     * A staff attack damages all living units in a sector of `-staffSector / 2.0` to `staffSector / 2.0`.
     * This also applies to the status spells and to the relative projectile angle.
     */
    double staffSector;
    /**
     * Returns: the wizard's staff range.
     * $(BR)
     * A staff attack damages all living units if the distance between wizard's and target's centers is not greater than
     * `staffRange + livingUnit.radius`.
     */
    double staffRange;
    /**
     * Returns: the non-negative integers.
     * $(BR)
     * The numbers of items is equal to the number of levels a wizard can gain. An item `N` mean a number of
     * experience points a wizard of level `N` should get to reach the next level. Thus, the amount of experience
     * required for the zero level wizard to get to the level `N`, is the sum of the first `N` elements.
     */
    int [] levelUpXpValues;
    /**
     * Returns: the radius of a minion.
     */
    double minionRadius;
    /**
     * Returns: the maximal range (between units' centers), at which a minion can detect other units.
     */
    double minionVisionRange;
    /**
     * Returns: the forward speed of a minion.
     * $(BR)
     * A minion can not strafe or move backward.
     */
    double minionSpeed;
    /**
     * Returns: the maximal turn speed of a minion.
     */
    double minionMaxTurnAngle;
    /**
     * Returns: the maximal amount of minion's hitpoints.
     */
    int minionLife;
    /**
     * Returns: the interval at which appear the minions of the two opposing factions (`academy` and
     * `renegades`).
     * $(BR)
     * The minions of each of these factions appear in three groups near their base (one group per lane). Each group
     * consists of three orcs and one fetish. The minions immediately begin to advance on their lane toward the opposite
     * faction base, attacking all enemies in their path.
     */
    int factionMinionAppearanceIntervalTicks;
    /**
     * Returns: the minimal possible interval between any two attacks of an orc.
     */
    int orcWoodcutterActionCooldownTicks;
    /**
     * Returns: the damage of one attack of an orc.
     */
    int orcWoodcutterDamage;
    /**
     * Returns: the orc's axe sector.
     * $(BR)
     * An axe attack damages all living units in a sector of `-orcWoodcutterAttackSector / 2.0` to
     * `orcWoodcutterAttackSector / 2.0`.
     */
    double orcWoodcutterAttackSector;
    /**
     * Returns: the orc's axe range.
     * $(BR)
     * An axe attack damages all living units if the distance between orc's and target's centers is not greater than
     * `orcWoodcutterAttackRange + livingUnit.radius`.
     */
    double orcWoodcutterAttackRange;
    /**
     * Returns: the minimal possible interval between any two attacks of a fetish.
     */
    int fetishBlowdartActionCooldownTicks;
    /**
     * Returns: the maximal dart fly range.
     */
    double fetishBlowdartAttackRange;
    /**
     * Returns: the dart throw sector.
     * $(BR)
     * The relative angle of a dart is in range of `-fetishBlowdartAttackSector / 2.0` to
     * `fetishBlowdartAttackSector / 2.0`.
     */
    double fetishBlowdartAttackSector;
    /**
     * Returns: the radius of a bonus.
     */
    double bonusRadius;
    /**
     * Returns: the interval at which appears a bonus.
     * $(BR)
     * Every $2500$ ticks up to two bonuses may appear on the map. The bonuses are created at the two following points:
     * (`mapSize * 0.3`, `mapSize * 0.3`) and (`mapSize * 0.7`, `mapSize * 0.7`). If any part of
     * the new bonus area is already occupied by a wizard or by an existing bonus, then the creation of the bonus will
     * be postponed till the end of the next interval.
     */
    int bonusAppearanceIntervalTicks;
    /**
     * Returns: the amount of score and experience points for taking a bonus.
     */
    int bonusScoreAmount;
    /**
     * Returns: the radius of a dart.
     */
    double dartRadius;
    /**
     * Returns: the dart speed.
     */
    double dartSpeed;
    /**
     * Returns: the dart damage.
     */
    int dartDirectDamage;
    /**
     * Returns: the radius of a magic missile projectile.
     */
    double magicMissileRadius;
    /**
     * Returns: the magic missile projectile speed.
     */
    double magicMissileSpeed;
    /**
     * Returns: the magic missile projectile damage.
     */
    int magicMissileDirectDamage;
    /**
     * Returns: the radius of a frost bolt projectile.
     */
    double frostBoltRadius;
    /**
     * Returns: the frost bolt projectile speed.
     */
    double frostBoltSpeed;
    /**
     * Returns: the frost bolt projectile damage.
     */
    int frostBoltDirectDamage;
    /**
     * Returns: the radius of a fireball projectile.
     */
    double fireballRadius;
    /**
     * Returns: the fireball projectile speed.
     */
    double fireballSpeed;
    /**
     * Returns: the radius of the area in which living units are taking maximal damage from the fireball projectile
     * explosion.
     * See_Also: #getFireballExplosionMaxDamage ()
     */
    double fireballExplosionMaxDamageRange;
    /**
     * Returns: the radius of the area in which living units are taking any damage from the fireball projectile
     * explosion.
     * See_Also: #getFireballExplosionMaxDamage ()
     */
    double fireballExplosionMinDamageRange;
    /**
     * Returns: the damage of the fireball at the epicenter of the explosion.
     * $(BR)
     * A living unit takes the `fireballExplosionMaxDamage` if the distance from the center of the explosion to
     * the nearest point of this unit does not exceed the `fireballExplosionMaxDamageRange`. As you increase the
     * distance to the `fireballExplosionMinDamageRange`, the damage of the fireball decreases in a linear manner
     * and reaches `fireballExplosionMinDamage`. If the distance from the center of the explosion to the nearest
     * point of the living unit exceeds `fireballExplosionMinDamageRange`, this unit takes no damage.
     * $(BR)
     * If a living unit takes any damage from the fireball explosion, it receives a `burning` status.
     */
    int fireballExplosionMaxDamage;
    /**
     * Returns: the damage of the fireball on the periphery of the explosion.
     * See_Also: #getFireballExplosionMaxDamage ()
     */
    int fireballExplosionMinDamage;
    /**
     * Returns: the radius of a guardian tower.
     */
    double guardianTowerRadius;
    /**
     * Returns: the maximal range (between units' centers), at which a guardian tower can detect other units.
     */
    double guardianTowerVisionRange;
    /**
     * Returns: the maximal amount of guardian tower's hitpoints.
     */
    double guardianTowerLife;
    /**
     * Returns: the maximal range (between units' centers), at which a guardian tower can attack other units.
     */
    double guardianTowerAttackRange;
    /**
     * Returns: the damage of one attack of a guardian tower.
     */
    int guardianTowerDamage;
    /**
     * Returns: the minimal possible interval between any two attacks of a guardian tower.
     */
    int guardianTowerCooldownTicks;
    /**
     * Returns: the radius of a faction base.
     */
    double factionBaseRadius;
    /**
     * Returns: the maximal range (between units' centers), at which a faction base can detect other units.
     */
    double factionBaseVisionRange;
    /**
     * Returns: the maximal amount of faction base's hitpoints.
     */
    double factionBaseLife;
    /**
     * Returns: the maximal range (between units' centers), at which a faction base can attack other units.
     */
    double factionBaseAttackRange;
    /**
     * Returns: the damage of one attack of a faction base.
     */
    int factionBaseDamage;
    /**
     * Returns: the minimal possible interval between any two attacks of a faction base.
     */
    int factionBaseCooldownTicks;
    /**
     * Returns: the duration of the `burning` status.
     */
    int burningDurationTicks;
    /**
     * Returns: the total damage of the `burning` status.
     */
    int burningSummaryDamage;
    /**
     * Returns: the duration of the `empowered` status.
     */
    int empoweredDurationTicks;
    /**
     * Returns: the damage multiplier of empowered living unit. dot (damage over time) is excluded.
     */
    double empoweredDamageFactor;
    /**
     * Returns: the duration of the `frozen` status.
     */
    int frozenDurationTicks;
    /**
     * Returns: the duration of the `hastened` status.
     */
    int hastenedDurationTicks;
    /**
     * Returns: the `hastened` status duration multiplier (in case of taking a bonus).
     */
    double hastenedBonusDurationFactor;
    /**
     * Returns: the relative move speed boost of a hastened unit.
     * $(BR)
     * The maximal possible wizard speed is
     * `1.0 + 4.0 * movementBonusFactorPerSkillLevel + hastenedMovementBonusFactor` of the base speed.
     */
    double hastenedMovementBonusFactor;
    /**
     * Returns: the relative turn speed boost of a hastened unit.
     */
    double hastenedRotationBonusFactor;
    /**
     * Returns: the `shielded` duration.
     */
    int shieldedDurationTicks;
    /**
     * Returns: the `shielded` status duration multiplier (in case of taking a bonus).
     */
    double shieldedBonusDurationFactor;
    /**
     * Returns: the damage part absorbed by shield. dot (damage over time) is excluded.
     */
    double shieldedDirectDamageAbsorptionFactor;
    /**
     * Returns: the range of an aura skill.
     */
    double auraSkillRange;
    /**
     * Returns: the absolute increase of the wizard cast range for each learned skill, which is one of the
     * prerequisites of the `advancedMagicMissile` skill.
     */
    double rangeBonusPerSkillLevel;
    /**
     * Returns: the absolute increase of the wizard spell damage for each learned skill, which is one of the
     * prerequisites of the `frostBolt` skill. dot (damage over time) is excluded.
     */
    int magicalDamageBonusPerSkillLevel;
    /**
     * Returns: the absolute increase of the wizard staff damage for each learned skill, which is one of the
     * prerequisites of the `fireball` skill.
     */
    int staffDamageBonusPerSkillLevel;
    /**
     * Returns: the relative increase of the move speed for each learned skill, which is one of the
     * prerequisites of the `haste` skill.
     * $(BR)
     * The maximal possible wizard speed is
     * `1.0 + 4.0 * movementBonusFactorPerSkillLevel + hastenedMovementBonusFactor` of the base speed.
     */
    double movementBonusFactorPerSkillLevel;
    /**
     * Returns: the absolute decrease of the incoming magical damage for each learned skill, which is one of the
     * prerequisites of the `shield` skill. dot (damage over time) is excluded.
     */
    int magicalDamageAbsorptionPerSkillLevel;

    this (
        long randomSeed,
        int tickCount,
        double mapSize,
        bool skillsEnabled,
        bool rawMessagesEnabled,
        double friendlyFireDamageFactor,
        double buildingDamageScoreFactor,
        double buildingEliminationScoreFactor,
        double minionDamageScoreFactor,
        double minionEliminationScoreFactor,
        double wizardDamageScoreFactor,
        double wizardEliminationScoreFactor,
        double teamWorkingScoreFactor,
        int victoryScore,
        double scoreGainRange,
        int rawMessageMaxLength,
        double rawMessageTransmissionSpeed,
        double wizardRadius,
        double wizardCastRange,
        double wizardVisionRange,
        double wizardForwardSpeed,
        double wizardBackwardSpeed,
        double wizardStrafeSpeed,
        int wizardBaseLife,
        int wizardLifeGrowthPerLevel,
        int wizardBaseMana,
        int wizardManaGrowthPerLevel,
        double wizardBaseLifeRegeneration,
        double wizardLifeRegenerationGrowthPerLevel,
        double wizardBaseManaRegeneration,
        double wizardManaRegenerationGrowthPerLevel,
        double wizardMaxTurnAngle,
        int wizardMaxResurrectionDelayTicks,
        int wizardMinResurrectionDelayTicks,
        int wizardActionCooldownTicks,
        int staffCooldownTicks,
        int magicMissileCooldownTicks,
        int frostBoltCooldownTicks,
        int fireballCooldownTicks,
        int hasteCooldownTicks,
        int shieldCooldownTicks,
        int magicMissileManacost,
        int frostBoltManacost,
        int fireballManacost,
        int hasteManacost,
        int shieldManacost,
        int staffDamage,
        double staffSector,
        double staffRange,
        immutable int [] levelUpXpValues,
        double minionRadius,
        double minionVisionRange,
        double minionSpeed,
        double minionMaxTurnAngle,
        int minionLife,
        int factionMinionAppearanceIntervalTicks,
        int orcWoodcutterActionCooldownTicks,
        int orcWoodcutterDamage,
        double orcWoodcutterAttackSector,
        double orcWoodcutterAttackRange,
        int fetishBlowdartActionCooldownTicks,
        double fetishBlowdartAttackRange,
        double fetishBlowdartAttackSector,
        double bonusRadius,
        int bonusAppearanceIntervalTicks,
        int bonusScoreAmount,
        double dartRadius,
        double dartSpeed,
        int dartDirectDamage,
        double magicMissileRadius,
        double magicMissileSpeed,
        int magicMissileDirectDamage,
        double frostBoltRadius,
        double frostBoltSpeed,
        int frostBoltDirectDamage,
        double fireballRadius,
        double fireballSpeed,
        double fireballExplosionMaxDamageRange,
        double fireballExplosionMinDamageRange,
        int fireballExplosionMaxDamage,
        int fireballExplosionMinDamage,
        double guardianTowerRadius,
        double guardianTowerVisionRange,
        double guardianTowerLife,
        double guardianTowerAttackRange,
        int guardianTowerDamage,
        int guardianTowerCooldownTicks,
        double factionBaseRadius,
        double factionBaseVisionRange,
        double factionBaseLife,
        double factionBaseAttackRange,
        int factionBaseDamage,
        int factionBaseCooldownTicks,
        int burningDurationTicks,
        int burningSummaryDamage,
        int empoweredDurationTicks,
        double empoweredDamageFactor,
        int frozenDurationTicks,
        int hastenedDurationTicks,
        double hastenedBonusDurationFactor,
        double hastenedMovementBonusFactor,
        double hastenedRotationBonusFactor,
        int shieldedDurationTicks,
        double shieldedBonusDurationFactor,
        double shieldedDirectDamageAbsorptionFactor,
        double auraSkillRange,
        double rangeBonusPerSkillLevel,
        int magicalDamageBonusPerSkillLevel,
        int staffDamageBonusPerSkillLevel,
        double movementBonusFactorPerSkillLevel,
        int magicalDamageAbsorptionPerSkillLevel)
    {
        this.randomSeed = randomSeed;
        this.tickCount = tickCount;
        this.mapSize = mapSize;
        this.skillsEnabled = skillsEnabled;
        this.rawMessagesEnabled = rawMessagesEnabled;
        this.friendlyFireDamageFactor = friendlyFireDamageFactor;
        this.buildingDamageScoreFactor = buildingDamageScoreFactor;
        this.buildingEliminationScoreFactor = buildingEliminationScoreFactor;
        this.minionDamageScoreFactor = minionDamageScoreFactor;
        this.minionEliminationScoreFactor = minionEliminationScoreFactor;
        this.wizardDamageScoreFactor = wizardDamageScoreFactor;
        this.wizardEliminationScoreFactor = wizardEliminationScoreFactor;
        this.teamWorkingScoreFactor = teamWorkingScoreFactor;
        this.victoryScore = victoryScore;
        this.scoreGainRange = scoreGainRange;
        this.rawMessageMaxLength = rawMessageMaxLength;
        this.rawMessageTransmissionSpeed = rawMessageTransmissionSpeed;
        this.wizardRadius = wizardRadius;
        this.wizardCastRange = wizardCastRange;
        this.wizardVisionRange = wizardVisionRange;
        this.wizardForwardSpeed = wizardForwardSpeed;
        this.wizardBackwardSpeed = wizardBackwardSpeed;
        this.wizardStrafeSpeed = wizardStrafeSpeed;
        this.wizardBaseLife = wizardBaseLife;
        this.wizardLifeGrowthPerLevel = wizardLifeGrowthPerLevel;
        this.wizardBaseMana = wizardBaseMana;
        this.wizardManaGrowthPerLevel = wizardManaGrowthPerLevel;
        this.wizardBaseLifeRegeneration = wizardBaseLifeRegeneration;
        this.wizardLifeRegenerationGrowthPerLevel = wizardLifeRegenerationGrowthPerLevel;
        this.wizardBaseManaRegeneration = wizardBaseManaRegeneration;
        this.wizardManaRegenerationGrowthPerLevel = wizardManaRegenerationGrowthPerLevel;
        this.wizardMaxTurnAngle = wizardMaxTurnAngle;
        this.wizardMaxResurrectionDelayTicks = wizardMaxResurrectionDelayTicks;
        this.wizardMinResurrectionDelayTicks = wizardMinResurrectionDelayTicks;
        this.wizardActionCooldownTicks = wizardActionCooldownTicks;
        this.staffCooldownTicks = staffCooldownTicks;
        this.magicMissileCooldownTicks = magicMissileCooldownTicks;
        this.frostBoltCooldownTicks = frostBoltCooldownTicks;
        this.fireballCooldownTicks = fireballCooldownTicks;
        this.hasteCooldownTicks = hasteCooldownTicks;
        this.shieldCooldownTicks = shieldCooldownTicks;
        this.magicMissileManacost = magicMissileManacost;
        this.frostBoltManacost = frostBoltManacost;
        this.fireballManacost = fireballManacost;
        this.hasteManacost = hasteManacost;
        this.shieldManacost = shieldManacost;
        this.staffDamage = staffDamage;
        this.staffSector = staffSector;
        this.staffRange = staffRange;
        this.levelUpXpValues = levelUpXpValues;
        this.minionRadius = minionRadius;
        this.minionVisionRange = minionVisionRange;
        this.minionSpeed = minionSpeed;
        this.minionMaxTurnAngle = minionMaxTurnAngle;
        this.minionLife = minionLife;
        this.factionMinionAppearanceIntervalTicks = factionMinionAppearanceIntervalTicks;
        this.orcWoodcutterActionCooldownTicks = orcWoodcutterActionCooldownTicks;
        this.orcWoodcutterDamage = orcWoodcutterDamage;
        this.orcWoodcutterAttackSector = orcWoodcutterAttackSector;
        this.orcWoodcutterAttackRange = orcWoodcutterAttackRange;
        this.fetishBlowdartActionCooldownTicks = fetishBlowdartActionCooldownTicks;
        this.fetishBlowdartAttackRange = fetishBlowdartAttackRange;
        this.fetishBlowdartAttackSector = fetishBlowdartAttackSector;
        this.bonusRadius = bonusRadius;
        this.bonusAppearanceIntervalTicks = bonusAppearanceIntervalTicks;
        this.bonusScoreAmount = bonusScoreAmount;
        this.dartRadius = dartRadius;
        this.dartSpeed = dartSpeed;
        this.dartDirectDamage = dartDirectDamage;
        this.magicMissileRadius = magicMissileRadius;
        this.magicMissileSpeed = magicMissileSpeed;
        this.magicMissileDirectDamage = magicMissileDirectDamage;
        this.frostBoltRadius = frostBoltRadius;
        this.frostBoltSpeed = frostBoltSpeed;
        this.frostBoltDirectDamage = frostBoltDirectDamage;
        this.fireballRadius = fireballRadius;
        this.fireballSpeed = fireballSpeed;
        this.fireballExplosionMaxDamageRange = fireballExplosionMaxDamageRange;
        this.fireballExplosionMinDamageRange = fireballExplosionMinDamageRange;
        this.fireballExplosionMaxDamage = fireballExplosionMaxDamage;
        this.fireballExplosionMinDamage = fireballExplosionMinDamage;
        this.guardianTowerRadius = guardianTowerRadius;
        this.guardianTowerVisionRange = guardianTowerVisionRange;
        this.guardianTowerLife = guardianTowerLife;
        this.guardianTowerAttackRange = guardianTowerAttackRange;
        this.guardianTowerDamage = guardianTowerDamage;
        this.guardianTowerCooldownTicks = guardianTowerCooldownTicks;
        this.factionBaseRadius = factionBaseRadius;
        this.factionBaseVisionRange = factionBaseVisionRange;
        this.factionBaseLife = factionBaseLife;
        this.factionBaseAttackRange = factionBaseAttackRange;
        this.factionBaseDamage = factionBaseDamage;
        this.factionBaseCooldownTicks = factionBaseCooldownTicks;
        this.burningDurationTicks = burningDurationTicks;
        this.burningSummaryDamage = burningSummaryDamage;
        this.empoweredDurationTicks = empoweredDurationTicks;
        this.empoweredDamageFactor = empoweredDamageFactor;
        this.frozenDurationTicks = frozenDurationTicks;
        this.hastenedDurationTicks = hastenedDurationTicks;
        this.hastenedBonusDurationFactor = hastenedBonusDurationFactor;
        this.hastenedMovementBonusFactor = hastenedMovementBonusFactor;
        this.hastenedRotationBonusFactor = hastenedRotationBonusFactor;
        this.shieldedDurationTicks = shieldedDurationTicks;
        this.shieldedBonusDurationFactor = shieldedBonusDurationFactor;
        this.shieldedDirectDamageAbsorptionFactor = shieldedDirectDamageAbsorptionFactor;
        this.auraSkillRange = auraSkillRange;
        this.rangeBonusPerSkillLevel = rangeBonusPerSkillLevel;
        this.magicalDamageBonusPerSkillLevel = magicalDamageBonusPerSkillLevel;
        this.staffDamageBonusPerSkillLevel = staffDamageBonusPerSkillLevel;
        this.movementBonusFactorPerSkillLevel = movementBonusFactorPerSkillLevel;
        this.magicalDamageAbsorptionPerSkillLevel = magicalDamageAbsorptionPerSkillLevel;
    }
}
