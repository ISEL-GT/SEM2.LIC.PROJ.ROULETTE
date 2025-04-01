package com.github.iselgt.roulette

import com.github.iselgt.roulette.LCD
import isel.leic.UsbPort

object HAL {
    var resetOutput = 0

    fun init(){
        resetOutput = 0
        UsbPort.write(resetOutput)
    }

    //Checks if the bit chosen by the mask is on
    fun isBit(mask: Int):Boolean {
        require(mask.countOneBits()==1){ "mask must be one bit only" }
        return UsbPort.read().and(mask) != 0
    }

    //Read the bits chosen by the mask and puts 0 on the bits that you aren't checking
    fun readBits(mask:Int):Int{
        return UsbPort.read().and(mask)
    }

    //Force 0 on the bits chosen by the mask
    fun clrBits(mask:Int) {
        resetOutput = resetOutput.and(mask.inv())
        UsbPort.write(resetOutput)
    }

    //Force 1 on the bits chosen by the mask
    fun setBits(mask:Int){
        resetOutput = mask.or(resetOutput)
        UsbPort.write(resetOutput)
    }

    //Chose the bits that u want to rewrite and force them with the input value
    fun writeBits(mask:Int, value:Int){
        clrBits(mask)
        setBits(value.and(mask))
    }
}


/*
import kotlin.math.exp
// HAL ALEX
object HAL {

    /**
     * A representation of the output stream, used to track the data within it
     */
    public var outputStream = 0x00

    fun init() = writeBits(0)

    /**
     * Checks if the bits specified by the mask match.
     * Useful for checking if a bit is set to 1.
     *
     * @param mask The mask used to match the bits
     * @return Whether the mask is matched or not
     */
    fun isBit(mask: Int) : Boolean = readBits(mask) != 0x0

    /**
     * Returns the value of the bits specified by the mask
     *
     * @param mask The mask with the bits to match against
     * @return A binary string with the values for the matched vals
     */
    fun readBits(mask: Int) : Int = UsbPort.read().and(mask)

    /**
     * Clears the bits, setting whatever values of mask = 1 to 0 and writing it into
     * the USB Port channel.
     *
     * @param mask The mask to match against
     */
    fun clrBits(mask: Int) : HAL {
        writeBits(mask.inv(), outputStream)
        return this
    }

    /**
     * Sets the bits specified by the mask as '1'
     * @param mask The mask to match against
     */
    fun setBits(mask: Int): HAL {
        val expression = mask or outputStream

        writeBits(expression)
        return this
    }

    /**
     * Writes the existing "value" bits on the indexes specified by "mask"
     *
     * @param mask The mask to match against
     * @param value The value to get the bits from
     */
    fun writeBits(mask: Int, value: Int = mask): HAL {
        outputStream = mask and value
        UsbPort.write(outputStream)

        return this
    }
}
*/
