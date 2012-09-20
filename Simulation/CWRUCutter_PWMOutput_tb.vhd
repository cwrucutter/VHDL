------------------------------------------------------------
-- CWRUCutter_PWMOutput_tb.vhd
-- EJ Kreinar
-- 
-- Test bench for the CWRUCutter_PWMOutput module
-- 
-- History
-- 9/19: ejk43- Created
------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CWRUCutter_PWMOutput_tb is
end CWRUCutter_PWMOutput_tb;

architecture rtl of CWRUCutter_PWMOutput_tb is
    component CWRUCutter_PWMOutput
    port (
        CLK           : in  std_logic;
        aRESET        : in  std_logic;
        POS_PULSE_LEN : in std_logic_vector(31 downto 0) := (others => '0');
        CYC_PULSE_LEN : in std_logic_vector(31 downto 0) := (others => '0');
        PWM_OUT       : out  std_logic
    );
    end component;
    
    signal tb_clk     : std_logic;
    signal tb_reset   : std_logic;
    signal tb_pwm     : std_logic;
    signal tb_pos_in  : std_logic_vector(31 downto 0);
    signal tb_cyc_in  : std_logic_vector(31 downto 0);
    
begin

    PWMOut1: CWRUCutter_PWMOutput port map
    (
        CLK             => tb_clk,
        aRESET          => tb_reset,
        POS_PULSE_LEN   => tb_pos_in,
		CYC_PULSE_LEN   => tb_cyc_in,
		PWM_OUT          => tb_pwm
    );
    
    clk_proc: process begin
        -- Clock frequency 40 MHz
        tb_clk <= '0';
        wait for 10 ns;
        tb_clk <= '1';
        wait for 10 ns;
    end process;

    main_test: process begin
        tb_reset <= '1';
        wait for 100 ns;
        tb_reset <= '0';
        
        tb_pos_in <= std_logic_vector(to_unsigned(40,32));
        tb_cyc_in <= std_logic_vector(to_unsigned(100,32));
        
        wait for 2 us;
        
        tb_pos_in <= std_logic_vector(to_unsigned(10,32));
        tb_cyc_in <= std_logic_vector(to_unsigned(100,32));
        
        wait for 2 us;
        
        tb_pos_in <= std_logic_vector(to_unsigned(20,32));
        tb_cyc_in <= std_logic_vector(to_unsigned(50,32));
        
        wait for 2 us;
        
        tb_pos_in <= std_logic_vector(to_unsigned(40,32));
        tb_cyc_in <= std_logic_vector(to_unsigned(50,32));
        wait; --Wait Forever
    end process;
end rtl;