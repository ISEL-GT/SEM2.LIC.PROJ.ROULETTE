package com.github.iselgt.roulette

import com.github.iselgt.roulette.control.M
import com.github.iselgt.roulette.control.coin.CoinAcceptor
import com.github.iselgt.roulette.control.state.Mode
import com.github.iselgt.roulette.control.state.GamePhase
import com.github.iselgt.roulette.control.display.RouletteDisplay
import com.github.iselgt.roulette.control.TUI
import com.github.iselgt.roulette.control.display.RouletteDisplay.setValue
import com.github.iselgt.roulette.control.coin.CoinSignal
import isel.leic.utils.Time
import kotlin.random.Random

/**
 * This variable is responsible for keeping track of the current operating mode of the game.
 */
var operatingMode = Mode.DEFAULT
var gamesPlayed = 0
var credits = 0
var coins = 0
var bets = ArrayList<Int>()
var roll_history = ArrayList<Int>()
var betBuffer = 0

const val WIN_MULTIPLIER = 4
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
fun loadStatistics() {

    val stats = readFromFile("$STORAGE_PATH/stats.txt")
    if (stats.isNotEmpty()) {
        gamesPlayed = stats[0].toInt()
        coins = stats[1].toInt()
    }

    val rolls = readFromFile("$STORAGE_PATH/rolls.txt")
    if (rolls.isNotEmpty()) {
        roll_history = ArrayList(rolls[0].split(";").map { it.toInt() })
    }
}

/**
 * Saves the game statistics to the stats file and the roll history to the rolls file.
 */
fun saveStatistics() {
    writeToFile("$STORAGE_PATH/stats.txt", listOf(gamesPlayed.toString(), coins.toString()))
    writeToFile("$STORAGE_PATH/rolls.txt", listOf(roll_history.joinToString(";")))
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
        coins++
        TUI.writeMessage("ADDED $insertedCredits CREDITS|CREDITS: $credits") // Show the current credits on the display
        Time.sleep(1000L) // Wait for 1 second to show the message

        saveStatistics()
        gamePhase.printToLCD()
        CoinSignal.ACCEPT.unset()
    }
}

/**
 * Checks if we're on the betting phase and resets the bet selection in the display.
 * If we're not in the betting phase, reset it in the LCD
 */
fun resetBetSelection() {
    if (gamePhase == GamePhase.BETTING) RouletteDisplay.setValue("000000")
    else TUI.writeMessage("LAST BETS IN!|SELECTION: ")
}

/**
 * Processes a bet made by the user.
 */
fun processBet(key: Char) {

    if (betBuffer > 0) {
        when (key) {

            // Clear the bet at the current index
            'C' -> {
                betBuffer = 0
                resetBetSelection()
                return
            }

            // "Accept" a bet at the current index
            'A' -> {

                if (betBuffer > ROULETTE_MAX) {
                    TUI.writeMessage("BET TOO HIGH|MAX: $ROULETTE_MAX")
                    Time.sleep(2000L) // Wait for 2 seconds before going back to the betting phase

                    betBuffer = 0
                    resetBetSelection()
                    gamePhase.printToLCD()
                    return
                }

                if (operatingMode != Mode.MAINTENANCE) credits--
                bets.add(betBuffer) // Add the bet to the bets list
                TUI.writeMessage("NEW BET: ${betBuffer}|CREDITS: $credits")

                betBuffer = 0
                resetBetSelection()
                Time.sleep(1000L)

                gamePhase.printToLCD()
            }
        }
    }

    // If the bet is already at two digits, ignore the input
    if (betBuffer >= 10 * ROULETTE_MAX.toString().length || !key.isDigit()) return

    // Concatenate the pressed key to the current bet at the current index
    betBuffer = betBuffer * 10 + key.digitToInt()

    // The spinning phase shows values on the LCD
    if (gamePhase == GamePhase.BETTING) RouletteDisplay.setValue(betBuffer)
    else TUI.writeMessage("LAST BETS IN!|SELECTION: $betBuffer")

}

/**
 * This method is responsible for waiting for the start of the game or maintenance mode.
 * If the user presses "*", then the game will start, and if it presses "M", then the
 * maintenance mode will be activated.
 **/
fun waitForStartOrMaintenance() {

    // Reset the display
    RouletteDisplay.setValue("000000")
    operatingMode = Mode.DEFAULT

    do {

        // Wait for the user to press a key and check if it's a valid mode
        val key = TUI.getKey()

        // If we're in maintenance mode, start the maintenance phase and set the M bit
        if (M.isMaintenance()) {
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

    while (true) {

        val key = TUI.getKey(100)
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

            gamePhase.printToLCD()
            continue
        }

        processBet(key) // Process the bet made by the user«
    }

    Time.sleep(1000L)
}

/**
 * This method is responsible for spinning the roulette and showing the result of the spin.
 */
fun spinRoulette() {

    // Get the current time and a future time from 6-15 seconds from now
    val startTime = Time.getTimeInMillis()
    val endTime = startTime + Random.nextLong(10000L, 15000L)
    var stopBetting = false

    // Get the time 5 seconds before the end time to stop accepting bets
    val stopBetsTime = endTime - 5000L

    while (Time.getTimeInMillis() < endTime) {

        // Animate the next segment of the display
        RouletteDisplay.animation()
        if (stopBetting) continue

        // If 5 seconds have passed since the start of the spin, stop accepting bets and display a message
        if (Time.getTimeInMillis() >= stopBetsTime) {
            TUI.writeMessage("BETTING CLOSED!")
            stopBetting = true
            continue
        }

        processBet(TUI.getKey(10))
    }

    setValue("000000")

    // Generate a random number between 0 and 36 to simulate the roulette spin and show the result
    val spinResult = Random.nextInt(0, ROULETTE_MAX)
    val creditDifference = (bets.count { it == spinResult } * WIN_MULTIPLIER) - bets.count()

    if (operatingMode != Mode.MAINTENANCE) {
        gamesPlayed++ // Increment the number of games played
        credits += bets.count { it == spinResult } * WIN_MULTIPLIER // Adds the number of bets that match the spin result to the coins *2

        roll_history.add(spinResult) // Add the result to the history
    }

    if (roll_history.size > 10) roll_history.removeAt(0) // Keep only the last 10 results

    RouletteDisplay.setValue(spinResult) // Show the result of the spin
    TUI.writeMessage("DONE!|RESULTS IN 5S...")
    saveStatistics()

    Time.sleep(5000L) // Wait for 5 seconds before showing the result
    TUI.writeMessage("ROLL: $spinResult|EARNINGS: $creditDifference")
    Time.sleep(5000L) // Wait for 5 seconds before going back to the next phase
}


/**
 * Main function to start the roulette game.
 */
fun main() {

    TUI.init()  // Initialize the TUI (Text User Interface) system
    RouletteDisplay.init()
    RouletteDisplay.off()  // The display should be off by default
    loadStatistics()
    CoinAcceptor.init()

    while (true) { stepPhase() }
}