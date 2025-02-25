object Statistics {

    private var games = 0
    private var coins = 0
    private var credits = 0

    fun init() {
        credits = 0
        val stats = FileAccess.lerFile()
        games = stats[0].toInt()
        coins = stats[1].toInt()
    }

    fun incCoins(){
        coins++
        credits += 2
    }

    fun getGames():Int{
        return games
    }

    fun getCoins():Int{
        return coins
    }

    fun getCredits():Int{
        return credits
    }

    fun clearCount(){
        games = 0
        coins = 0
    }

    fun newGame(){
        games++
        credits--
    }
}