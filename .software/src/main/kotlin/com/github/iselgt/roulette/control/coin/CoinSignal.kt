package com.github.iselgt.roulette.control.coin

import com.github.iselgt.roulette.control.COIN_ACCEPT_MASK
import com.github.iselgt.roulette.control.COIN_ID_MASK
import com.github.iselgt.roulette.control.COIN_MASK
import com.github.iselgt.roulette.control.HAL

enum class CoinSignal(val mask: Int, var value: Boolean) {
    COIN(COIN_MASK, false),  // UsbPort.I6
    COIN_ID(COIN_ID_MASK, false),  // UsbPort.I5

    ACCEPT(COIN_ACCEPT_MASK, false);  // UsbPort.O2

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