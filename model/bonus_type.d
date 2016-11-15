module model.bonus_type;

import model.bonus;

/**
 * Bonus type.
 * $(BR)
 * Besides the primary effect each taken bonus gives `game.bonusScoreAmount` score points to the player. The
 * wizard gains the same amount as xp.
 */
enum BonusType : byte
{
    /**
     * Default value.
     */
    unknown = -1,

    /**
     * Dramatically increases the damage of ranged and melee attacks for some time.
     */
    empower,

    /**
     * Grants the `hastened` status to the wizard.
     * $(BR)
     * Duration of the status is longer than usually.
     */
    haste,

    /**
     * Grants the `shielded` status to the wizard.
     * $(BR)
     * Duration of the status is longer than usually.
     */
    shield
}
