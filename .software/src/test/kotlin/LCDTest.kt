package com.github.iselgt.roulette

import kotlin.test.Test

class LCDTest {

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
}