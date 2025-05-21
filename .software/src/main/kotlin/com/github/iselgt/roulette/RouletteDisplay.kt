package com.github.iselgt.roulette

object RouletteDisplay {
    // Dependem dos valores do SerialEmitter
    private const val RDSELECT = 0x40
    private const val SCLK = 0x80
    private const val SDX = 0x02


    private const val UPDATEDISPLAY = 0x06
    private const val DISPLAYOFF = 0x17
    private const val DISPLAYON = 0x07

    fun init() {
        SerialEmitter.init()
    }

    private const val ANIMATION_DELAY = 100L // milliseconds

    fun animation() {
        var value = 0
        repeat(20) {
            value = (Math.random() * 256).toInt() // Random pattern of segments
            setValue(value)
            Thread.sleep(ANIMATION_DELAY)
        }
    }

    fun setValue(value: Int) {
        val string = value.toString()
        val size = string.length
        var cmd = size - 1

        var digits = 0

        while (digits < size) {
            val code = string[digits].digitToInt() //extrair valor numerico de cada caracter
            val data = code.shl(3) //4 bits de dados para o lado, os 3 de menor peso vão ser os de cmd
            val sentValue = data + cmd
            SerialEmitter.send(SerialEmitter.Destination.ROULETTE, sentValue, 8)
            digits++
            cmd--
        }

        SerialEmitter.send(SerialEmitter.Destination.ROULETTE, UPDATEDISPLAY, 8)
    }

    //se for true desliga, baseado na tabela dos comandos do roulette
    fun off(value: Boolean) {
        if (value) SerialEmitter.send(SerialEmitter.Destination.ROULETTE, DISPLAYOFF, 8)
        else SerialEmitter.send(SerialEmitter.Destination.ROULETTE, DISPLAYON, 8)
    }
}