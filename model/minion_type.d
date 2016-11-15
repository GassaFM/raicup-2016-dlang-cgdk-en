module model.minion_type;

import model.minion;

/**
 * Minion type.
 */
enum MinionType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * A melee fighter. No so strong as orc warrior, but still dangerous.
     */
    orcWoodcutter,

    /**
     * A magical creature with sharp darts.
     */
    fetishBlowdart
}
