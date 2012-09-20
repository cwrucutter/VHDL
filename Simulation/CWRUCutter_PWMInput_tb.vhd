------------------------------------------------------------
-- CWRUCutter_PWMInput_tb.vhd
-- EJ Kreinar
-- 
-- Test bench for the CWRUCutter_PWMInput module
-- 
-- History
-- 9/19: ejk43- Created
------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CWRUCutter_PWMInput_tb is
end CWRUCutter_PWMInput_tb;

architecture rtl of CWRUCutter_PWMInput_tb is
    component CWRUCutter_PWMInput
    port (
        CLK             : in  std_logic;
        aRESET          : in  std_logic;
		PWM_IN          : in  std_logic;
        POS_PULSE_LEN   : out std_logic_vector(31 downto 0);
		CYC_PULSE_LEN   : out std_logic_vector(31 downto 0)
    );
    end component;
    
    signal tb_clk     : std_logic;
    signal tb_reset   : std_logic;
    signal tb_pwm     : std_logic;
    signal tb_pos_out : std_logic_vector(31 downto 0);
    signal tb_cyc_out : std_logic_vector(31 downto 0);
    
begin

    PWMIn1: CWRUCutter_PWMInput port map
    (
        CLK             => tb_clk,
        aRESET          => tb_reset,
		PWM_IN          => tb_pwm,
        POS_PULSE_LEN   => tb_pos_out,
		CYC_PULSE_LEN   => tb_cyc_out
    );
    
    clk_proc: process begin
        -- Clock frequency 40 MHz
        tb_clk <= '0';
        wait for 10 ns;
        tb_clk <= '1';
        wait for 10 ns;
    end process;
    
    pwm_proc: process begin
        -- PWM: 10% duty cycle with 10 ms period
        tb_pwm <= '1';
        wait for 40 ns;
        tb_pwm <= '0';
        wait for 20 ns;
        tb_pwm <= '1';
        wait for 50 ns;
        tb_pwm <= '0';
        wait for 100 ns;
        tb_pwm <= '1';
        
        wait for 2 ms;
        tb_pwm <= '0';
        wait for 8 ms;
        
        -- -- PWM: 100% duty cycle with 10 ms period
        -- tb_pwm <= '1';
        -- wait for 2 ms;
        -- tb_pwm <= '1';
        -- wait for 8 ms;
    end process;

    main_test: process begin
        tb_reset <= '1';
        wait for 100 ns;
        tb_reset <= '0';
        
        wait; --Wait Forever
    end process;
end rtl;