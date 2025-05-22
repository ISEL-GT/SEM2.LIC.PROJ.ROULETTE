package com.github.iselgt.roulette.enums

/**
 * This enum is responsible for keeping track of the different modes of the game.
 */
enum class Mode(val character: Char) {
    EXITING('.'),
    DEFAULT('*'),
    MAINTENANCE('B');

    companion object {

        /**
         * This value is responsible for providing a list of all the available modes.
         */
        val MODES = Mode.entries.map { it.character }

        /**
         * This method is responsible for returning the mode associated with the given character.
         */
        fun fromChar(char: Char): Mode? {
            return Mode.entries.firstOrNull { it.character == char }
        }
    }
}