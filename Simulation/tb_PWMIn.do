onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cwrucutter_pwminput_tb/tb_clk
add wave -noupdate /cwrucutter_pwminput_tb/tb_reset
add wave -noupdate /cwrucutter_pwminput_tb/tb_pwm
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/tb_pos_out
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/tb_cyc_out
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/PWMIn1/POS_PULSE_LEN
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/PWMIn1/CYC_PULSE_LEN
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/PWMIn1/debounce_count
add wave -noupdate /cwrucutter_pwminput_tb/PWMIn1/debounce_allow
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/PWMIn1/pos_len
add wave -noupdate -radix decimal /cwrucutter_pwminput_tb/PWMIn1/cyc_len
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {335862 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 323
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
configure wave -timelineunits ns
update
WaveRestoreZoom {9999761 ns} {10000888 ns}
