package com.github.iselgt.roulette.control

import isel.leic.utils.Time
import kotlin.random.Random

/**
 * Controls the 7-segment LED display of the roulette system.
 * This object provides functionality to display numeric values, control animations,
 * and toggle the display on or off through a serial emitter.
 */
object RouletteDisplay {

    /**
     * This flag indicates whether we can still place bets on the roulette or not,
     * used to check when we need to stop the betting phase (5 seconds before the spin stops).
     */
    var bettingEnabled = true;

    /** Command to trigger the display update */
    private const val CMD_UPDATE = 0x06

    /** Command to turn the display off */
    private const val CMD_OFF = 0x0F

    /** Command to turn the display on */
    private const val CMD_ON = 0x07

    // --- Segment animation sequence ---

    /**
     * Predefined segment codes used for LED animation.
     * These codes correspond to specific LED segments in a circular pattern
     * across the 7-segment display.
     *
     * The values are packed based on the display controller specification.
     */
    private val SEGMENTCIRCLE = intArrayOf(0x19, 0x12, 0x1A, 0x13, 0x1B, 0x14, 0x1C, 0x15, 0x1D, 0x16, 0x1E, 0x11)

    /**
     * Initializes the display system.
     * This function must be called before using other display functions.
     * It initializes the serial emitter and ensures the display is turned on.
     */
    fun init() {
        SerialEmitter.init()
        off(false) // Turn on the display
    }

    /**
     * Displays an integer value (0–999) on the 7-segment display.
     *
     * Each digit is encoded and sent to the display in order from left to right.
     * Values longer than 3 digits are not supported by the physical display layout.
     *
     * @param value Integer value to be shown (expected range: 0 to 999).
     */
    fun setValue(value: String) {
        val numDigits = value.length

        for (i in 0 until numDigits) {
            val digit = value[i].toString().toInt()  // Get numeric digit from char
            val position = numDigits - 1 - i         // Position: 0 (rightmost), 1, 2

            // Data encoding: digit in bits [3-7], position in bits [0-2]
            val packedData = (digit shl 3) or position

            // Send the encoded data to the display controller
            SerialEmitter.send(SerialEmitter.Destination.ROULETTE, packedData, 8)
        }

        // Trigger display update
        SerialEmitter.send(SerialEmitter.Destination.ROULETTE, CMD_UPDATE, 8)
    }

    /**
     * Displays an integer value (0–999) on the 7-segment display.
     * Overloaded method to accept an integer directly.
     */
    fun setValue(value: Int) {
        // Convert the integer value to a string and call the overloaded setValue method
        setValue(value.toString())
    }

    /**
     * Plays a fast LED spinning animation using the 7-segment display.
     *
     * Lights segments in a circular order over three digit positions,
     * creating a spinning illusion. After the animation, the display is cleared.
     */
    fun animation() {
        // Digit positions to animate: 0 = rightmost, 1 = center, 2 = leftmost
        val positions = arrayOf(0, 1, 2, 3, 4, 5)

        // Randomly select a duration for the animation between 5 and 10 seconds
        val randomDuration = Random.nextLong(10000L, 15000L)
        val startTime = Time.getTimeInMillis()

        // Repeat animation for the specified duration
        do {
            val elapsed = Time.getTimeInMillis() - startTime;

            // Stop accepting bets 5 seconds before the end
            if (randomDuration - elapsed < 5000L) bettingEnabled = false

            for (segment in SEGMENTCIRCLE) {
                for (digit in positions) {
                    val value = (segment shl 3) or digit
                    SerialEmitter.send(SerialEmitter.Destination.ROULETTE, value, 8)
                }

                SerialEmitter.send(SerialEmitter.Destination.ROULETTE, CMD_UPDATE, 8)
            }
        } while (elapsed < randomDuration)

        // Reset the display to show 0 after animation
        bettingEnabled = true
        setValue("000000")
    }

    /**
     * Turns the display on
     */
    fun on() = off(false)

    /**
     * Turns the display off
     */
    fun off() = off(true)

    /**
     * Toggles the power state of the display.
     *
     * @param enable If `true`, the display is turned OFF.
     *               If `false`, the display is turned ON.
     */
    fun off(enable: Boolean) {
        val cmd = if (enable) CMD_OFF else CMD_ON

        // Send power control command
        SerialEmitter.send(SerialEmitter.Destination.ROULETTE, cmd, 8)

        // Apply the command (update)
        SerialEmitter.send(SerialEmitter.Destination.ROULETTE, CMD_UPDATE, 8)
    }
}
