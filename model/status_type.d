module model.status_type;

import model.status;

/**
 * Status type.
 */
enum StatusType : byte
{
    /**
     * A living unit receives some damage each time tick.
     */
    Burning,

    /**
     * A living unit inflicts more damage than usually, excluding Dot (damage over time).
     */
    Empowered,

    /**
     * A living unit can not move or perform any actions.
     */
    Frozen,

    /**
     * A living unit has increased move and turn speed.
     */
    Hastened,

    /**
     * A living unit receives less damage than usually, excluding Dot (damage over time).
     */
    Shielded
}
