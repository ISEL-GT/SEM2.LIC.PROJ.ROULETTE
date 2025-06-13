package com.github.iselgt.roulette.control.display

import com.github.iselgt.roulette.control.display.DisplaySequenceFactory
import jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.index

object DisplaySequenceFactory {

    /**
     * The current index of the segment in the animation sequence.
     * Used to track which segment is currently being displayed
     */
    var currentSegmentIndex: Int = 0

    /**
     * Predefined segment codes used for LED animation.
     * These codes correspond to specific LED segments in a circular pattern
     * across the 7-segment display.
     *
     * The values are packed based on the display controller specification.
     */
    val SEGMENTCIRCLE = intArrayOf(
        0x19, 0x12, 0x1A, 0x13, 0x1B, 0x14, 0x1C, 0x15,
        0x1D, 0x16, 0x1E, 0x11
    )

    /**
     * Generates the next segment code in the animation sequence.
     * This function uses the current index to determine the next segment code
     * @return the next segment code in the sequence
     */
    fun next(): Int {
        val segment = SEGMENTCIRCLE[currentSegmentIndex % SEGMENTCIRCLE.size]
        currentSegmentIndex++
        return segment
    }
}