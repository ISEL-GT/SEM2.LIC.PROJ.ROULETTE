import KBD.NONE
import TUI.collumL0
import TUI.collumL1
import isel.leic.utils.Time
import kotlin.random.Random

var lista0 = ""
var lista1 = ""
var score = 0
var gameOver = false
var tecla = ' '
const val INVADER = 0
const val SPACESHIP = 1

fun main() {
    init()
    menuDesign()
    do {
        println("TECLA : $tecla")
        println("GAMEOVER : $gameOver")
        if (M.isM()) {
            manutDisplay()
            menuDesign()
        } else if (tecla == '*' && !gameOver && !M.isM() && Statistics.getCredits() > 0) {
            inGame()
            Statistics.newGame()
        } else if (!gameOver) {
            menuDesign()
        }
    } while (true)
}

fun menuDesign() {
    var i = 0
    showCoins()
    var bool = false
    while (true) {
        println(Statistics.getCredits())
        println(tecla)
        tecla = TUI.forWaitKey(1000)
//        if (bool == true && !CoinAcceptor.isCoin()){
//            CoinAcceptor.newCoin()
//            Statistics.incCoins()
//            showCoins()
//            bool = false
//        }
        if (CoinAcceptor.isCoin()) {
            //bool = true
            CoinAcceptor.newCoin()
            Statistics.incCoins()
            showCoins()
        } else if (tecla == '*' && Statistics.getCredits() > 0 || M.isM()) {
            break
        } else if (tecla == ' ' && !M.isM()) {
            if (Statistics.getCredits() != 0) {
                TUI.align(1, 0, "                  ")
                showCoins()
            }
            TUI.align(1, 0, "                  ")
            val linhas = Scores.getPlayers()
            if (i < 9){
                TUI.align(1, 0, "0${i+1}-${linhas[i].name}")
                TUI.alignRigth(1, "${linhas[i].score}")
            }
            else{
                TUI.align(1, 0, "${i+1}-${linhas[i].name}")
                TUI.alignRigth(1, "${linhas[i].score}")
            }
            if (!CoinAcceptor.isCoin()) {
                Time.sleep(1250)
            }
            if (i == linhas.size - 1) {
                i = -1
            }
            i++
        }
    }
}

fun insertNewName() {
    var alf = 'A'
    var nome = StringBuilder("A                 ")
    var coluna = 5
    TUI.align(0, 0, "                ")
    TUI.align(0, 0, "Name:")
    TUI.align(0, coluna, "$alf")
    while (true) {
        TUI.cursor(0, coluna)
        val tecla = TUI.forWaitKey(1000)
        if (tecla == '2') {
            alf += 1
            if (alf == '[') alf = 'A'
            nome[coluna - 5] = alf
            TUI.align(0, coluna, "$alf")
        } else if (tecla == '8') {
            alf -= 1
            if (alf == '@') alf = 'Z'
            nome[coluna - 5] = alf
            TUI.align(0, coluna, "$alf")
        } else if (tecla == '4') {
            if (coluna - 5 >= 1) {
                coluna -= 1
                alf = nome[coluna - 5]
                TUI.align(0, coluna, "$alf")
            }
        } else if (tecla == '6') {
            if (coluna - 5 <= 9) {
                coluna += 1
                if (nome[coluna - 5] == ' ') {
                    nome[coluna - 5] = 'A'
                }
                alf = nome[coluna - 5]
                TUI.align(0, coluna, "$alf")
            }
        } else if (tecla == '5') {
            println("gameOver $gameOver")
            break
        } else if (tecla == '*' && coluna - 5 == nome.trimEnd().length - 1 && coluna >= 6) {
            nome.deleteCharAt(coluna - 5)
            TUI.align(0, coluna, " ")
            coluna--
        }
    }
    val nomeSemEspacos = nome.toString().trim()
    val nomeFinal = if (nomeSemEspacos.length > 1) {
        nomeSemEspacos[0] + nomeSemEspacos.substring(1).lowercase()
    } else {
        nomeSemEspacos
    }
    Scores.addPlayer(nomeFinal, score)
}

fun manutDisplay(): Char {
    var key = ' '
    while (M.isM()) {
        TUI.clrLCD()
        TUI.alignMiddle(0, "On Maintenance")
        TUI.alignLeft(1, "*-Count #-shutD")
        key = TUI.forWaitKey(1000)
        if (key == '*') {
            TUI.clrLCD()
            TUI.alignLeft(0, "Games:${Statistics.getGames()}")
            TUI.alignLeft(1, "Coins:${Statistics.getCoins()}")
            key = TUI.forWaitKey(5000)
            if (key == '#') {
                TUI.clrLCD()
                TUI.alignMiddle(0, "Clear counters")
                TUI.alignLeft(1, "5-Yes  other-No")
                key = TUI.forWaitKey(5000)
                if (key == '5') {
                    Statistics.clearCount()
                }
            }
        } else if (key == '#') {
            TUI.clrLCD()
            TUI.alignMiddle(0, "Shutdown")
            TUI.alignLeft(1, "5-Yes  other-No")
            key = TUI.forWaitKey(5000)
            if (key == '5') {
                Scores.atualizarstats(Statistics.getCoins(), Statistics.getGames())
                Scores.printPlayer()
                System.exit(-1)
            }
        } else if (key != ' ') {
            inGame()
        }
    }
    return key
}

fun barras() {
    TUI.alignLeft(0, "]")
    TUI.alignLeft(1, "]")
}

fun gameDesign() {
    TUI.clrLCD()
    barras()
    TUI.align(0, 1, SPACESHIP.toChar())
}

fun generateNumbers() {
    val number = randomNumbers()
    val addToList = Random.nextBoolean()
    if (addToList) {
        lista0 += number
        TUI.escrever(lista0, false, 0, collumL0)
    } else {
        lista1 += number
        TUI.escrever(lista1, false, 1, collumL1)
    }
}

fun gameOver() {
    TUI.clrLCD()
    TUI.align(0, 0, "*** GAME OVER **")
    TUI.align(1, 0, "Score:$score")
    ScoreDisplay.off(false)
    ScoreDisplay.setScore(score)
    gameOver = false
    Time.sleep(2000)
    if (score > 0) {
        insertNewName()
    }
    ScoreDisplay.restartScore()
    tecla = ' '
}

fun changeLine(line: Boolean) {
    if (line) {
        TUI.align(0, 1, " ")
        TUI.align(1, 1, SPACESHIP.toChar())
        barras()
    } else {
        TUI.align(1, 1, " ")
        TUI.align(0, 1, SPACESHIP.toChar())
        barras()
    }
}

fun inGame() {
    lista0 = ""
    lista1 = ""
    collumL0 = 16
    collumL1 = 16
    score = 0
    var key = ' '
    var keyFire = NONE
    var timeout = 600L
    var line0 = true
    gameDesign()
    do {
        timeout += Time.getTimeInMillis()
        while (Time.getTimeInMillis() < timeout) {
            keyFire = TUI.forWaitKey(1000)
            if (keyFire != '#' && keyFire != NONE && keyFire != '*') {
                key = keyFire
                TUI.alignLeft(if (line0) 0 else 1, key)
            }
            if (keyFire == '*') {
                changeLine(line0)
                line0 = !line0
            }
            if (keyFire == '#') {
                TUI.alignLeft(if (line0) 0 else 1, ']')
                if (hitNumber(key, line0)) {
                    deleteNumber(line0)
                    updateScore(key)
                }
            }
        }
        generateNumbers()
        timeout = 600
    } while (lista0.length < 16 && lista1.length < 16)
    gameOver()
}

fun hitNumber(key: Char, line0: Boolean): Boolean {
    return if (line0)
        key == lista0[0]
    else key == lista1[0]
}


fun deleteNumber(line0: Boolean) {
    if (line0) {
        TUI.align(0, collumL0 + 1, " ")
        lista0 = lista0.drop(1)
        collumL0 += 1
        barras()
    } else {
        TUI.align(1, collumL1 + 1, " ")
        lista1 = lista1.drop(1)
        collumL1 += 1
        barras()
    }
}

fun updateScore(key: Char) {
    score += key.digitToInt() + 1
    ScoreDisplay.off(false)
    ScoreDisplay.setScore(score)
}

fun showCoins() {
    TUI.clrLCD()
    TUI.alignMiddle(0, " SPACE INVADERS")
    TUI.alignLeft(1, " GAME")
    TUI.align(1, 6, SPACESHIP.toChar())
    TUI.align(1, 9, INVADER.toChar())
    TUI.align(1, 11, INVADER.toChar())
    TUI.alignRigth(1, "$${Statistics.getCredits()}")
    println("tecla $tecla")
    Time.sleep(1250)
}

fun randomNumbers(): Int {
    return Random.nextInt(9)
}

fun init() {
    TUI.init()
    ScoreDisplay.init()
    Statistics.init()
    CoinAcceptor.init()
    Scores.init()
}