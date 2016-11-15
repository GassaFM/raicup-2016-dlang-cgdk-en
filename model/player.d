module model.player;

import model.faction;

/**
 * The instance of this class contains all the data about player state.
 */
immutable class Player
{
nothrow pure @safe @nogc:

    /**
     * Returns: the unique player id.
     */
    long id;
    /**
     * Returns: `true` if and only if this is your player.
     */
    bool me;
    /**
     * Returns: the name of the player.
     */
    string name;
    /**
     * Returns: `true` if and only if the strategy of this player is crashed.
     */
    bool strategyCrashed;
    /**
     * Returns: the amount of score points.
     */
    int score;
    /**
     * Returns: the faction of this player.
     */
    Faction faction;

    this (
        long id,
        bool me,
        string name,
        bool strategyCrashed,
        int score,
        immutable Faction faction)
    {
        this.id = id;
        this.me = me;
        this.name = name;
        this.strategyCrashed = strategyCrashed;
        this.score = score;
        this.faction = faction;
    }
}
