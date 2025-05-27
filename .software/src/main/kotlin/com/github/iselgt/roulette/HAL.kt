package com.github.iselgt.roulette
import isel.leic.UsbPort

object HAL {

    private var resetOutput = 0

    fun init() {
        resetOutput = 0
        UsbPort.write(resetOutput)
    }

    //Checks if the bit chosen by the mask is on
    fun isBit(mask: Int):Boolean = readBits(mask) != 0

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