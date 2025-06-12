package com.github.iselgt.roulette.control

import com.github.iselgt.roulette.control.signals.CoinSignal

object CoinAcceptor {

    /**
     * Waits for a coin to be detected within the specified timeout period.
     * @return The credit value for the detected coin. 2 credits if COIN_ID is inactive, 4 credit if only COIN is active.
     */
    fun waitCoin(timeout: Int): Int {
        val startTime = System.currentTimeMillis()

        while (System.currentTimeMillis() - startTime < timeout) {
            if (CoinSignal.COIN.isActive()) { // Check if coin is detected

                val credits = if (CoinSignal.COIN_ID.isActive()) 4 else 2 // Return credit value based on COIN_ID status
                CoinSignal.ACCEPT.set()
                return credits
            }
        }
        return 0 // Timeout reached without detecting a coin
    }
}