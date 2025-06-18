package com.github.iselgt.roulette.control
import isel.leic.UsbPort

object HAL {

    var outputPort = 0

    fun init(mask: Int = 0x00) {
        outputPort = mask
        UsbPort.write(mask)
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
        outputPort = outputPort.and(mask.inv())
        UsbPort.write(outputPort)
    }

    //Force 1 on the bits chosen by the mask
    fun setBits(mask:Int){
        outputPort = mask.or(outputPort)
        UsbPort.write(outputPort)
    }

    //Chose the bits that u want to rewrite and force them with the input value
    fun writeBits(mask:Int, value:Int){
        clrBits(mask)
        setBits(value.and(mask))
    }
}