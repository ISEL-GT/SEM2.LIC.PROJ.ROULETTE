package com.github.iselgt.roulette
import isel.leic.UsbPort

fun main() {

    HAL.init()
    var counter = 0

    while (true) {

        val value = UsbPort.read()
        println("${counter++}: ${Integer.toBinaryString(value)}")

        Thread.sleep(500)
    }
}

