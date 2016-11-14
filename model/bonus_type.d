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
     * Dramatically increases the damage of ranged and melee attacks for some time.
     */
    Empower,

    /**
     * Grants the `Hastened` status to the wizard.
     * $(BR)
     * Duration of the status is longer than usually.
     */
    Haste,

    /**
     * Grants the `Shielded` status to the wizard.
     * $(BR)
     * Duration of the status is longer than usually.
     */
    Shield
}
