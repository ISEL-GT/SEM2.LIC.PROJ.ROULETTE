transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/SRC/roulette_serial/counter/registry_4bits_counter.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/SRC/roulette_serial/counter/half_adder.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/SRC/roulette_serial/counter/full_adder.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/SRC/roulette_serial/counter/FFD.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/SRC/roulette_serial/counter/adder_4bits.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/KEYBOARD_READER/RING_BUFFER/mac.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/KEYBOARD_READER/RING_BUFFER/RAM.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/KEYBOARD_READER/RING_BUFFER/Ring_Buffer_Control.vhd}
vcom -93 -work work {C:/Isel/2Semestre/LIC/SEM2.LIC.PROJ.ROULETTE/.hardware/KEYBOARD_READER/RING_BUFFER/RingBuffer.vhd}

