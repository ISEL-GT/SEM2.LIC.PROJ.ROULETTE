import isel.leic.UsbPort
// Virtualiza o acesso ao sistema UsbPort
object HAL {
    var lastOutput = 0
    // Inicia a classe
    fun init () {
        lastOutput = 0
        UsbPort.write(lastOutput)
    }
    // Retorna true se o bit tiver o valor lógico ‘1’
    fun isBit (mask:Int) : Boolean {
        return UsbPort.read().and(mask) != 0
    }
    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBits(mask: Int): Int{
        return UsbPort.read().and(mask)
    }
    // Escreve nos bits representados por mask os valores dos bits correspondentes em value
    fun writeBits(mask: Int, value: Int) {
        clrBits(mask)
        setBits(value and mask)
    }
    // Coloca os bits representados por mask no valor lógico ‘1’
    fun setBits (mask: Int) {
        lastOutput = mask.or(lastOutput)
        UsbPort.write(lastOutput)
    }
    // Coloca os bits representados por mask no valor lógico ‘0’
    fun clrBits(mask:Int) {
        lastOutput = lastOutput.and(0xFF - mask)
        UsbPort.write(lastOutput)
    }
}