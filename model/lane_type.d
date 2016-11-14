module model.lane_type;

/**
 * Lane type.
 */
enum LaneType : byte
{
    /**
     * Top lane. It goes through the lower left, the upper left and the upper right corners of the map.
     */
    Top,

    /**
     * Middle lane. Directly connects the lower left and the upper right corners of the map.
     */
    Middle,

    /**
     * Bottom lane. It goes through the lower left, the lower right and the upper right corners of the map.
     */
    Bottom
}
