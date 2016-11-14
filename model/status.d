module model.status;

import model.status_type;

/**
 * A magical status, affecting living unit.
 */
class Status
{
    /**
     * Returns: the unique status Id.
     */
    immutable long id;
    /**
     * Returns: the status type.
     */
    immutable StatusType type;
    /**
     * Returns: the Id of the wizard casted this status or `-1`.
     */
    immutable long wizardId;
    /**
     * Returns: the Id of the player, which unit casted this status, or `-1`.
     */
    immutable long playerId;
    /**
     * Returns: the remaining status duration.
     */
    immutable int remainingDurationTicks;

    immutable this (
        long id,
        immutable (StatusType) type,
        long wizardId,
        long playerId,
        int remainingDurationTicks)
    {
        this.id = id;
        this.type = type;
        this.wizardId = wizardId;
        this.playerId = playerId;
        this.remainingDurationTicks = remainingDurationTicks;
    }
}
