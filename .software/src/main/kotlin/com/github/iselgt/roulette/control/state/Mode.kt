package com.github.iselgt.roulette.control.state

import com.github.iselgt.roulette.control.M_MASK

/**
 * This enum is responsible for keeping track of the different modes of the game.
 */
enum class Mode(val character: Char) {
    EXITING('.'),
    DEFAULT('*'),
    MAINTENANCE(M_MASK.toChar());
}