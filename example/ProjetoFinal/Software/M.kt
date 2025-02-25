object M {

    private const val MANUT_MASK = 0x80

    fun isM():Boolean{
        return HAL.isBit(MANUT_MASK)
    }
}