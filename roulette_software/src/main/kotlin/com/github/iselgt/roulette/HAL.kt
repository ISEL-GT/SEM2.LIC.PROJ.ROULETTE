package com.github.iselgt.roulette

import isel.leic.UsbPort

object HAL {
    var resetOutput = 0

    fun init(){
        resetOutput = 0
        UsbPort.write(resetOutput)
    }

    fun isBit(mask: Int):Boolean {
        require(mask.toString().length==1){ "mask must be one bit only" }
        return UsbPort.read().and(mask) != 0
    }

    fun readBits(mask:Int):Int{
        return UsbPort.read().and(mask)
    }

    fun clrBits(mask:Int) {
        resetOutput = resetOutput.and(0xFF - mask)
        UsbPort.write(resetOutput)
    }

    fun setBits(mask:Int){
        resetOutput = mask.or(resetOutput)
        UsbPort.write(resetOutput)
    }

    fun writeBits(mask:Int, value:Int){
        clrBits(mask)
        setBits(value.and(mask))
    }
}