package com.github.iselgt.roulette

import isel.leic.utils.Time

object SerialEmitter {

    enum class Destination { LCD, ROULETTE }

<<<<<<< HEAD
    private const val SDX = 0x01                // Serial data line -> O1
=======
    private const val SDX = 0x02                // Serial data line -> 01
>>>>>>> e83e1c93fb2b2be1da6c12f1009f33c2386df160
    private const val LCD_MASK = 0x20           // Enables LCD communication -> O5
    private const val ROULETTE_MASK = 0x40      // Enables ROULETTE communication -> O6
    private const val SCLK_MASK = 0x80          // Serial clock pulse -> O7

    /**
     * Initializes the serial interface:
     * - Enables both destinations
     * - Clears the clock line
     */
    fun init() {
        HAL.init()
        HAL.setBits(LCD_MASK)
        HAL.setBits(ROULETTE_MASK)
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

        // Disable destination before transmission
        HAL.clrBits(address)

        // Send data bits with Rs first and then the D0-D3
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

        // Re-enable destination after transmission
        HAL.setBits(address)
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
        Time.sleep(200L)
    }

    /**
     * Generates a clock pulse on the SCLK line:
     * - Set clock high then low to confirm the bit
     */
    private fun pulseClock() {
        HAL.setBits(SCLK_MASK)
        HAL.clrBits(SCLK_MASK)
    }
}
<<<<<<< HEAD
fun main(){
    SerialEmitter.send(SerialEmitter.Destination.LCD, 0x15, 5)
=======

fun main(){
    SerialEmitter.send(SerialEmitter.Destination.LCD, 0x15, 5)
    Thread.sleep(200)
    SerialEmitter.send(SerialEmitter.Destination.LCD, 0x15, 5)
    Thread.sleep(200)
    SerialEmitter.send(SerialEmitter.Destination.LCD, 0x15, 5)

>>>>>>> e83e1c93fb2b2be1da6c12f1009f33c2386df160
}

