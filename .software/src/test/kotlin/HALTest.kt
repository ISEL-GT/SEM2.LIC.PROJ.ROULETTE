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
            HAL.setBits(7)
            println("${counter++}: ${Integer.toBinaryString(value)} | ${Integer.toBinaryString(HAL.readBits(0xFF))}")
            Thread.sleep(500)
        }
    }
}
