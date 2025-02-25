import java.io.File
import java.io.FileReader
import java.io.PrintWriter

object FileAccess {

    fun addPl(lista: MutableList<Scores.Player>){
        val file = FileReader("SIG_scores.txt")
        var linhas = file.readLines()
        var listaFicheiro = emptyList<Scores.Player>()

        for (i in 0 until linhas.size) {
            val split = linhas[i].split(";")
            val player = Scores.Player(split[0].toInt(), split[1])
            lista.add(player)
        }
        if(lista.size > 20) {
            val dif = lista.size - 20
            listaFicheiro = lista.dropLast(dif)
        }
        listaFicheiro = listaFicheiro.sortedByDescending { it.score }
        val pw = PrintWriter("SIG_scores.txt")
        for(line in listaFicheiro){
            pw.println("${line.score};${line.name}")
        }
        pw.close()
    }

    fun filechange(): List<Scores.Player> {
        val linhas = File("SIG_scores.txt").readLines()
        var listareturn = emptyList<Scores.Player>()
        for (i in 0 until linhas.size) {
            val listadelinha = linhas[i].split(";")
            val player = Scores.Player(listadelinha[0].toInt(), listadelinha[1])
            listareturn = listareturn + player
        }
        return listareturn
    }

    fun Mfile(coins: Int, games: Int) {
        val file = FileReader("mFile.txt")
        val pw = PrintWriter("mFile.txt")
        pw.println(games)
        pw.println(coins)
        pw.close()
    }

    fun lerFile(): List<String> {
        return File("mFile.txt").readLines()
    }
}