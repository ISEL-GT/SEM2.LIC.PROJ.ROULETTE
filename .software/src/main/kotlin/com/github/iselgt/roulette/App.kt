package com.github.iselgt.roulette

import isel.leic.utils.Time
import kotlin.random.Random


/**
 * This enum is responsible for keeping track of the different phases of the game.
 */
enum class PHASE(val msg: String, val method: () -> Unit) {
    INIT("", ::waitForStart),  // dummy phase to initialise the state machine and run stepPhase only

    START("PRESS * TO START", ::waitForStart),
    BETTING("1 CREDIT PER BET|HIT '#' TO ROLL", ::waitForBet),
    SPINNING("SPINNING...", ::spinRoulette);

    /**
     * This method is responsible for returning the next phase of the game,
     * acting as a state machine.
     */
    fun next(): PHASE {
        return when (this) {
            INIT -> START
            START -> BETTING
            BETTING -> SPINNING
            SPINNING -> START
        }
    }

    /**
     * This method is responsible for returning the string representation of the phase.
     * It will replace the %roll% and %cred% placeholders with the given values.
     */
    fun printToLCD() = TUI.writeMessage(this.msg)
}

/**
 * This variable is responsible for keeping track of the current phase of the game.
 */
private var phase: PHASE = PHASE.INIT

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
 * This method is responsible for starting the roulette game. It will wait until the user
 * presses "*", and given enough credits, it will light up the roulette and run the normal flow.
 **/
fun waitForStart() {

    RouletteDisplay.setValue(0) // Set the display to 0

    while (KBD.waitKey(1000) != '*') {
        // Do nothing
    }

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
        if (key == '#' && phase == PHASE.BETTING) break
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
    val spinResult = Random.nextInt(0, 36) // Simulate the roulette spin
    RouletteDisplay.setValue("000") // Show the result of the spin

    Time.sleep(5000L)
    TUI.writeMessage("ROLL: $spinResult  | CREDITS: ???")
}

/**
 * Main function to start the roulette game.
 */
fun main() {

    TUI.init()  // Initialize the TUI (Text User Interface) system
    RouletteDisplay.off()  // The display should be off by default

    while (true) { stepPhase() }
}