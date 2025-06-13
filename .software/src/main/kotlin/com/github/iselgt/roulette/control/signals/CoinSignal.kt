package com.github.iselgt.roulette.control.signals

import com.github.iselgt.roulette.control.HAL

enum class CoinSignal(val mask: Int, var value: Boolean) {
    COIN(0x40, false),  // UsbPort.I6
    COIN_ID(0x20, false),  // UsbPort.I5

    ACCEPT(0x04, false);  // UsbPort.O2

    /**
     * Checks if the signal is active by reading the corresponding bit in the HAL.
     * @return true if the signal is active, false otherwise.
     */
    fun isActive(): Boolean {
        val value = HAL.readBits(mask)
        this.value = value != 0
        return this.value
    }

    /**
     * Sets the signal to active by setting the corresponding bit in the HAL.
     */
    fun set() {
        HAL.setBits(mask)
        this.value = true
    }

    /**
     * Unsets the signal by clearing the corresponding bit in the HAL.
     */
    fun unset() {
        HAL.clrBits(mask)
        this.value = false
    }
}