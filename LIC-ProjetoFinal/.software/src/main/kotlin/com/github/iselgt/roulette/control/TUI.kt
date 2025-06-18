package com.github.iselgt.roulette.control

import com.github.iselgt.roulette.control.state.Mode
import isel.leic.utils.Time

object TUI {

    const val WAIT_TIME = 200L

    fun init() {
        KBD.init()
        LCD.init()
    }

    /**
     * This method is responsible for writing a message on the LCD.kt display.
     * It will clear the display and write the message, waiting for a certain amount of time
     * before returning.
     */
    fun writeMessage(msg: String) {
        Time.sleep(WAIT_TIME)
        LCD.cursor(0, 0)
        LCD.clear()
        LCD.write(msg)
    }

    /**
     * Gets a key from the keyboard.
     */
    fun getKey(timeout: Long = 1000L) = KBD.waitKey(timeout);
}