object CoinAcceptor {

    private const val COIN_MASK = 0x40
    private const val COIN_ACCEPT_MASK = 0x40


    fun init() {
        HAL.clrBits(COIN_ACCEPT_MASK)
    }

    fun isCoin(): Boolean {
        return HAL.isBit(COIN_MASK)
    }

    fun newCoin() {

        HAL.setBits(COIN_ACCEPT_MASK)
        HAL.clrBits(COIN_ACCEPT_MASK)
    }
}