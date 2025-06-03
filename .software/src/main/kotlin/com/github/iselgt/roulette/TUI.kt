package com.github.iselgt.roulette

import isel.leic.utils.Time

const val WAIT_TIME = 200L
const val WAIT_KEY = 200L

object TUI {

    fun init() {
        KBD.init()
        LCD.init()
    }

    /**
     * This method is responsible for writing a message on the LCD.
     * It will clear the display and write the message, waiting for a certain amount of time
     * before returning.
     */
    fun writeMessage(msg: String){
        Time.sleep(WAIT_TIME)
        LCD.cursor(0,0)
        LCD.clear()
        LCD.write(msg)
    }
}

fun main() {

    TUI.init()                                          // Initialize the TUI (Text User Interface) system
    TUI.writeMessage("Hello World :)")
    TUI.writeMessage("Grupo 11 Display")
    TUI.writeMessage("Use '*' to Clear")
    TUI.writeMessage("EIGHT")
    TUI.writeMessage("NINE")
    TUI.writeMessage("TEN")

    var isCleared = false                               // Create a var that give us the information if the display was already cleared

    while (true) {
        val key = KBD.waitKey(WAIT_KEY)
        if (key == '*') {                               // Chose the '*' char to be a shortcut for clearing the display
            LCD.clear()
            isCleared = true
        }
        else {                                          // Write the key after clearing and reset the flag
            if (isCleared) {
                LCD.write(key)
                isCleared = false                       // Reset the flag after writing the first key
            }
            else {
                LCD.write(key)
            }
        }
    }
}