package com.github.iselgt.roulette

/**
 * Object responsible for controlling the Roulette Display hardware.
 * It sends commands and data to the display via a serial emitter.
 */
object RouletteDisplay {
    // Constants for SerialEmitter communication (dependent on SerialEmitter's implementation)
    private const val RDSELECT = 0x40       // Register select signal
    private const val SCLK = 0x80           // Serial clock signal
    private const val SDX = 0x02            // Serial data signal

    // Display commands (from the command table)
    private const val UPDATEDISPLAY = 0x60  // Command to update the display with buffered data
    private const val DISPLAYOFF = 0x71     // Command to turn the display off
    private const val DISPLAYON = 0x70      // Command to turn the display on

    /**
     * Initializes the SerialEmitter subsystem.
     * Must be called before using any other functions in this object.
     */
    fun init() {
        SerialEmitter.init()
    }

    // Delay between animation frames (in milliseconds)
    private const val ANIMATION_DELAY = 100L

    /**
     * Plays a random animation on the display by showing 20 random patterns.
     * Each pattern is displayed for [ANIMATION_DELAY] milliseconds.
     */
    fun animation() {
        var value = 0
        repeat(20) {
            value = (Math.random() * 256).toInt() // Generate a random 8-bit pattern
            setValue(value)                       // Display the pattern
            Thread.sleep(ANIMATION_DELAY)         // Wait before next frame
        }
    }

    /**
     * Sets the displayed value on the Roulette Display.
     * The value is split into individual digits, and each digit is sent along with a command
     * indicating its position (most significant digit first).
     *
     * @param value The integer value to be displayed (0-999 -> 3 digits max).
     */
    fun setValue(value: Int) {
        val string = value.toString() // Convert the number to a string to process each digit
        val size = string.length      // Number of digits in the value
        var cmd = size - 1            // Command represents the digit position (0 = least significant)

        var digits = 0

        // Process each digit from left to right (most significant first)
        while (digits < size) {
            val code = string[digits].digitToInt()  // Extract the numeric value of the digit (0-9)

            // Pack cmd (3 bits, shifted left) and code (5 bits) into an 8-bit value:
            // - cmd occupies bits 7-5 (position encoding)
            // - code occupies bits 4-0 (digit value, masked to ensure 5-bit)
            val sentValue = (cmd.shl(5)) + (code and 0x1F)

            SerialEmitter.send(SerialEmitter.Destination.ROULETTE, sentValue, 8)
            digits++
            cmd--  // Move to the next digit (rightward, decreasing position)
        }

        // Send the command to update the display with the buffered data
        SerialEmitter.send(SerialEmitter.Destination.ROULETTE, UPDATEDISPLAY, 8)
    }

    /**
     * Turns the display on or off based on the input parameter.
     *
     * @param value If `true`, turns the display off; if `false`, turns it on.
     */
    fun off(value: Boolean) {
        if (value) {
            SerialEmitter.send(SerialEmitter.Destination.ROULETTE, DISPLAYOFF, 8)
        } else {
            SerialEmitter.send(SerialEmitter.Destination.ROULETTE, DISPLAYON, 8)
        }
    }
}