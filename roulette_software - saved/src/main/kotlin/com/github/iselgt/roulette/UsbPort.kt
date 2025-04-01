package com.github.iselgt.roulette
import com.github.iselgt.roulette.HAL
import isel.leic.UsbPort

fun main(args: Array<String>) {

    HAL.init()
    var counter = 0

    while (true) {

        val value = UsbPort.read()
        println("${counter++}: ${Integer.toBinaryString(value)}")

        Thread.sleep(500)
    }
}

