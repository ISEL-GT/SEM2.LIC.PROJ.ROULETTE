package com.github.iselgt.roulette.control

import com.github.iselgt.roulette.control.display.RouletteDisplay
import com.github.iselgt.roulette.control.state.Mode
import com.github.iselgt.roulette.credits
import com.github.iselgt.roulette.gamesPlayed
import com.github.iselgt.roulette.operatingMode
import com.github.iselgt.roulette.roll_history
import com.github.iselgt.roulette.saveStatistics
import isel.leic.utils.Time

object M {

    /**
     * Checks if the system is in maintenance mode.
     */
    fun isMaintenance() = HAL.isBit(Mode.MAINTENANCE.character.code)

    /**
     * This method is responsible for waiting for the user to press a key and checking if it's a valid mode.
     * If the key is not a valid mode, continue waiting.
     */
    fun waitForMaintenanceInput() {

        // Tracks whether we are displaying the number of games played and coins inserted
        var keyAPressed = false

        // Tracks whether we are displaying the history of rolled numbers
        var keyCPressed = false

        // Tracks whether we are turning off the machine for real
        var keyDPressed = false

        do {

            // Wait for the user to press a key and check if it's a valid mode
            val key = TUI.getKey()

            when (key) {

                // If the key is "A", show the number of games played and coins inserted
                'A' -> {
                    keyAPressed = true
                    keyCPressed = false
                    keyDPressed = false
                    TUI.writeMessage("GAMES: $gamesPlayed|COINS: $credits")
                }

                // If we click "*" after "A", we reset the counters for games and coins
                '*' -> {
                    if (keyAPressed) {
                        gamesPlayed = 0
                        credits = 0
                        TUI.writeMessage("GAME STATS|CLEARED")
                    }

                    else if (keyCPressed) {
                        roll_history.clear()
                        TUI.writeMessage("ROLL HISTORY|CLEARED")
                    }

                    // If we click "*" alone, then start a game
                    else { break }

                    keyAPressed = false
                    keyCPressed = false
                    keyDPressed = false
                }

                // If the key is "B", show the history of rolled numbers
                'B' -> {

                    keyCPressed = true
                    keyDPressed = false
                    keyAPressed = false

                    // Limit the roll history to 32 characters, breaking it into two lines. Don't separate numbers.
                    val formattedHistory = roll_history.map { if (it.toString().length == 1) "0$it" else it.toString() }
                    val history = formattedHistory.reversed().take(5).joinToString(">")
                    val history2 = formattedHistory.reversed().drop(5).take(5).joinToString(">")
                    TUI.writeMessage(" $history| $history2")
                }

                // If the key is "D", turn off the machine and save the statistics
                'D' -> {
                    if (!keyDPressed) {
                        TUI.writeMessage("ARE YOU SURE?|HIT 'D' FOR YES")
                        keyDPressed = true
                        continue
                    }

                    saveStatistics()
                    TUI.writeMessage("GOODBYE!")

                    Time.sleep(2000L)  // Wait for 2 seconds before turning off the machine
                    RouletteDisplay.off()
                    operatingMode = Mode.EXITING
                    break
                }
                else -> continue
            }

        } while (true)
    }

}