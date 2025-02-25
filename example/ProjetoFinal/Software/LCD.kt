import isel.leic.utils.Time

object LCD { // Escreve no LCD usando a interface a 4 bits.
    //    const val LINES = 2
    val COLS = 16// Dimensão do display.
    const val E_MASK = 0X20
    const val RS_MASK = 0x10
    const val CLK_MASK = 0X40
    const val DATA_MASK = 0X0F

    // Envia a sequência de iniciação para comunicação a 4 bits.
    fun init() {
        SerialEmitter.init()
        writeCMD(0b00110000)
        Time.sleep(15)
        writeCMD(0b00110000)
        Time.sleep(1)
        writeCMD(0b00110000)
        writeCMD(0b00111000)
        writeCMD(0b00001000)
        writeCMD(0b00000001)
        writeCMD(0b00000110)
        writeCMD(0b00001111)
        loadCustomChars()
    }

    fun writeByteSerial(rs: Boolean, data: Int) {
        val rS = if (rs) 1 else 0
        SerialEmitter.send(addr = SerialEmitter.Destination.LCD, data.shl(1) + rS, 9)
    }

    // Escreve um byte de comando/dados no LCD
    fun writeByte(rs: Boolean, data: Int) {
        writeByteSerial(rs, data)
        //writeByteParallel(rs,data)
    }

    // Escreve um comando no LCD
    fun writeCMD(data: Int) {
        writeByte(false, data)
    }

    // Escreve um dado no LCD
    fun writeDATA(data: Int) {
        writeByte(true, data)
    }

    // Escreve um caráter na posição corrente.
    fun write(c: Char) {
        writeDATA(c.code)
    }

    // Escreve uma string na posição corrente.
    fun write(text: String) {
        for (c in text) {
            write(c)
        }
    }

    // Envia comando para posicionar cursor (‘line’:0..LINES-1 , ‘column’:0..COLS-1)
    fun cursor(line: Int, column: Int) {
        writeCMD((line * 0X40 + column) or 0x80)
    }

    // Envia comando para limpar o ecrã e posicionar o cursor em (0,0)
    fun clear() {
        writeCMD(0b00000001)
        cursor(0, 0)
    }

    fun invader() {
        writeCMD (0x40)
        writeDATA(0x1F)
        writeDATA(0x1F)
        writeDATA(0x15)
        writeDATA(0x1F)
        writeDATA(0x1F)
        writeDATA(0x11)
        writeDATA(0x11)
        writeDATA(0x00)
    }

    fun spaceShip() {
        writeCMD (0x48)
        writeDATA(0x1E)
        writeDATA(0x18)
        writeDATA(0x1C)
        writeDATA(0x1F)
        writeDATA(0x1C)
        writeDATA(0x18)
        writeDATA(0x1E)
        writeDATA(0x00)
    }
    fun loadCustomChars() {
        invader()
        spaceShip()
    }
}