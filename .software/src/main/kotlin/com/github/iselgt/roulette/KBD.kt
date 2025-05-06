package com.github.iselgt.roulette
import isel.leic.utils.Time


object KBD {

    const val EMPTY_CHAR = 0x00.toChar()            // and empty char
    private const val KVAL = 0x01                   // the value 0000 0001 of the UsbPort Input  -> correspond to the bit that shows if the key is valid or not
    private const val K = 0x1E                      // the value 0001 1110 of the UsbPort Input  -> correspond to the bits that shows the k value
    private const val KACK = 0x01                   // the value 0000 0001 of the UsbPort Output -> correspond to the bits that acknowledge the valid key

    private val keys = charArrayOf('1', '4', '7', '*', '2', '5', '8', '0', '3', '6', '9', '#', 'A', 'B', 'C', 'D')

    fun init () {
        HAL.init()
    }

    private fun getKey(): Char {
        if (HAL.isBit(KVAL)) {
            val key = HAL.readBits(K)
            HAL.setBits(KACK)

            while(HAL.isBit(KVAL)) {}
                  HAL.clrBits(KACK)
                  return keys[key.shr(1)]   // We use a logical shift right as the values of the K3:0 are the UsbPortInput(4:1)
            }
        return EMPTY_CHAR
    }

    fun waitKey(timeout : Long): Char {
        val endTime = timeout + Time.getTimeInMillis()
        var key: Char
        do {
            key = getKey()
        } while (Time.getTimeInMillis() < endTime && key == EMPTY_CHAR)
        return key
    }
}