package com.github.iselgt.roulette.control
import com.github.iselgt.roulette.control.KBD.waitKey
import isel.leic.utils.Time


object KBD {

    const val EMPTY_CHAR = 0x00.toChar()    // and empty char

    private val keys = charArrayOf('1', '4', '7', '*', '2', '5', '8', '0', '3', '6', '9', '#', 'A', 'B', 'C', 'D')

    fun init () {
        HAL.init()
    }

    private fun getKey(): Char {
        if (HAL.isBit(K_VAL_MASK)) {
            val key = HAL.readBits(K_MASK)
            HAL.setBits(ACK_MASK)

            while(HAL.isBit(K_VAL_MASK)) {
                // do nothing
            }

            HAL.clrBits(ACK_MASK)
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
fun main() {
    KBD.init()

    while (true) {
        val keyPressed = waitKey(1000)
        if (keyPressed == KBD.EMPTY_CHAR) continue

        print(keyPressed)
    }
}