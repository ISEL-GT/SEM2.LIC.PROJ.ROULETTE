package com.github.iselgt.roulette

import com.github.iselgt.roulette.control.KBD
import com.github.iselgt.roulette.control.LCD
import kotlin.test.Test

class LCD {

    @Test
    fun lcdTest(){
        LCD.init()
        while (true){
            val Key = KBD.waitKey(200)
            LCD.write(Key)
            if (Key =='*') {
                break
            }
        }
    }

    @Test
    fun lcdHelloWorld() {
        initPeripherics()
        LCD.write("Hello World")

        while (true) LCD.write(KBD.waitKey(2000))
    }
}