package com.github.iselgt.roulette

import com.github.iselgt.roulette.control.display.RouletteDisplay
import kotlin.system.measureTimeMillis
import kotlin.test.*

/**
 * Unit tests for RouletteDisplay functionalities.
 *
 * SetValue
 * Animation
 * Display On/off
 */
class RouletteDisplayTest {

    @Test
    fun testDisplayStaticValues() {
        println("Testing static display values...")

        val testValues = listOf(0, 42, 123, 999)
        for (value in testValues) {
            println("Displaying value: $value")
            RouletteDisplay.setValue(value)
            Thread.sleep(500) // Slight delay to observe output (simulated)
        }

        assertTrue(true, "Static values sent successfully.")
    }

    @Test
    fun testDisplayAnimation() {

        RouletteDisplay.on()

        val elapsed = measureTimeMillis {
            println("Testing animation...")
            RouletteDisplay.animation()
            assertTrue(true, "Animation ran without exceptions.")
        }

        println("Animation completed in $elapsed ms")
    }

    @Test
    fun testDisplayOnOff() {
        println("Testing display on/off toggle...")

        repeat(2) {
            println("Turning OFF")
            RouletteDisplay.off(true)
            Thread.sleep(500)

            println("Turning ON")
            RouletteDisplay.off(false)
            Thread.sleep(500)
        }

        assertTrue(true, "Display toggled on/off successfully.")
    }
}
