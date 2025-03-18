import isel.leic.UsbPort

object HAL {
    var lastOutput = 0

    fun init(){
        lastOutput = 0
        UsbPort.write(lastOutput)
    }

    fun isBit(mask: Int):Boolean {
        return UsbPort.read().and(mask) != 0
    }

    fun readBits(mask:Int):Int{
        return UsbPort.read().and(mask)
    }

    fun clrBits(mask:Int) {
        lastOutput = lastOutput.and(0xFF - mask)
        UsbPort.write(lastOutput)
    }

    fun setBits(mask:Int){
        lastOutput = mask.or(lastOutput)
        UsbPort.write(lastOutput)
    }

    fun writeBits(mask:Int, value:Int){
        clrBits(mask)
        setBits(value.and(mask))
    }
}