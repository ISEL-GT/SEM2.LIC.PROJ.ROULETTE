onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /serial_controller_tb/not_enRx_tb
add wave -noupdate /serial_controller_tb/accept_tb
add wave -noupdate /serial_controller_tb/pFlag_tb
add wave -noupdate /serial_controller_tb/dFlag_tb
add wave -noupdate /serial_controller_tb/RXerror_tb
add wave -noupdate /serial_controller_tb/CLK_tb
add wave -noupdate /serial_controller_tb/Reset_tb
add wave -noupdate /serial_controller_tb/wr_tb
add wave -noupdate /serial_controller_tb/init_tb
add wave -noupdate /serial_controller_tb/DXval_tb
add wave -noupdate /serial_controller_tb/clk_period
add wave -noupdate /serial_controller_tb/half_clk_period
add wave -noupdate /serial_controller_tb/UUT/state_number
add wave -noupdate -radix unsigned /serial_controller_tb/UUT/state_number
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {163842 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {118780 ps} {293903 ps}
