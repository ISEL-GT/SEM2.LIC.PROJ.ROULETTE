import isel.leic.utils.Time

object ScoreDisplay { // Controla o mostrador de pontuação.
    const val SS_SCORE = 0x02
    const val SCLK_SCORE = 0x10
    const val SDX_SCORE = 0x08

    // Inicia a classe, estabelecendo os valores iniciais.
    fun init() {
        SerialEmitter.init()
    }

    // Envia comando para atualizar o valor do mostrador de pontuação
    fun setScore(value: Int) { //ainda n esta validado
        val tamanho = value.toString().length
        var number = tamanho - 1
        var count = 0
        while (count < tamanho) {
            val bin = value.toString()[count].digitToInt()
            val valor = bin.shl(3) + number
            SerialEmitter.send(SerialEmitter.Destination.SCORE, valor,7)
            number-=1
            count+=1
        }
        SerialEmitter.send(SerialEmitter.Destination.SCORE,0b0000110,7)
    }
    // Envia comando para desativar/ativar a visualização do mostrador de pontuação
    fun off(value: Boolean) {
        if (value) {
            SerialEmitter.send(addr = SerialEmitter.Destination.SCORE, 0b0001111 , 7)
            //tem haver com a tabela do projeto Tabela1 - Modulo Score Display
        } else {
            SerialEmitter.send(addr = SerialEmitter.Destination.SCORE, 0b0000111 , 7)
        }
    }
    fun restartScore(){
        var number = 5
        val bin = 0
        repeat(6){
            val valor = bin.shl(3) + number
            SerialEmitter.send(SerialEmitter.Destination.SCORE, valor,7)
            number-=1
        }
        SerialEmitter.send(SerialEmitter.Destination.SCORE,0b0000110,7)
    }
}