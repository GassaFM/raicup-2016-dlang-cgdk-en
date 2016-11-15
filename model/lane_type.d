module model.lane_type;

/**
 * Lane type.
 */
enum LaneType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * Top lane. It goes through the lower left, the upper left and the upper right corners of the map.
     */
    top,

    /**
     * Middle lane. Directly connects the lower left and the upper right corners of the map.
     */
    middle,

    /**
     * Bottom lane. It goes through the lower left, the lower right and the upper right corners of the map.
     */
    bottom
}
