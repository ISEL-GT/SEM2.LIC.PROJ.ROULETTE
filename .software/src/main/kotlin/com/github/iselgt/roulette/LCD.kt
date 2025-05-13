package com.github.iselgt.roulette

import isel.leic.utils.Time
import jdk.internal.org.jline.utils.Colors.s

object LCD {
    private const val LINES = 2
    private const val COLS = 16

    private const val SERIAL_INTERFACE = false

    // Useful Constants to use with LCD
    private const val NONE_VALUE = 0x00                 // Null-Terminator value for when no key has been pressed
    private const val DATA_MASK = 0x1E                  // A useful mask that correspond to the 4 bits key
    private const val ENABLE_MASK = 0x80                // A useful mask that correspond to enable
    private const val REGISTER_SELECTOR_MASK= 0x40      // A useful mask that correspond to the register selector

    private const val WAIT_FIRST_TIME = 15L
    private const val WAIT_TIME = 5L

    // LCD Command Constants
    private const val LCD_CLEAR = 0x01                  // Clear display & reset cursor to (0,0)
    const val LCD_HOME = 0x02                           // Return cursor to (0,0) without clearing
    private const val LCD_ENTRY_MODE = 0x06             // Cursor moves right, no display shift
    private const val LCD_DISPLAY_OFF = 0x08            // Turn off display
    const val LCD_DISPLAY_ON = 0x0C                     // Display ON, Cursor OFF, Blink OFF
    const val LCD_DISPLAY_ON_CURSOR = 0x0E              // Display ON, Cursor ON, No Blink
    private const val LCD_DISPLAY_ON_BLINK = 0x0F       // Display ON, Cursor ON, Blink ON
    private const val LCD_FUNCTION_SET = 0x28           // 4-bit mode, 2 lines, 5x8 font

    // Cursor Positioning Constants
    private const val LCD_LINE_1 = 0x80                 // First line
    private const val LCD_LINE_2 = 0xC0                 // Second line

    // Mode Sets Bits Constants
    private const val SET4BITS = 0x2                    // Entry Mode Set 4 bits long
    private const val SET8BITS = 0x3                    // Entry Mode Set 8 bits long

    private var currCol = 0
    private var currLine = 0

    private fun writeDATA(data: Int) {
        writeByte(true, data)
    }

    private fun writeCMD(data: Int) {
        writeByte(false, data)
    }

    // Writes a Byte command/data on LCD
    private fun writeByte(rs: Boolean, data: Int) {

        // The 4 most significant bits
        val topdata = data shr 4
        // The 4 less significant bits
        val botdata = data and 0x0F

        writeNibble(rs, topdata)  // High
        writeNibble(rs, botdata)  // Low

    }

    // Writes a nibble command/data on LCD
    private fun writeNibble(rs: Boolean, data: Int) {
        if (SERIAL_INTERFACE) writeNibbleSerial(rs, data.shl(1))
        else writeNibbleParallel(rs, data.shl(1))
    }


    // Writes a nibble (4 bits) of command/data to the LCD in Parallel Mode
    private fun writeNibbleParallel(rs: Boolean, data: Int) {
        // Set or clear the Register Select (RS) pin depending on whether sending data or command
        if (rs) {
            HAL.setBits(REGISTER_SELECTOR_MASK)     // RS = 1 for data
        }
        else {
            HAL.clrBits(REGISTER_SELECTOR_MASK)     // RS = 0 for command
        }
        HAL.setBits(ENABLE_MASK)                    // Set the Enable (E) pin to high to latch the data

        HAL.writeBits(DATA_MASK, data)              // Send the 4-bit data by writing it to the data lines

        Time.sleep(WAIT_TIME)                       // Hold Enable high for a short period to ensure the data is latched

        HAL.clrBits(ENABLE_MASK)                    // Set the Enable (E) pin to low to complete the data transfer

        Time.sleep(WAIT_TIME)                       // Wait again before the next operation (optional depending on hardware)
    }


    // Writes a nibble (4 bits) of command/data to the LCD in Serial Mode
    private fun writeNibbleSerial(rs: Boolean, data: Int) {
        val rsBit = if (rs) 1 else 0
        val result = (data shl 1) or (rsBit)

        SerialEmitter.send(SerialEmitter.Destination.LCD, result, 5)
    }

    fun init() {
        // Initiate LCD with 8-bit mode before switching to 4-bit mode
        Time.sleep(WAIT_FIRST_TIME)                 // Longer wait time for power-on
        writeNibble(false, SET8BITS)
        Time.sleep(WAIT_TIME)
        writeNibble(false, SET8BITS)
        Time.sleep(WAIT_TIME)
        writeNibble(false, SET8BITS)

        // Now switch to 4-bit mode
        writeNibble(false, SET4BITS)

        // Configure LCD settings using named constants
        writeCMD(LCD_FUNCTION_SET)                  // 4-bit mode, 2-line, 5x8 font
        writeCMD(LCD_DISPLAY_OFF)                   // Display OFF
        writeCMD(LCD_CLEAR)                         // Clear display
        Time.sleep(WAIT_TIME)                       // Extra delay needed for clearing
        writeCMD(LCD_ENTRY_MODE)                    // Cursor moves right
        writeCMD(LCD_DISPLAY_ON_BLINK)              // Display ON, Cursor ON, Blink ON
        Time.sleep(WAIT_TIME)                       // Short delay for stability
    }



    fun write(c: Char) {
        if (c != NONE_VALUE.toChar()){
            if (currCol>=COLS){
                currLine++
                currCol = 0
                cursor(currLine, currCol)
            }
            writeDATA(c.code)
            currCol = (currCol+1)%COLS
        }   //.code => .toInt()

        }   //.code = .toInt()


    fun write(text: String) {
        for (c in text) {
            write(c)
        }
    }

    fun cursor(line: Int, column: Int) {
        val address = when (line) {
            0 -> LCD_LINE_1 + column                // First line
            1 -> LCD_LINE_2 + column                // Second line
            else -> LCD_LINE_1                      // Default to first line if invalid
        }
        writeCMD(address)
    }

    fun clear() {
        writeCMD(LCD_CLEAR)
        Time.sleep(WAIT_TIME)
    }
}

fun main() {

    /*
    HAL.init()
    LCD.init()
    while (true) {
        LCD.write(KBD.waitKey(500))
    }
    */

}