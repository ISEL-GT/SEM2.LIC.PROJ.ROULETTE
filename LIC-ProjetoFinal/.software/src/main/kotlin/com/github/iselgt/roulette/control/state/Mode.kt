package com.github.iselgt.roulette.control.state

/**
 * This enum is responsible for keeping track of the different modes of the game.
 */
enum class Mode(val character: Char) {
    EXITING('.'),
    DEFAULT('*'),
    MAINTENANCE(0b10000000.toChar());

    companion object {

        /**
         * This method is responsible for returning the mode associated with the given character.
         */
        fun fromChar(char: Char): Mode? {
            return Mode.entries.firstOrNull { it.character == char }
        }
    }
}