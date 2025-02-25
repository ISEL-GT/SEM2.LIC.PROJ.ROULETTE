import isel.leic.utils.Time

object TUI {

    var collumL0 = 16
    var collumL1 = 16

    fun escrever(str: String, left: Boolean, lines: Int, coll: Int) {
        if (left) {
            LCD.cursor(lines, coll)
            LCD.write(str)
            if (lines == 0) {
                collumL0 += 1
            } else {
                collumL1 += 1
            }
        } else {
            LCD.cursor(lines, coll)
            LCD.write(str)
            if (lines == 0) {
                collumL0 -= 1
            } else {
                collumL1 -= 1
            }
        }
    }

    fun align(line : Int, col : Int, c : Char){
        align(line,col,c.toString())
    }
    fun align(line : Int, col : Int, txt : String){
        LCD.cursor(line,col)
        LCD.write(txt)
    }

    fun alignLeft(line : Int, c : Char) {
        alignLeft(line,c.toString())
    }

    fun alignLeft(line : Int, txt : String) {
        if(txt.length <= 15) {
            LCD.cursor(line, 0)
            LCD.write(txt)
        }
    }    fun alignRigth(line : Int, str : String) {
        if(str.length < LCD.COLS){
            LCD.cursor(line, LCD.COLS - str.length)
            LCD.write(str)
        }
    }


    fun alignMiddle(line : Int, c : Char) {
        alignMiddle(line,c.toString())
    }

    fun alignMiddle(line : Int, txt : String) {

        val halfTxt = LCD.COLS - txt.length
        if (halfTxt >= 0) {
            LCD.cursor(line, halfTxt / 2)
            LCD.write(txt)
        }
    }

    fun forWaitKey(timeout: Long) : Char{
        return KBD.waitKey(timeout)
    }

    fun clrLCD(){
        LCD.clear()
    }

    fun cursor(line:Int,col:Int){
        LCD.cursor(line,col)
    }

    fun init(){
        KBD.init()
        LCD.init()
    }
}