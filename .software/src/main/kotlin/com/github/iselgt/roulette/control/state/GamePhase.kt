package com.github.iselgt.roulette.control.state

import com.github.iselgt.roulette.ROULETTE_MAX
import com.github.iselgt.roulette.bets
import com.github.iselgt.roulette.control.M.waitForMaintenanceInput
import com.github.iselgt.roulette.control.TUI
import com.github.iselgt.roulette.credits
import com.github.iselgt.roulette.main
import com.github.iselgt.roulette.operatingMode
import com.github.iselgt.roulette.spinRoulette
import com.github.iselgt.roulette.waitForBetOrCoins
import com.github.iselgt.roulette.waitForStartOrMaintenance


/**
 * This enum is responsible for keeping track of the different phases of the game.
 */
enum class GamePhase(val method: () -> Unit) : GamePhaseMenu {

    // dummy phase to initialise the state machine and run stepPhase only
    INIT(::main) { override fun menu() {} },

    START(::waitForStartOrMaintenance) {

        override fun menu() = TUI.writeCenter("PRESS * TO START")

    },

    BETTING(::waitForBetOrCoins) {

        override fun menu() {
            TUI.clear()
            TUI.writeLeft("BETS:${bets.size}")  // BETTING-BETS
            TUI.writeRight("MAX:$ROULETTE_MAX")
            TUI.writeLeft("CREDS:$credits", line = 1)  // GAME-CREDITS
            TUI.writeRight("LAST:--", line = 1)  // GAME-LAST
        }
    },

    SPINNING(::spinRoulette) {

        override fun menu() {
            TUI.clear()
            TUI.writeCenter("SPINNING...")
            TUI.writeLeft("CREDS:$credits", line = 1)  // GAME-CREDITS
            TUI.writeRight("BET:00", line = 1)  // GAME-LAST
        }
    },

    MAINTENANCE(::waitForMaintenanceInput) {

        override fun menu() {
            TUI.clear()
            TUI.writeCenter("MAINTENANCE MODE")
            TUI.writeLeft("A", line = 1)
            TUI.writeCenter("B", line = 1)
            TUI.writeRight("D", line = 1)
        }
    };

    companion object {

        /**
         * A map that contains useful value placements for the LCD.
         * This map, will, for instance, contain "BETTING-CREDITS" on a Pair, telling the app where to
         * update the values on the LCD.
         */
        public val screenValuePlacements = mapOf(
            "GAME-CREDITS" to Pair(1, 6),
            "GAME-LAST" to Pair(1, 14),
            "BETTING-BETS" to Pair(0, 5),
            "COUNTDOWN" to Pair(1, 11),
        )
    }

    /**
     * This method is responsible for returning the next phase of the game,
     * acting as a state machine.
     */
    fun next(): GamePhase {

        return when (this) {
            INIT -> START
            START -> if (operatingMode == Mode.DEFAULT) BETTING else MAINTENANCE
            BETTING -> SPINNING
            SPINNING -> START
            MAINTENANCE -> if (operatingMode == Mode.EXITING) START else BETTING
        }
    }
}