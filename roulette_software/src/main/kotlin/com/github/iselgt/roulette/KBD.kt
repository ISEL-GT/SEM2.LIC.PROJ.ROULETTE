package com.github.iselgt.roulette
import com.github.iselgt.roulette.KBD.init
import com.github.iselgt.roulette.KBD.waitKey
import com.github.iselgt.roulette.LCD
import com.github.iselgt.roulette.components.Mask
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
            HAL.clrBits(Kack)
            while(!HAL.isBit(Kval)) {
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

/*
// ALEX KBD
object KBD {

    private val CHARACTERS = charArrayOf('1', '4', '7', '*', '2', '5', '8', '0', '3', '6', '9', '#', 'A', 'B', 'C', 'D')

    fun init () = HAL.init()

    /**
     * Immediately returns the pressed key or NONE if it doesn't exist
     * @return The pressed character
     */
    fun getKey(): Char {

        val value = HAL.readBits(Mask.K())
        return CHARACTERS[value.shr(1)]
    }

    /**
     * Waits for a key input and returns the key if it is not within timeout
     *
     * @param timeout The timeout in ms for the key being pressed
     * @return The pressed character, or NONE if timed out
     */
    fun waitKey(timeout : Long): Char {

        // Sets the keypress time-out
        val timeout = Time.getTimeInMillis() + timeout
        var key = Mask.NONE_VALUE().toChar()

        while (Time.getTimeInMillis() < timeout) {

            // Checks if a key has been pressed by comparing the input with KVal
            if (!HAL.isBit(Mask.KVAL())) continue

            // Reads the key and acknowledges the reception
            key = getKey()
            HAL.setBits(Mask.KACK())
            break
        }

        // Clears the flags and port output
        HAL.clrBits(Mask.KACK())
        return key
    }
}
*/
