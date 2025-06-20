package com.github.iselgt.roulette.control

import isel.leic.utils.Time

object SerialEmitter {

    enum class Destination { LCD, ROULETTE }

    private const val DELAYTIME = 1L

    /**
     * Initializes the serial interface:
     * - Enables both destinations
     * - Clears the clock line
     */
    fun init() {
        HAL.clrBits(SCLK_MASK)
    }

    /**
     * Sends a frame of bits to the selected destination:
     * - Size data bits
     * - Data is sent with Rs and then D(size-1)
     * - 1 parity bit (odd parity)
     */
    fun send(addr: Destination, data: Int, size: Int) {
        val address = if (addr == Destination.LCD) LCD_MASK else ROULETTE_MASK
        var parityCount = 0

        // Enables destination before transmission
        HAL.clrBits(address)

        repeat(size) { i ->
            val bit = (data shr i) and 1
            if (bit == 1) parityCount++
            writeBit(bit)
            pulseClock()
        }
        // Send odd parity bit
        val parityBit = if (parityCount % 2 == 0) 1 else 0
        writeBit(parityBit)
        pulseClock()
        // Clear the last bit send
        HAL.clrBits(SDX)
        Time.sleep(DELAYTIME)

        // Disables destination after transmission
        HAL.setBits(address)
        Time.sleep(DELAYTIME)
    }

    /**
     * Writes a single bit to the SDX line:
     * - Sets SDX high if bit is 1
     * - Clears SDX if bit is 0
     */
    private fun writeBit(bit: Int) {
        if (bit == 1)
            HAL.setBits(SDX)
        else
            HAL.clrBits(SDX)
        Time.sleep(DELAYTIME)
    }

    /**
     * Generates a clock pulse on the SCLK line:
     * - Set clock high then low to confirm the bit
     */
    private fun pulseClock() {
        HAL.setBits(SCLK_MASK)
        Time.sleep(DELAYTIME)
        HAL.clrBits(SCLK_MASK)
        Time.sleep(DELAYTIME)
    }
}
