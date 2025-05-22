package com.github.iselgt.roulette.enums

import java.io.File

/**
 * Write content to a file, where each line is a string from the list.
 */
fun writeToFile(filepath: String, data: List<String>) {

    // Ensure the file exists before reading
    ensureFileExists(filepath)
    val file = File(filepath)

    // Create the file if it doesn't exist
    if (!file.exists()) {
        file.createNewFile()
    }

    file.bufferedWriter().use { out ->
        for (line in data) {
            out.write(line)
            out.newLine()
        }
    }
}

/**
 * Read content from a file and return it as a list of strings, where each line is an element in the list.
 */
fun readFromFile(filepath: String): List<String> {

    // Ensure the file exists before reading, if it doesn't, return an empty list
    if (ensureFileExists(filepath)) {
        return emptyList()
    }

    val file = File(filepath)
    val lines = ArrayList<String>()

    file.bufferedReader().use { reader ->
        reader.forEachLine { line ->
            lines.add(line)
        }
    }

    return lines
}


/**
 * Ensure that a file and its directories exist. If they don't, create them
 * @return Whether the file was created or not
 */
fun ensureFileExists(filepath: String): Boolean {

    val file = File(filepath)

    if (!file.exists()) {
        file.parentFile.mkdirs() // Create parent directories
        file.createNewFile() // Create the file
        return true
    }

    return false
}