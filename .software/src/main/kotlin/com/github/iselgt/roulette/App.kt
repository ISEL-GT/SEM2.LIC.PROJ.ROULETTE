package com.github.iselgt.roulette

import com.github.iselgt.roulette.enums.Mode
import com.github.iselgt.roulette.enums.Phase
import com.github.iselgt.roulette.enums.readFromFile
import com.github.iselgt.roulette.enums.writeToFile
import isel.leic.utils.Time
import jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.index
import kotlin.random.Random

/**
 * This variable is responsible for keeping track of the current operating mode of the game.
 */
var operatingMode = Mode.DEFAULT
var gamesPlayed = 0
var coinsInserted = 0
var roll_history = ArrayList<Int>()

/**
 * The base path for the storage of the game data.
 */
const val STORAGE_PATH = "./data"

/**
 * This variable is responsible for keeping track of the current phase of the game.
 */
private var phase: Phase = Phase.INIT

/**
 * This method is responsible for changing the phase of the game, and calling the
 * method associated with it.
 */
fun stepPhase() {
    phase = phase.next()
    phase.printToLCD()
    phase.method()
}

/**
 * This method is responsible for loading the game statistics from the stats file.
 */
fun loadGameStatistics() {

    val stats = readFromFile("$STORAGE_PATH/stats.txt")
    if (stats.isNotEmpty()) {
        gamesPlayed = stats[0].toInt()
        coinsInserted = stats[1].toInt()
    }

    val rolls = readFromFile("$STORAGE_PATH/rolls.txt")
    if (rolls.isNotEmpty()) {
        roll_history = ArrayList(rolls[0].split(";").map { it.toInt() })
    }
}

/**
 * This method is responsible for waiting for the start of the game or maintenance mode.
 * If the user presses "*", then the game will start, and if it presses "M", then the
 * maintenance mode will be activated.
 **/
fun waitForStartOrMaintenance() {

    // Reset the display
    RouletteDisplay.setValue("000")

    do {

        // Wait for the user to press a key and check if it's a valid mode
        val key = KBD.waitKey(1000)
        val mode = Mode.fromChar(key)

        // If the key is not a valid mode, continue waiting
        if (mode == null) continue
        operatingMode = mode

        // If we're in maintenance mode, start the maintenance phase and set the M bit
        if (mode == Mode.MAINTENANCE) {
            HAL.setBits(0x128)
        }

    } while (!Mode.MODES.contains(mode?.character))

    // Turn on the display and show the message
    RouletteDisplay.on()
}

/**
 * This method is responsible for registering the bet made by the user and passing it to the
 * coin acceptor. If the user presses "#", then the bets are over and the roulette will spin.
 */
fun waitForBet() {

    while (RouletteDisplay.bettingEnabled) {

        val key = KBD.waitKey(100)
        if (key == 0x00.toChar()) continue
        if (key == '#' && phase == Phase.BETTING) break
    }

    // TODO("COIN ACCEPTOR INPUTS")
}

/**
 * This method is responsible for spinning the roulette and showing the result of the spin.
 */
fun spinRoulette() {

    // Animate the roulette display spinning and allow bets for up to 5s
    RouletteDisplay.animation()
    // TODO("ALLOW BETTING")

    // Generate a random number between 0 and 36 to simulate the roulette spin and show the result
    val spinResult = Random.nextInt(0, 36)

    if (operatingMode != Mode.MAINTENANCE) {
        gamesPlayed++ // Increment the number of games played

        //TODO("COIN SUM BY VALUE")
        roll_history.add(spinResult) // Add the result to the history
    }

    if (roll_history.size > 10) roll_history.removeAt(0) // Keep only the last 10 results

    RouletteDisplay.setValue("0$spinResult") // Show the result of the spin
    TUI.writeMessage("DONE!|RESULTS IN 5S...")

    Time.sleep(5000L) // Wait for 5 seconds before showing the result
    TUI.writeMessage("ROLL: $spinResult|CREDITS: ???")
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
                TUI.writeMessage("GAMES: $gamesPlayed|COINS: $coinsInserted")
            }

            // If we click "*" after "A", we reset the counters for games and coins
            '*' -> {
                if (keyAPressed) {
                    gamesPlayed = 0
                    coinsInserted = 0
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

            // If the key is "C", show the history of rolled numbers
            'C' -> {

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

                writeToFile("$STORAGE_PATH/stats.txt", listOf(gamesPlayed.toString(), coinsInserted.toString()))
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