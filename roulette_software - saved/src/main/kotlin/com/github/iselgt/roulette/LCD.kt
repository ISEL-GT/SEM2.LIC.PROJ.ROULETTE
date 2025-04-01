package com.github.iselgt.roulette

import com.github.iselgt.roulette.KBD
import isel.leic.UsbPort
import jdk.internal.org.jline.utils.Display
/*
object LCD {
    private const val LINES = 2
    private const val COLS = 16

    private const val SERIAL_INTERFACE = false

    const val Enable_Mask = 0x80            // the value of 1000 0000 on outputPort
    const val RegisterSeletct_Mask = 0x40   // the value of 0100 0000 on outputPort

    const val Wait_first_time = 15L
    const val wait_time = 5L

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

    const val Set4bits_with_1lines = 0x20
    const val Set4bits_with_1linesF = 0x24
    const val Set4bits_with_2lines = 0x28
    const val Set4bits_with_2linesF = 0x2C

    const val Set8bits_with_1lines = 0x30
    const val Set8bits_with_1linesF = 0x34
    const val Set8bits_with_2lines = 0x38
    const val Set8bits_with_2linesF = 0x3C


    private fun writeDATA(data: Int) {
        writeByte(false, data)
    }

    private fun writeCMD(data: Int) {
        writeByte(true, data)
    }

    // Escreve um byte de comando/dados no LCD
    fun writeByte(rs: Boolean, data: Int) {

        // 4 bits mais significativos
        val topString = data.toString().substring(0, 4).toInt()

        // 4 bits menos significativos
        val botString = data.toString().substring(4, 8).toInt()

        writeNibble(rs, topString)
        println(botString)
        println(topString)
        writeNibble(rs, botString)
    }


    // Escreve um nibble de comando/dados no LCD
    fun writeNibble(rs : Boolean , data: Int) {
        if (SERIAL_INTERFACE) writeNibbleSerial(rs, data)
        else writeNibbleParallel(rs, data)
    }



    // Escreve um byte de comando/dados no LCD em paralelo
    fun writeNibbleParallel(rs : Boolean , data: Int) {
        HAL.writeBits(0xFF, Set4bits_with_2linesF)
        HAL.writeBits(


         HAL.writeBits(0x10, if(rs)0x10 else 0x00)

                HAL.writeBits(0x0F, data)

                HAL.writeBits(0x20, 0x20)
                Thread.sleep(20)
                HAL.writeBits(0x20, 0x00)
    }

    // Escreve um byte de comando/dados no LCD em serie
    fun writeNibbleSerial(rs : Boolean , data: Int) {
        TODO()
    }

    fun init(){
        Thread.sleep(Wait_first_time)
        KBD.init()
        writeCMD(Set4bits_with_1linesF)
    }

    fun write(c: Char) {
    }

    fun write(text: String) {
    }

    fun cursor(line: Int, column: Int){
    }

    fun clear(){
    }
}
*/








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
