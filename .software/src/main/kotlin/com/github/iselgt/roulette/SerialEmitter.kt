package com.github.iselgt.roulette

object SerialEmitter {
    private const val SLCD_MASK = 0x01
    private const val ROULETTE_MASK = 0x02

    private const val SCLK_MASK = 0x10
    private const val SDX_PARITY = 0x08


    enum class Destination {LCD, ROULETTE}

    fun init() {
        HAL.init()
        //LCD.init()
        HAL.setBits(SLCD_MASK)
        HAL.setBits(ROULETTE_MASK)
        HAL.clrBits(SCLK_MASK)
    }

    /**
     * destino, dados, n bits de dados
     */
    fun send(addr: Destination, data: Int, size : Int) {
        val address = if (addr == Destination.LCD) SLCD_MASK else ROULETTE_MASK
        var parity = 0
        var count = 0
        var parityMask = 0x01

        HAL.clrBits(address)

        repeat(size){
            val value = data.and(parityMask)

            if (value != 0){
                count++
                HAL.setBits(SDX_PARITY)
                HAL.setBits(SCLK_MASK)
                HAL.clrBits(SCLK_MASK)
            }
            else {
                HAL.clrBits(SDX_PARITY)
                HAL.setBits(SCLK_MASK)
                HAL.clrBits(SCLK_MASK)
            }
            parityMask.shl(1) //prox bit, mais eficiente q * 2
        }

        if (count%2==0){
            parity = SDX_PARITY
        }   //else == 0

        HAL.writeBits(SDX_PARITY, parity)
        HAL.setBits(SCLK_MASK)
        HAL.clrBits(SCLK_MASK)


        HAL.setBits(address)
    }
}
