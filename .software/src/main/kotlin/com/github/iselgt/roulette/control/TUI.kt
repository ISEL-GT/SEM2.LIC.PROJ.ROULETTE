package com.github.iselgt.roulette.control

import com.github.iselgt.roulette.control.state.GamePhase
import isel.leic.utils.Time

object TUI {

    fun init() {
        KBD.init()
        LCD.init()
    }

    /**
     * Displays a binary choice prompt on the LCD and waits for the user to press 'A' (true) or 'D' (false).
     *
     * @param prompt The question or prompt to show.
     * @return `true` if the user selects 'A', `false` if 'D'.
     */
    fun binOption(prompt: String): Boolean {
        LCD.clear()
        writeCenter(prompt, line = 0)
        writeLeft("A:ACCEPT", line = 1)
        writeRight("D:DENY", line = 1)

        while (true) {
            val key = getKey()
            return when (key) {
                'A' -> true
                'D' -> false
                KBD.EMPTY_CHAR -> continue
                else -> continue
            }
        }
    }

    /**
     * Writes a message starting from a specific line and column on the LCD.
     */
    fun writeFrom(msg: String, line: Int = 0, column: Int = 0) {
        val totalCols = LCD.COLS
        val trimmedMsg = msg.take(totalCols - column)
        LCD.cursor(line, column)
        LCD.write(trimmedMsg)
        LCD.cursor(1, 16) // Move cursor outside the display area to hide it
    }

    /**
     * Writes a centered message on the specified LCD line using writeFrom.
     *
     * @param msg The message to center and display.
     * @param line The line number (0 or 1).
     */
    fun writeCenter(msg: String, line: Int = 0) {
        val totalCols = LCD.COLS
        val msgLength = msg.length
        val startColumn = (totalCols - msgLength) / 2

        // Ensure the message fits within the LCD width
        if (startColumn < 0) {
            LCD.cursor(line, 0)
            LCD.write(msg.take(totalCols))
        } else {
            writeFrom(msg, line, startColumn)
        }
    }

    /**
     * Writes a message aligned to the right on the specified LCD line using writeFrom.
     */
    fun writeRight(msg: String, line: Int = 0) {
        val totalCols = LCD.COLS
        val msgLength = msg.length
        val startColumn = totalCols - msgLength

        // Ensure the message fits within the LCD width
        if (startColumn < 0) {
            LCD.cursor(line, 0)
            LCD.write(msg.take(totalCols))
        } else {
            writeFrom(msg, line, startColumn)
        }
    }

    /**
     * Writes a message aligned to the left on the specified LCD line using writeFrom.
     */
    fun writeLeft(msg: String, line: Int = 0) {
        // No need to calculate start column, just write from the beginning
        writeFrom(msg, line, 0)
    }

    /**
     * Updates the LCD display based on the key-value pairs defined in GamePhase.screenValuePlacements.
     * The key is used to find the placement, and the value is written to that placement.
     *
     * @param key The key to look up in the placements map.
     * @param value The value to write to the LCD at the specified placement.
     */
    fun updateMenuFromPlacementMap(key: String,  value: String) {
        val placement = GamePhase.screenValuePlacements[key] ?: return
        writeFrom(value, placement.first, placement.second)
    }

    /**
     * Clears the LCD display.
     */
    fun clear() {
        LCD.clear()
        LCD.cursor(1, 16) // Move cursor outside the display area to hide it
    }

    /**
     * Reads a character from the keyboard and writes it to the LCD if it is not EMPTY_CHAR.
     */
    fun readAndWriteChar() {
        val key = getKey()
        if (key != KBD.EMPTY_CHAR) {
            LCD.write(key)
        }
    }

    /**
     * Gets a key from the keyboard.
     */
    fun getKey(timeout: Long = 1000L) = KBD.waitKey(timeout);
}

fun main() {
    TUI.init()

    TUI.writeCenter("Welcome", line = 0)
    Time.sleep(2000L)

    // Test binOption
    val response = TUI.binOption("U sure?")
    LCD.clear()
    TUI.writeCenter(if (response) "Yes!" else "No!", line = 0)
    Time.sleep(1500)

    TUI.writeCenter("Press *!")
    TUI.writeRight("RIGHT", 1)
    TUI.writeCenter("C", 1)
    TUI.writeLeft("LEFT", 1)

    while (true) {
        if (TUI.getKey() == '*') LCD.clear()
        TUI.readAndWriteChar()
    }
}