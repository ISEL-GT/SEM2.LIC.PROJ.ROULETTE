package com.github.iselgt.roulette

import com.github.iselgt.roulette.control.CoinAcceptor
import com.github.iselgt.roulette.control.state.Mode
import com.github.iselgt.roulette.control.state.GamePhase
import com.github.iselgt.roulette.control.HAL
import com.github.iselgt.roulette.control.KBD
import com.github.iselgt.roulette.control.LCD
import com.github.iselgt.roulette.control.RouletteDisplay
import com.github.iselgt.roulette.control.TUI
import isel.leic.utils.Time
import jdk.internal.org.jline.keymap.KeyMap.key
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlin.random.Random

/**
 * This variable is responsible for keeping track of the current operating mode of the game.
 */
var operatingMode = Mode.DEFAULT
var gamesPlayed = 0
var credits = 0
var bets = ArrayList<Int>()
var roll_history = ArrayList<Int>()

const val WIN_MULTIPLIER = 2
const val ROULETTE_MAX = 36

/**
 * The base path for the storage of the game data.
 */
const val STORAGE_PATH = "./data"

/**
 * This variable is responsible for keeping track of the current phase of the game.
 */
private var gamePhase: GamePhase = GamePhase.INIT

/**
 * This method is responsible for changing the phase of the game, and calling the
 * method associated with it.
 */
fun stepPhase() {
    gamePhase = gamePhase.next()
    gamePhase.printToLCD()
    gamePhase.method()
}

/**
 * This method is responsible for loading the game statistics from the stats file.
 */
fun loadGameStatistics() {

    val stats = readFromFile("$STORAGE_PATH/stats.txt")
    if (stats.isNotEmpty()) {
        gamesPlayed = stats[0].toInt()
        credits = stats[1].toInt()
    }

    val rolls = readFromFile("$STORAGE_PATH/rolls.txt")
    if (rolls.isNotEmpty()) {
        roll_history = ArrayList(rolls[0].split(";").map { it.toInt() })
    }
}

/**
 * This method is responsible for processing the coin insertion.
 * It waits for the user to insert coins and adds them to the credits.
 * @param timeout The maximum time to wait for coin insertion in milliseconds.
 */
fun processCoins(timeout: Int) {

    // Wait for the user to insert coins and add them to the credits
    val insertedCredits = CoinAcceptor.waitCoin(timeout)

    if (insertedCredits > 0) {
        credits += insertedCredits // Add the inserted credits to the total credits
        TUI.writeMessage("ADDED $insertedCredits CREDITS|CREDITS: $credits") // Show the current credits on the display
        Time.sleep(2000L) // Wait for 1 second to show the message
        gamePhase.printToLCD()
    }

}

/**
 * Clears the bet at the specified index and resets the display to show no result.
 */
fun clearBet(betIndex: Int) {
    bets[betIndex] = 0
    RouletteDisplay.setValue("000") // Reset the display to show no result
}

/**
 * This method is responsible for waiting for the start of the game or maintenance mode.
 * If the user presses "*", then the game will start, and if it presses "M", then the
 * maintenance mode will be activated.
 **/
fun waitForStartOrMaintenance() {

    // Reset the display
    RouletteDisplay.setValue("000")
    operatingMode = Mode.DEFAULT

    do {

        // Wait for the user to press a key and check if it's a valid mode
        val key = KBD.waitKey(1000)

        // If we're in maintenance mode, start the maintenance phase and set the M bit
        if (HAL.isBit(Mode.MAINTENANCE.character.code)) {
            operatingMode = Mode.MAINTENANCE
            break
        }

        if (key != Mode.DEFAULT.character) continue // If the key is not the default mode, continue waiting
        break

    } while (true)

    // Turn on the display and show the message
    RouletteDisplay.on()
}

/**
 * This method is responsible for registering the bet made by the user and passing it to the
 * coin acceptor. If the user presses "#", then the bets are over and the roulette will spin.
 */
fun waitForBetOrCoins() {

    // Implement a circular buffer to store the bets
    bets.clear() // Clear the bets list before starting a new betting phase
    var betIndex = 0

    while (RouletteDisplay.bettingEnabled) {

        val key = KBD.waitKey(100)
        processCoins(100)

        if (key == 0x00.toChar()) continue

        if (key == '#' && gamePhase == GamePhase.BETTING) {
            if (bets.isEmpty()) {
                TUI.writeMessage("PLEASE BET TO|SPIN ROULETTE")
                Time.sleep(2000L) // Wait for 2 seconds before going back to the betting phase
                gamePhase.printToLCD()
                continue
            }
            break
        }

        if (credits <= 0) {
            TUI.writeMessage("NO CREDITS|INSERT COINS")
            Time.sleep(2000L) // Wait for 2 seconds before going back to the betting phase

            gamePhase.printToLCD();
            continue
        }

        if (bets.getOrElse(betIndex) { 0 } >= 1) {
            when (key) {

                // Clear the bet at the current index
                'C' -> {
                    clearBet(betIndex)
                    continue
                }

                // "Accept" a bet at the current index
                'A' -> {

                    if (bets[betIndex] > ROULETTE_MAX) {
                        LCD.clear()
                        TUI.writeMessage("BET TOO HIGH|MAX: $ROULETTE_MAX")
                        Time.sleep(2000L) // Wait for 2 seconds before going back to the betting phase

                        clearBet(betIndex)
                        gamePhase.printToLCD()
                        continue
                    }

                    if (operatingMode != Mode.MAINTENANCE) credits--
                    TUI.writeMessage("NEW BET: ${bets[betIndex]}|CREDITS: $credits")
                    RouletteDisplay.setValue("000")
                    betIndex++
                    Time.sleep(2000L)
                }
            }
        }

        // If the bet is already at two digits, ignore the input
        if (bets.getOrElse(betIndex) { 0 } >= 10 || !key.isDigit()) continue

        if (bets.size <= betIndex) {
            bets.add(0) // Ensure the list has enough space for the current bet
        }

        // Concatenate the pressed key to the current bet at the current index
        bets[betIndex] = bets[betIndex] * 10 + key.digitToInt()
        RouletteDisplay.setValue(bets[betIndex]) // Update the display with the current bet
    }
}

/**
 * This method is responsible for spinning the roulette and showing the result of the spin.
 */
fun spinRoulette() {

    // Animate the roulette display spinning and allow bets for up to 5s
    CoroutineScope(Dispatchers.Default).launch {
        waitForBetOrCoins()
        println("finished")
    }

    RouletteDisplay.animation()

    // Generate a random number between 0 and 36 to simulate the roulette spin and show the result
    val spinResult = Random.nextInt(0, ROULETTE_MAX)

    if (operatingMode != Mode.MAINTENANCE) {
        gamesPlayed++ // Increment the number of games played
        credits += bets.count { it == spinResult } * WIN_MULTIPLIER // Adds the number of bets that match the spin result to the coins *2

        roll_history.add(spinResult) // Add the result to the history
    }

    if (roll_history.size > 10) roll_history.removeAt(0) // Keep only the last 10 results

    RouletteDisplay.setValue("0$spinResult") // Show the result of the spin
    TUI.writeMessage("DONE!|RESULTS IN 5S...")

    Time.sleep(5000L) // Wait for 5 seconds before showing the result
    TUI.writeMessage("ROLL: $spinResult|CREDITS: $credits")
    Time.sleep(5000L) // Wait for 5 seconds before going back to the next phase
}


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
        val key = KBD.waitKey(1000)

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
                val history = roll_history.take(5).joinToString(">")
                val history2 = roll_history.drop(5).take(5).joinToString(">")
                TUI.writeMessage("$history|$history2")
            }

            // If the key is "D", turn off the machine and save the statistics
            'D' -> {
                if (!keyDPressed) {
                    TUI.writeMessage("ARE YOU SURE?|HIT 'D' FOR YES")
                    keyDPressed = true
                    continue
                }

                writeToFile("$STORAGE_PATH/stats.txt", listOf(gamesPlayed.toString(), credits.toString()))
                writeToFile("$STORAGE_PATH/rolls.txt", listOf(roll_history.joinToString(";")))
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

/**
 * Main function to start the roulette game.
 */
fun main() {

    TUI.init()  // Initialize the TUI (Text User Interface) system
    RouletteDisplay.init()
    RouletteDisplay.off()  // The display should be off by default
    loadGameStatistics()

    while (true) { stepPhase() }
}