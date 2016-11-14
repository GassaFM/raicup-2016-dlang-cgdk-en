module model.faction;

import model.unit;

/**
 * Unit or player faction.
 */
enum Faction : byte
{
    /**
     * Wizards, minions and buildings of Academy.
     */
    Academy,

    /**
     * Wizards, minions and buildings of Renegades.
     */
    Renegades,

    /**
     * Neutral units. Do not attack first, but will strike back when damaged.
     */
    Neutral,

    /**
     * All other units in the game world.
     */
    Other
}
