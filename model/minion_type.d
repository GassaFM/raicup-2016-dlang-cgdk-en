module model.minion_type;

import model.minion;

/**
 * Minion type.
 */
enum MinionType : byte
{
    /**
     * A melee fighter. No so strong as orc warrior, but still dangerous.
     */
    OrcWoodcutter,

    /**
     * A magical creature with sharp darts.
     */
    FetishBlowdart
}
