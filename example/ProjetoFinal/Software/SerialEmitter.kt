object SerialEmitter { // Envia tramas para os diferentes mÃ³dulos Serial Receiver.
    enum class Destination { LCD, SCORE }
    private const val SSLCD_MASK = 0x01
    private const val SSSCORE_MASK = 0x02
    private const val SCLK_MASK = 0x10
    private const val SDX_VAL = 0x08
    fun init() {
        HAL.init()
        HAL.setBits(SSLCD_MASK)
        HAL.setBits(SSSCORE_MASK)
        HAL.clrBits(SCLK_MASK)
    }
    fun send(addr: Destination, data: Int, size : Int){
        val adress = if(addr == Destination.LCD) SSLCD_MASK else SSSCORE_MASK
        var parity = 0
        var paridadeFinal = 0x01
        var count= 0
        HAL.clrBits(adress)
        repeat(size) {
            val value = data.and(paridadeFinal)
            if (value!=0){
                count += 1
                HAL.setBits(SDX_VAL)
                HAL.setBits(SCLK_MASK)
                HAL.clrBits(SCLK_MASK)
            }
            else {
                HAL.clrBits(SDX_VAL)
                HAL.setBits(SCLK_MASK)
                HAL.clrBits(SCLK_MASK)
            }
            paridadeFinal *= 2
        }
        if (count % 2!=0)
            parity = SDX_VAL
        HAL.writeBits(SDX_VAL, parity)
        HAL.setBits(SCLK_MASK)
        HAL.clrBits(SCLK_MASK)
        HAL.setBits(adress)


    }
}