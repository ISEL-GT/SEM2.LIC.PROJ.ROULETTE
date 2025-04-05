package com.github.iselgt.roulette

import com.github.iselgt.roulette.KBD.waitKey
import kotlin.test.Test

class KBDTest {

    @Test
    fun kbdTest() {
        KBD.init()

        while (true) {
            val keyPressed = waitKey(1000)
            if (keyPressed == KBD.EMPTY_CHAR) continue

            print(keyPressed)
        }

    }
}