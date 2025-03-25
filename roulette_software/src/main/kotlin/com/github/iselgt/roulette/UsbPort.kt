package com.github.iselgt.roulette
import isel.leic.UsbPort

fun main(args: Array<String>) {
    HAL.init()

    while(true){
        val value = UsbPort.read()
        UsbPort.write(value)
    }
}

