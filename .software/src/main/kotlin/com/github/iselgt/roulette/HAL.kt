package com.github.iselgt.roulette
import isel.leic.UsbPort
import jdk.vm.ci.code.CodeUtil.mask

object HAL {

    /**
     * A representation of the usb port output values, updated whenever there is a writing action
     * into the output. Used to track the output values since we can't read them.
     */
    private var trackedOutput = 0x00;

    fun init() = UsbPort.write(0x00)  // Initialises the HAL, setting the output values to 0

    /**
     * Checks if the input value has a '1' on the bit specified by the mask
     * @param mask The mask specifying the bit to be checked.
     *
     * @return Whether the bit matches or not. Returns false on ambiguous masks
     */
    fun isBit(mask: Int): Boolean {
        return UsbPort.read().and(mask) != 0 && mask.countOneBits() ==1
    }

    /**
     * Reads the bits from the input taking the mask into account
     * @param mask An optional mask to be applied to the return value
     *
     * @return The bits present in the input
     */
    fun readBits(mask: Int = 0x00): Int {
        return UsbPort.read().and(mask)
    }

    /**
     * A shortcut for clear and set bits, writing the value into 
     */
    fun writeBits(value: Int, mask: Int = value){
        clrBits(mask)
        setBits(value.and(mask))
    }

    /**
     * Clears the output bits specified by the mask (sets them to 0)
     * @param mask An optional mask to be applied. Defaults to clear everything
     */
    fun clrBits(mask: Int = 0xFF) {
        trackedOutput = trackedOutput.and(mask.inv())
        UsbPort.write(trackedOutput)
    }


    /**
     * Sets the bits specified by the mask to 1.
     * @param mask The mask specifying the bits to be set
     */
    fun setBits(mask: Int) {
        trackedOutput = mask.or(trackedOutput)
        UsbPort.write(trackedOutput)
    }
}