module model.player;

import model.faction;

/**
 * The instance of this class contains all the data about player state.
 */
class Player
{
    /**
     * Returns: the unique player Id.
     */
    immutable long id;
    /**
     * Returns: `true` if and only if this is your player.
     */
    immutable bool me;
    /**
     * Returns: the name of the player.
     */
    immutable string name;
    /**
     * Returns: `true` if and only if the strategy of this player is crashed.
     */
    immutable bool strategyCrashed;
    /**
     * Returns: the amount of score points.
     */
    immutable int score;
    /**
     * Returns: the faction of this player.
     */
    immutable Faction faction;

    immutable this (
        long id,
        bool me,
        string name,
        bool strategyCrashed,
        int score,
        immutable (Faction) faction)
    {
        this.id = id;
        this.me = me;
        this.name = name;
        this.strategyCrashed = strategyCrashed;
        this.score = score;
        this.faction = faction;
    }
}
