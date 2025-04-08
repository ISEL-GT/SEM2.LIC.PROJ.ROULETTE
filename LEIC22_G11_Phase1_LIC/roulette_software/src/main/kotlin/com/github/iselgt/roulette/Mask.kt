package com.github.iselgt.roulette.components

/**
 * This enum is responsible for storing all the mask values used within the program
 */
enum class Mask(val data: Int) {

    /**
     * Masks aimed for the KBD (Keyboard)
     */
    NONE_VALUE(0x00), // Null-Terminator value for when no key has been pressed
    KVAL(0x01),       // Output from Key Decode/Input from USB Port that tells us when a key has been pressed
    K(0x1E),          // Data telling us which line/column combination was selected (representing a button)
    KACK(0x01),       // Acknowledgement that a key has been processed, provided by USB Port's output

    /**
     * Masks aimed for the LCD (Screen)
     */
    CLEAR_DISPLAY(0x1),
    RETURN(0x2),
    ENTRY_MODE_SET(0x4),
    DISPLAY_TOGGLE(0x8),
    CURSOR_DISPLAY_SHIFT(0x10),
    FUNCTION_SET(0x20),
    SET_CGRAM(0x40),
    SET_DDRAM(0x80),
    READ_BUSY_FLAG(0x100),
    WRITE_DATA(0x100),
    READ_DATA(0x100);

    // Operator overloading: allows treating Mask directly as an Int
    operator fun invoke(): Int = this.data
}

/**
 * Checks whether a bit sequence matches the given mask (is exactly the mask)
 *
 * @param mask The mask to match the sequence to
 * @return Whether the bit sequence matches the mask
 */
fun Int.matches(mask: Int): Boolean = mask and this != 0x0