module model.faction;

import model.unit;

/**
 * Unit or player faction.
 */
enum Faction : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * Wizards, minions and buildings of Academy.
     */
    academy,

    /**
     * Wizards, minions and buildings of Renegades.
     */
    renegades,

    /**
     * Neutral units. Do not attack first, but will strike back when damaged.
     */
    neutral,

    /**
     * All other units in the game world.
     */
    other
}
