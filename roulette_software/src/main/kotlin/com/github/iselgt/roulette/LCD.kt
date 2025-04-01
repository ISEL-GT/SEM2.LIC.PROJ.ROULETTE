package com.github.iselgt.roulette

import isel.leic.utils.Time

object LCD {
    private const val LINES = 2
    private const val COLS = 16

    private const val SERIAL_INTERFACE = false

    const val DATAMASK = 0x1E
    const val Enable_Mask = 0x80            // the value of 1000 0000 on outputPort
    const val RegisterSeletct_Mask = 0x40   // the value of 0100 0000 on outputPort

    const val Wait_first_time = 15L
    const val wait_time = 5L
    const val WAIT_NIMBLE_TIME = 20L

    /** Some values of 8 bits for the instructions used on LCD
     *
     *  These values correspond to diverse instructions
     *
     */
    const val Display_Clear = 0x01
    const val ReturnHome = 0x02

    /** Data -> 0000 0 1 I/D S
     *
     *  Instruction Entry mode set
     *
     *  I = 1 -> Increment
     *
     *  D = 0 -> Decrement
     *
     *  S -> Accompanies shift on/off
     */
    const val DecrementMode_Set = 0x04
    const val DecrementMode_Set_Shift = 0x05
    const val IncrementMode_Set = 0x06
    const val IncrementMode_Set_Shift = 0x07

    /** Data -> 0000 1DCB
     *
     *  Instruction Display on/off control
     *
     *  D -> Display on/off
     *
     *  C -> Cursor on/off
     *
     *  B -> Blinking Cursor on/off
     */

    const val Display_Off_without_cursor = 0x08
    const val Display_Off_without_cursor_blink = 0x09
    const val Display_Off_with_cursor = 0x0A
    const val Display_Off_with_cursor_blink = 0x0B

    const val Display_On_without_cursor = 0x0C
    const val Display_On_without_cursor_blink = 0x0D
    const val Display_On_with_cursor = 0x0E
    const val Display_On_with_cursor_blink = 0x0F

    /** Data -> 0001 S/C R/L 0 0
     *
     *  Instruction Cursor or Display shift
     *
     *  S = 1 -> Display shift
     *
     *  C = 0 -> Cursor move
     *
     *  R = 1 -> Shift to the right
     *
     *  L = 0 -> Shift to the left
     */

    const val Cursor_Shift_left = 0x10
    const val Cursor_Shift_right = 0x14
    const val Display_Shift_left = 0x18
    const val Display_Shift_right = 0x1C

    /** Data -> 001DL NF00
     *
     *  Instruction Function Set
     *
     *  DL = 1 -> 8 bits
     *
     *  DL = 0 -> 4 bits
     *
     *  N = 1 -> 2 lines
     *
     *  N = 0 -> 1 line
     *
     *  F = 1 -> 5x10 dots
     *
     *  F = 0 -> 5x8 dots
     */

    const val SET4BITS = 0x2
    const val SET8BITS = 0x3


    private fun writeDATA(data: Int) {
        writeByte(true, data)
    }

    private fun writeCMD(data: Int) {
        writeByte(false, data)
    }

    // Escreve um byte de comando/dados no LCD
    fun writeByte(rs: Boolean, data: Int) {


        // 4 bits mais significativos
        val topdata = data shr 4
        // 4 bits menos significativos
        val botdata = data and 0x0F

        writeNibble(rs, topdata)  // High
        writeNibble(rs, botdata)  // Low

    }

    // Escreve um nibble de comando/dados no LCD
    fun writeNibble(rs: Boolean, data: Int) {
        if (SERIAL_INTERFACE) writeNibbleSerial(rs, data.shl(1))
        else writeNibbleParallel(rs, data.shl(1))
    }


    // Escreve um byte de comando/dados no LCD em paralelo
    fun writeNibbleParallel(rs: Boolean, data: Int) {
        if (rs) {
            HAL.setBits(RegisterSeletct_Mask)
        }
        else{
            HAL.clrBits(DATAMASK)
        }
        Time.sleep(WAIT_NIMBLE_TIME)
        HAL.setBits(Enable_Mask)
        HAL.writeBits(DATAMASK, data)
        Time.sleep(WAIT_NIMBLE_TIME)
        HAL.clrBits(Enable_Mask)
        Time.sleep(WAIT_NIMBLE_TIME)
    }

    // Escreve um byte de comando/dados no LCD em serie
    fun writeNibbleSerial(rs: Boolean, data: Int) {
        TODO()
    }

    fun init() {
        Time.sleep(Wait_first_time)                         // Tempo de espera maior para init 15L
        writeNibble(false, SET8BITS)         //
        Time.sleep(wait_time)                               // Tempo de espera menor, 5L
        writeNibble(false, SET8BITS)         //
        Time.sleep(wait_time)                               // Tempo de espera menor, 5L
        writeNibble(false, SET8BITS)

        writeNibble(false, SET4BITS)         //
                                                            // Start 2 lines mode
        cursor(0, 0)
        writeCMD(0x28)
        writeCMD(0x08)
        writeCMD(0x01)
        writeCMD(0x06)
        writeCMD(Display_On_with_cursor_blink)
        Time.sleep(wait_time)

    }

    // UPcode e parametros

    fun write(c: Char) {
        if (c != KBD.vazio) writeDATA(c.code)   //.code => .toInt()
    }

    fun write(text: String) {
        for (c in text) {
            write(c)
        }
    }

    fun cursor(line: Int, column: Int) {
        val address = if (line == 0) 0x00 else SET4BITS
        writeCMD(address + column)
    }

    fun clear() {
        writeCMD(Display_Clear)
        Time.sleep(wait_time)
    }
}

fun main(){
    HAL.init()
    LCD.init()
    while (true){
        LCD.write(KBD.waitKey(500))
    }
}



























/*

object LCD{

    // Dimensao do display.
    private const val LINES = 2
    private const val COLS = 16

    // Define se a interface e Serie ou Paralela
    private const val SERIAL_INTERFACE = false

    // Escreve um byte de comando/dados no LCD em paralelo
    private fun writeNibbleParallel(rs: Boolean, data: Int){
        HAL.writeBits(0x10, if(rs)0x10 else 0x00)

        HAL.writeBits(0x0F, data)

        HAL.writeBits(0x20, 0x20)
        Thread.sleep(20)
        HAL.writeBits(0x20, 0x00)
    }

    // Escreve um byte de comando/ dados no LCD em serie
    private fun writeNibbleSerial(rs: Boolean, data: Int){

    }

    // Escreve um nibble de comando/ dados no LCD
    private fun writeNibble(rs: Boolean, data: Int){
        if(SERIAL_INTERFACE) writeNibbleSerial(rs, data) else writeNibbleParallel(rs, data)
    }

    // Escreve um byte de comando/ dados no LCD
    private fun writeByte( rs: Boolean, data: Int){
        writeNibble(rs, data shr  4)
        writeNibble(rs, data and 0x0F)
    }

    // Escreve um comando no LCD
    private fun writeCMD(data: Int){
        writeByte(false, data)
    }

    // Escreve um dado no LCD
    private fun writeDATA(data: Int){
        writeByte(true, data)
    }

    // Envia a sequencia de iniciacao para comunicacao a 4 bits.
    fun init(){
        Thread.sleep(15)
        writeNibble(false, 0x03)
        Thread.sleep(5)
        writeNibble(false, 0x03)
        Thread.sleep(1)
        writeNibble(false, 0x03)
        writeNibble(false, 0x02)

        cursor(0,0)
        writeCMD(0x0F)
        clear()
        writeCMD(0x07)
        Thread.sleep(2)
    }

    // Escreve um carater na posicao corrente.
    fun write(c: Char){
        if(c != 'N') writeDATA(c.code)
    }

    // Escreve uma string na posicao corrente.
    fun write(text: String){
        for(c in text) {
            write(c)
        }
    }

    // Envia comando para posicionar cursor('line':0..LINES-1 , 'column':0..COLS-1)
    fun cursor (line: Int, column: Int){
        val address = if (line == 0) 0x00 else 0x28
        writeCMD(address + column)
    }

    // Envia comando para limpar o ecra e posicionar o cursor em (0,0)
    fun clear(){
        writeCMD(0x01)
        Thread.sleep(2)
    }
}

fun main() {
    LCD.init()

    LCD.write(KBD.waitKey(500))
    LCD.write("HELLO WORD")

}
*/