import isel.leic.utils.Time
// Ler teclas. Métodos retornam ‘0’..’9’,’#’,’*’ ou NONE.
object KBD {
    const val KEY = 0X0F
    const val NONE = ' '
    const val KACK_MASK = 0X80
    const val KVAL_MASK = 0X10
    val keys: CharArray = charArrayOf('1', '4', '7', '*', '2', '5', '8', '0', '3', '6', '9', '#')

    fun init() {//Inicia a classe
        HAL.init()
    }
    //Retorna de imediato a tecla premida ou NONE se não há tecla premida.
    fun getKey(): Char {
        if (HAL.isBit(KVAL_MASK)) {
            val tecla = HAL.readBits(KEY)
            HAL.setBits(KACK_MASK)
            if(!HAL.isBit(KVAL_MASK)) {
                HAL.clrBits(KACK_MASK)
                return keys[tecla]
            }
        }
        return NONE
    }
    //Retorna a tecla premida, caso ocorra antes do ‘timeout’ (representado em milissegundos), ou NONE caso contrário.
    fun waitKey(timeout: Long): Char {
        val timeFinal = timeout + Time.getTimeInMillis() //tempo atual em milisegundos + timeout
        var key = NONE
        do {
            key = getKey()
        } while (Time.getTimeInMillis() < timeFinal && key == NONE)
        return key
    }
}