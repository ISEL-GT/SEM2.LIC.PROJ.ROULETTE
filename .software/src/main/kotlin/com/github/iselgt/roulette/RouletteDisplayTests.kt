package com.github.iselgt.roulette

/**
 * Test class for RouletteDisplay functionality.
 * Run this in a simulated environment with hardware.simul.
 */
object RouletteDisplayTests {

    fun runAllTests() {
        println("Starting RouletteDisplay tests...")

        // Initialize
        RouletteDisplay.init()

        // Run tests
        testStaticValues()
        testAnimation()
        testDisplayOnOff()

        println("All tests completed.")
    }

    private fun testStaticValues() {
        println("\n=== Testing static values ===")
        val testValues = listOf(0, 5, 42, 123, 999)

        testValues.forEach { value ->
            println("Displaying value: $value")
            RouletteDisplay.setValue(value)
            Thread.sleep(1500) // Wait 1.5 seconds between values
        }
    }

    private fun testAnimation() {
        println("\n=== Testing animation ===")
        println("Running random animation for 3 cycles...")
        repeat(200) {
            RouletteDisplay.animation() // Each animation lasts ~2 seconds
            Thread.sleep(500) // Short pause between animations
        }
    }

    private fun testDisplayOnOff() {
        println("\n=== Testing display on/off ===")
        repeat(3) {
            println("Turning display OFF")
            RouletteDisplay.off(true)
            Thread.sleep(1000)

            println("Turning display ON")
            RouletteDisplay.off(false)
            Thread.sleep(1000)
        }
    }
}

// To run the tests from your main application:
fun main() {
    RouletteDisplayTests.runAllTests()
}