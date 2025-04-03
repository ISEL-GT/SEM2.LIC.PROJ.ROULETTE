package com.github.iselgt.roulette

object TUI {
    fun init() {
        KBD.init()
        LCD.init()
    }
}

fun main() {
    TUI.init()
    while (true) {
        LCD.write(KBD.waitKey(500))
    }
}
