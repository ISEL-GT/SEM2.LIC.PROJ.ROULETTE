package com.github.iselgt.roulette.control

import isel.leic.UsbPort

// -- InputPort Masks
const val K_VAL_MASK = 0x01         // Kval signal -> I0
const val K_MASK = 0x1E             // K values -> I1..I4
const val COIN_ID_MASK = 0x20       // Coin id signal -> I5
const val COIN_MASK = 0x40          // Coin signal -> I6
const val M_MASK = 0x80             // M signal -> I7

// -- OutputPort Masks
const val SDX = 0x02                // Serial data line -> 01
const val COIN_ACCEPT_MASK = 0x04   // Coin Acceptor signal -> O2
const val ACK_MASK = 0x10           // ACK signal -> O4
const val LCD_MASK = 0x20           // Enables LCD communication -> O5
const val ROULETTE_MASK = 0x40      // Enables ROULETTE communication -> O6
const val SCLK_MASK = 0x80          // Serial clock pulse -> 07

/**
 * HAL (Hardware Abstraction Layer) provides a simplified interface to control
 * and read bits from the USB port, encapsulating low-level operations.
 */
object HAL {
    /**
     * Stores the current state of the output port. Initialized with 2 bit high (LCD and ROULETTE) and the rest low
     *
     * It happens cuz both the LCD and Roulette are active-low, and we want them off by default.
     */
    private var outputPort = LCD_MASK or ROULETTE_MASK

    /**
     * Initializes the USB port output with the default value of [outputPort],
     * setting all relevant control lines to their off default.
     */
    fun init() {
        UsbPort.write(outputPort)
    }

    /**
     * Checks whether the bits selected by the given mask are currently active (non-zero).
     *
     * @param mask The bitmask to check.
     * @return `true` if any of the masked bits are set, `false` otherwise.
     */
    fun isBit(mask: Int): Boolean = readBits(mask) != 0

    /**
     * Reads the current state of the USB port input (I0-I7), applying the provided mask.
     *
     * @param mask The bitmask to apply to the input.
     * @return The masked value from the USB input.
     */
    fun readBits(mask: Int): Int {
        return UsbPort.read().and(mask)
    }

    /**
     * Clears (sets to 0) the output bits selected by the given mask.
     *
     * @param mask The bitmask indicating which bits to clear.
     */
    fun clrBits(mask: Int) {
        val clear = mask.inv()
        outputPort = outputPort.and(clear)
        //println(outputPort.toString(2))
        UsbPort.write(outputPort)
    }

    /**
     * Sets (to 1) the output bits selected by the given mask.
     *
     * @param mask The bitmask indicating which bits to set.
     */
    fun setBits(mask: Int) {
        outputPort = mask.or(outputPort)
       // println(outputPort.toString(2))
        UsbPort.write(outputPort)
    }

    /**
     * Writes specific bits on the output port, based on the provided mask and value.
     * Only the bits selected by the mask will be affected.
     *
     * @param mask The bitmask indicating which bits to modify.
     * @param value The value to write to the selected bits.
     */
    fun writeBits(mask: Int, value: Int) {
        outputPort = (mask and value) or (outputPort and mask.inv())
        UsbPort.write(outputPort)
    }
}
