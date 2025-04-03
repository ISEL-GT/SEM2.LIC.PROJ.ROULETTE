package com.github.iselgt.roulette

import isel.leic.utils.Time
import java.util.concurrent.TimeUnit

const val WAIT_TIME = 2L
const val WAIT_KEY = 200L

object TUI {
    fun init() {
        KBD.init()
        LCD.init()
    }

    fun writeMessage(msg: String){
        LCD.clear()
        LCD.write(msg)
    }
}

fun main() {

    TUI.init()                                          // Initialize the TUI (Text User Interface) system
    TUI.writeMessage("Hello World :)")
    Time.sleep(TimeUnit.SECONDS.toMillis(WAIT_TIME))    // Pause the program for WAIT_TIME seconds
    LCD.clear()
    TUI.writeMessage("Grupo 16 Display")
    Time.sleep(TimeUnit.SECONDS.toMillis(WAIT_TIME))
    LCD.clear()
    TUI.writeMessage("Use '*' to Clear")

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