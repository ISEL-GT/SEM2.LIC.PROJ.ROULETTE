package com.github.iselgt.roulette
import com.github.iselgt.roulette.KBD.init
import com.github.iselgt.roulette.KBD.waitKey
import com.github.iselgt.roulette.LCD
import isel.leic.utils.Time

object KBD {

    const val vazio = 0x00.toChar() // and empty char
    const val Kval = 0x01           // the value 0000 0001 of the UsbPort Input  -> correspond to the bit that shows if the key is valid or not
    const val K = 0x1E              // the value 0001 1110 of the UsbPort Input  -> correspond to the bits that shows the k value
    const val Kack = 0x01           // the value 0000 0001 of the UsbPort Output -> correspond to the bits that acknowledge the valid key

    val keys = charArrayOf('1', '4', '7', '*', '2', '5', '8', '0', '3', '6', '9', '#', 'A', 'B', 'C', 'D')

    fun init () {
        HAL.init()
    }

    fun getKey(): Char {
        if (HAL.isBit(Kval)) {
            val key = HAL.readBits(K)
            HAL.setBits(Kack)
            if (!HAL.isBit(Kval)) {
                HAL.clrBits(Kack)
                return keys[key.shr(1)] // We use a logical shift right as the values of the K3:0 are the UsbPortInput(4:1)
            }
        }
        return vazio
    }

    fun waitKey(timeout : Long): Char {
        val endTime = timeout + Time.getTimeInMillis()
        var key = vazio
        do {
            key = getKey()
        } while (Time.getTimeInMillis() < endTime && key == vazio)
        return key
    }
}


