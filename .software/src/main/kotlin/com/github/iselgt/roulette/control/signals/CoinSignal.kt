package com.github.iselgt.roulette.control.signals

import com.github.iselgt.roulette.control.HAL

enum class CoinSignal(val mask: Int) {
    COIN(0x40),  // UsbPort.I6
    COIN_ID(0x20),  // UsbPort.I5

    ACCEPT(0x02);  // UsbPort.O2

    /**
     * Checks if the signal is active by reading the corresponding bit in the HAL.
     * @return true if the signal is active, false otherwise.
     */
    fun isActive(): Boolean {
        return HAL.isBit(mask)
    }

    /**
     * Sets the signal to active by setting the corresponding bit in the HAL.
     */
    fun set() {
        HAL.setBits(mask)
    }

    /**
     * Unsets the signal by clearing the corresponding bit in the HAL.
     */
    fun unset() {
        HAL.clrBits(mask)
    }
}