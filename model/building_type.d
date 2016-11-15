module model.building_type;

import model.faction;
import model.building;

/**
 * Building type.
 */
enum BuildingType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * Guardian tower.
     */
    guardianTower,

    /**
     * Faction base.
     */
    factionBase
}
