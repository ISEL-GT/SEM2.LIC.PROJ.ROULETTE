package com.github.iselgt.roulette.control.coin

import isel.leic.utils.Time

object CoinAcceptor {

    fun init() {
        CoinSignal.ACCEPT.unset() // Ensure ACCEPT signal is initially unset
    }

    /**
     * Waits for a coin to be detected and returns the credit value based on the coin type only when COIN is inactive.
     * @return The credit value for the detected coin. 2 credits if COIN_ID is inactive, 4 credit if only COIN is active.
     */
    fun waitCoin(): Int {

        if (CoinSignal.COIN.isActive()) { // Check if coin is detected

            val credits = if (CoinSignal.COIN_ID.isActive()) 4 else 2 // Return credit value based on COIN_ID status
            CoinSignal.ACCEPT.set()

            while (CoinSignal.COIN.isActive()) {
                Time.sleep(10)
                // Wait until the coin is no longer detected
            }

            CoinSignal.ACCEPT.unset() // Unset ACCEPT signal after processing the coin
            return credits
        }

        return 0
    }
}