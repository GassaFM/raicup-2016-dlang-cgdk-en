module model.wizard;

import model.status;
import model.living_unit;
import model.skill_type;
import model.faction;
import model.message;

/**
 * This class is inherited from a living unit and describes a wizard.
 */
immutable class Wizard : LivingUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the id of the owner player.
     */
    long ownerPlayerId;
    /**
     * Returns: `true` if and only if this wizard is your.
     */
    bool me;
    /**
     * Returns: the current amount of manapoints.
     */
    int mana;
    /**
     * Returns: the maximal amount of manapoints.
     */
    int maxMana;
    /**
     * Returns: the maximal range (between units' centers), at which this wizard can detect other units.
     */
    double visionRange;
    /**
     * Returns: the maximal cast range..
     */
    double castRange;
    /**
     * Returns: the current amount of experience points.
     */
    int xp;
    /**
     * Returns: the current wizard level.
     * $(BR)
     * Each wizard starts at level `0` and can level up up to `game.levelUpXpValues.length` times.
     * $(BR)
     * In some game modes a wizard can not gain new levels.
     */
    int level;
    /**
     * Returns: the skills of this wizard.
     */
    SkillType [] skills;
    /**
     * Returns: the amount of ticks remaining before any new action.
     * $(BR)
     * A wizard can perform the action `actionType` if and only if both `remainingActionCooldownTicks` and
     * `remainingCooldownTicksByAction[actionType.ordinal ()]` are equal to zero.
     */
    int remainingActionCooldownTicks;
    /**
     * Returns: the non-negative integer numbers. Each item is equal to the amount of ticks remaining before the next
     * action with the corresponding index.
     * $(BR)
     * For example, `remainingCooldownTicksByAction[0]` corresponds to `none` action and always equal to
     * zero. `remainingCooldownTicksByAction[1]` corresponds to `staff` action and equal to the amount of
     * ticks remaining before the next staff attack.
     * $(BR)
     * A wizard can perform the action `actionType` if and only if both `remainingActionCooldownTicks` and
     * `remainingCooldownTicksByAction[actionType.ordinal ()]` are equal to zero.
     */
    int [] remainingCooldownTicksByAction;
    /**
     * Returns: `true` if and only if this wizard is master.
     * $(BR)
     * There is exactly one master wizard per faction.
     */
    bool master;
    /**
     * Returns: the messages addressed to this wizard.
     * $(BR)
     * A strategy can only read messages of the controlling wizard.
     */
    Message [] messages;

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
        long ownerPlayerId,
        bool me,
        int mana,
        int maxMana,
        double visionRange,
        double castRange,
        int xp,
        int level,
        immutable SkillType [] skills,
        int remainingActionCooldownTicks,
        immutable int [] remainingCooldownTicksByAction,
        bool master,
        immutable Message [] messages)
    {
        super (id, x, y, speedX, speedY, angle, faction, radius, life, maxLife, statuses);

        this.ownerPlayerId = ownerPlayerId;
        this.me = me;
        this.mana = mana;
        this.maxMana = maxMana;
        this.visionRange = visionRange;
        this.castRange = castRange;
        this.xp = xp;
        this.level = level;
        this.skills = skills;
        this.remainingActionCooldownTicks = remainingActionCooldownTicks;
        this.remainingCooldownTicksByAction = remainingCooldownTicksByAction;
        this.master = master;
        this.messages = messages;
    }
}
