object Scores {
    data class Player( val score: Int, val name: String)
    val lista = mutableListOf<Player>()

    fun init(){
        val scores = FileAccess.filechange()
        lista.addAll(scores)
        lista.sortByDescending {it.score}
    }

    fun getPlayers(): MutableList<Player> {
        return lista
    }
    fun atualizarstats(coins: Int, games: Int) {
        FileAccess.Mfile(coins, games)
    }
    fun addPlayer(nome: String , score:Int) {
        lista.add(Player(score,nome))
        lista.sortByDescending { it.score }
        if (lista.size > 20) {
            lista.removeAt(lista.size - 1)
        }
    }
    fun printPlayer(){
        FileAccess.addPl(lista)
    }
}