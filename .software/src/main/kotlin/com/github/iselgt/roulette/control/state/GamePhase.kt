package com.github.iselgt.roulette.control.state

import com.github.iselgt.roulette.control.M.waitForMaintenanceInput
import com.github.iselgt.roulette.control.TUI
import com.github.iselgt.roulette.main
import com.github.iselgt.roulette.operatingMode
import com.github.iselgt.roulette.spinRoulette
import com.github.iselgt.roulette.waitForBetOrCoins
import com.github.iselgt.roulette.waitForStartOrMaintenance

/**
 * This enum is responsible for keeping track of the different phases of the game.
 */
enum class GamePhase(val msg: String, val method: () -> Unit) {
    INIT("", ::main),  // dummy phase to initialise the state machine and run stepPhase only

    START("PRESS * TO START", ::waitForStartOrMaintenance),
    BETTING("1 CREDIT PER BET|HIT '#' TO ROLL", ::waitForBetOrCoins),
    SPINNING("LAST BETS IN!", ::spinRoulette),
    MAINTENANCE("MAINTENANCE MODE", ::waitForMaintenanceInput);

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

    /**
     * This method is responsible for returning the string representation of the phase.
     * It will replace the %roll% and %cred% placeholders with the given values.
     */
    fun printToLCD() = TUI.writeMessage(this.msg)
}