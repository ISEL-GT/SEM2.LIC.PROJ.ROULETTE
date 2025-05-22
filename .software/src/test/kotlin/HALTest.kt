package com.github.iselgt.roulette

import isel.leic.UsbPort
import kotlin.test.Test

class HALTest {

    @Test
    fun halGlobalTest() {

        HAL.init()
        var counter = 0x00

        while (true) {

            val value = UsbPort.read()
            HAL.setBits(counter)
            println("${counter}: ${Integer.toBinaryString(value)} | ${HAL.resetOutput}")
            counter++
            Thread.sleep(500)
        }
    }
}
