package com.github.iselgt.roulette

/**
 * Controls the 7-segment LED display of the roulette system.
 * This object provides functionality to display numeric values, control animations,
 * and toggle the display on or off through a serial emitter.
 */
object RouletteDisplay {

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
    fun setValue(value: Int) {
        val digits = value.toString()
        val numDigits = digits.length

        for (i in 0 until numDigits) {
            val digit = digits[i].toString().toInt() // Get numeric digit from char
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
     * Plays a fast LED spinning animation using the 7-segment display.
     *
     * Lights segments in a circular order over three digit positions,
     * creating a spinning illusion. After the animation, the display is cleared.
     */
    fun animation() {
        // Digit positions to animate: 0 = rightmost, 1 = center, 2 = leftmost
        val positions = arrayOf(0x00, 0x01, 0x02)

        // Repeat animation cycle three times
        repeat(3) {
            for (segment in SEGMENTCIRCLE) {
                for (digit in positions) {
                    val value = (segment shl 3) or digit
                    SerialEmitter.send(SerialEmitter.Destination.ROULETTE, value, 8)
                }

                // Refresh the display
                SerialEmitter.send(SerialEmitter.Destination.ROULETTE, CMD_UPDATE, 8)
            }
        }

        // Reset the display to show 0 after animation
        setValue(0)
    }

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
