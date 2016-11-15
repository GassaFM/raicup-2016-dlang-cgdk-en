module model.status;

import model.status_type;

/**
 * A magical status, affecting living unit.
 */
immutable class Status
{
    /**
     * Returns: the unique status id.
     */
    long id;
    /**
     * Returns: the status type.
     */
    StatusType type;
    /**
     * Returns: the id of the wizard casted this status or `-1`.
     */
    long wizardId;
    /**
     * Returns: the id of the player, which unit casted this status, or `-1`.
     */
    long playerId;
    /**
     * Returns: the remaining status duration.
     */
    int remainingDurationTicks;

    this (
        long id,
        immutable StatusType type,
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
