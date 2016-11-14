module model.message;

import model.skill_type;
import model.lane_type;

/**
 * This class describes a message, that master wizard can send to other wizards of his faction.
 * $(BR)
 * The message is sent personally to each wizard. Other wizards are unable to intercept him.
 * $(BR)
 * The recipient receives the message in the next game tick or later, depending on the size of the message.
 * $(BR)
 * The wizard is free to ignore as any part of the message and the entire message, however this can lead to the defeat
 * of wizard's faction.
 */
class Message
{
    /**
     * Returns: the order to control the specified lane.
     */
    immutable LaneType lane;
    /**
     * Returns: the order to learn the specified skill.
     *
     * This skill may require to learn other skills or be unavailable for learning at the moment due to the low level.
     * The wizard should remember the order and move towards its achievement. The later the order, the higher the
     * priority.
     * $(BR)
     * The field value may not be available in all game modes.
     */
    immutable SkillType skillToLearn;
    /**
     * Returns: the text message in a forgotten ancient language.
     * $(BR)
     * The maximal message length is `game.rawMessageMaxLength`. The speed of sending a message depends on its
     * length. If the text part of the message is empty, the addressee will receive it in the next game tick. In other
     * case, the time of receipt of the message will be delayed for
     * `ceil (rawMessage.length / game.rawMessageTransmissionSpeed)` game ticks.
     * $(BR)
     * The field value may not be available in all game modes.
     */
    immutable byte [] rawMessage;

    immutable this (
        immutable (LaneType) lane,
        immutable (SkillType) skillToLearn,
        byte [] rawMessage)
    {
        this.lane = lane;
        this.skillToLearn = skillToLearn;
        this.rawMessage = rawMessage.idup;
    }
}
