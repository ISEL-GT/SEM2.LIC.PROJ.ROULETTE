package com.github.iselgt.roulette
import isel.leic.UsbPort

object HAL {

    var resetOutput = 0

    fun init() {
        resetOutput = 0
        UsbPort.write(resetOutput)
    }

    //Checks if the bit chosen by the mask is on
    fun isBit(mask: Int):Boolean = readBits(mask) != 0

    /**
     * Reads the bits from the UsbPort Input (I0-I7) and returns the value masked by the mask.
     * @return the value of the bits read from the UsbPort Input masked by the mask.
     */
    fun readBits(mask: Int): Int{
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