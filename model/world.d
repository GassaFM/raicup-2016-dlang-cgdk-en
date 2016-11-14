module model.world;

import model.tree;
import model.wizard;
import model.player;
import model.building;
import model.bonus;
import model.minion;
import model.projectile;

/**
 * This class describes a game world. A world contains all players and game objects (``units'').
 */
class World
{
    /**
     * Returns: the current game tick.
     */
    immutable int tickIndex;
    /**
     * Returns: the base game duration in ticks. A real game duration may be lower. Equals to `game.tickCount`.
     */
    immutable int tickCount;
    /**
     * Returns: the world width.
     */
    immutable double width;
    /**
     * Returns: the world height.
     */
    immutable double height;
    /**
     * Returns: all players (in random order). After each tick the player objects are recreated.
     */
    immutable Player [] players;
    /**
     * Returns: visible wizards (in random order). After each tick the wizard objects are recreated.
     */
    immutable Wizard [] wizards;
    /**
     * Returns: visible minions (in random order). After each tick the minion objects are recreated.
     */
    immutable Minion [] minions;
    /**
     * Returns: visible projectiles (in random order). After each tick the projectile objects are recreated.
     */
    immutable Projectile [] projectiles;
    /**
     * Returns: visible bonuses (in random order). After each tick the bonus objects are recreated.
     */
    immutable Bonus [] bonuses;
    /**
     * Returns: visible buildings (in random order). After each tick the building objects are recreated.
     */
    immutable Building [] buildings;
    /**
     * Returns: visible trees (in random order). After each tick the tree objects are recreated.
     */
    immutable Tree [] trees;

    immutable this (
        int tickIndex,
        int tickCount,
        double width,
        double height,
        immutable (Player) [] players,
        immutable (Wizard) [] wizards,
        immutable (Minion) [] minions,
        immutable (Projectile) [] projectiles,
        immutable (Bonus) [] bonuses,
        immutable (Building) [] buildings,
        immutable (Tree) [] trees)
    {
        this.tickIndex = tickIndex;
        this.tickCount = tickCount;
        this.width = width;
        this.height = height;
        this.players = players.idup;
        this.wizards = wizards.idup;
        this.minions = minions.idup;
        this.projectiles = projectiles.idup;
        this.bonuses = bonuses.idup;
        this.buildings = buildings.idup;
        this.trees = trees.idup;
    }

    /**
     * Returns: your player.
     */
    immutable (Player) getMyPlayer () const
    {
        foreach (immutable player; players)
        {
            if (player.me)
            {
                return player;
            }
        }

        return null;
    }
}