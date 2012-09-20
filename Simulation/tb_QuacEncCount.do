onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_clk
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_reset
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_enc_a
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_direction
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_enc_b
add wave -noupdate /cwrucutter_quadenccounter_tb/tb_enc_reset
add wave -noupdate -radix decimal /cwrucutter_quadenccounter_tb/tb_enc_count
add wave -noupdate -radix decimal /cwrucutter_quadenccounter_tb/EncCount1/ENC_COUNT
add wave -noupdate /cwrucutter_quadenccounter_tb/EncCount1/enc_a_old
add wave -noupdate /cwrucutter_quadenccounter_tb/EncCount1/enc_b_old
add wave -noupdate -radix decimal /cwrucutter_quadenccounter_tb/EncCount1/count_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {111 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 309
configure wave -valuecolwidth 61
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
configure wave -timelineunits ns
update
WaveRestoreZoom {49 ns} {265 ns}
