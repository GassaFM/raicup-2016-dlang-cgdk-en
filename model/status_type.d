module model.status_type;

import model.status;

/**
 * Status type.
 */
enum StatusType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * A living unit receives some damage each time tick.
     */
    burning,

    /**
     * A living unit inflicts more damage than usually, excluding dot (damage over time).
     */
    empowered,

    /**
     * A living unit can not move or perform any actions.
     */
    frozen,

    /**
     * A living unit has increased move and turn speed.
     */
    hastened,

    /**
     * A living unit receives less damage than usually, excluding dot (damage over time).
     */
    shielded
}
