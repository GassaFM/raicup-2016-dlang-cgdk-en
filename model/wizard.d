module model.wizard;

import model.status;
import model.living_unit;
import model.skill_type;
import model.faction;
import model.message;

/**
 * This class is inherited from a living unit and describes a wizard.
 */
class Wizard : LivingUnit
{
    /**
     * Returns: the Id of the owner player.
     */
    immutable long ownerPlayerId;
    /**
     * Returns: `true` if and only if this wizard is your.
     */
    immutable bool me;
    /**
     * Returns: the current amount of manapoints.
     */
    immutable int mana;
    /**
     * Returns: the maximal amount of manapoints.
     */
    immutable int maxMana;
    /**
     * Returns: the maximal range (between units' centers), at which this wizard can detect other units.
     */
    immutable double visionRange;
    /**
     * Returns: the maximal cast range..
     */
    immutable double castRange;
    /**
     * Returns: the current amount of experience points.
     */
    immutable int xp;
    /**
     * Returns: the current wizard level.
     * $(BR)
     * Each wizard starts at level `0` and can level up up to `game.levelUpXpValues.length` times.
     * $(BR)
     * In some game modes a wizard can not gain new levels.
     */
    immutable int level;
    /**
     * Returns: the skills of this wizard.
     */
    immutable SkillType [] skills;
    /**
     * Returns: the amount of ticks remaining before any new action.
     * $(BR)
     * A wizard can perform the action `actionType` if and only if both `remainingActionCooldownTicks` and
     * `remainingCooldownTicksByAction[actionType.ordinal ()]` are equal to zero.
     */
    immutable int remainingActionCooldownTicks;
    /**
     * Returns: the non-negative integer numbers. Each item is equal to the amount of ticks remaining before the next
     * action with the corresponding index.
     * $(BR)
     * For example, `remainingCooldownTicksByAction[0]` corresponds to `None` action and always equal to
     * zero. `remainingCooldownTicksByAction[1]` corresponds to `Staff` action and equal to the amount of
     * ticks remaining before the next staff attack.
     * $(BR)
     * A wizard can perform the action `actionType` if and only if both `remainingActionCooldownTicks` and
     * `remainingCooldownTicksByAction[actionType.ordinal ()]` are equal to zero.
     */
    immutable int [] remainingCooldownTicksByAction;
    /**
     * Returns: `true` if and only if this wizard is master.
     * $(BR)
     * There is exactly one master wizard per faction.
     */
    immutable bool master;
    /**
     * Returns: the messages addressed to this wizard.
     * $(BR)
     * A strategy can only read messages of the controlling wizard.
     */
    immutable Message [] messages;

    immutable this (
        long id,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        immutable (Faction) faction,
        double radius,
        int life,
        int maxLife,
        immutable (Status) [] statuses,
        long ownerPlayerId,
        bool me,
        int mana,
        int maxMana,
        double visionRange,
        double castRange,
        int xp,
        int level,
        immutable (SkillType) [] skills,
        int remainingActionCooldownTicks,
        int [] remainingCooldownTicksByAction,
        bool master,
        immutable (Message) [] messages)
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
        this.skills = skills.idup;
        this.remainingActionCooldownTicks = remainingActionCooldownTicks;
        this.remainingCooldownTicksByAction = remainingCooldownTicksByAction.idup;
        this.master = master;
        this.messages = messages.idup;
    }
}
