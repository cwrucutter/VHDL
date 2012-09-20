------------------------------------------------------------
-- CWRUCutter_QuadEncCounter_tb.vhd
-- EJ Kreinar
-- 
-- Test bench for the CWRUCutter_QuadEncCounter module
-- 
-- History
-- 9/19: ejk43- Created
------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CWRUCutter_QuadEncCounter_tb is
end CWRUCutter_QuadEncCounter_tb;

architecture rtl of CWRUCutter_QuadEncCounter_tb is
    component CWRUCutter_QuadEncCounter
    port (
        CLK           : in  std_logic;
        aRESET        : in  std_logic;
        ENC_A         : in  std_logic;
        ENC_B         : in  std_logic;
        DIRECTION     : in  std_logic;
        ENC_RESET     : in  std_logic;
        ENC_COUNT     : out std_logic_vector(31 downto 0) := (others => '0')
    );
    end component;
    
    signal tb_clk     : std_logic;
    signal tb_reset   : std_logic;
    signal tb_enc_a   : std_logic;
    signal tb_enc_b   : std_logic;
    signal tb_direction : std_logic;
    signal tb_enc_reset : std_logic;
    signal tb_enc_count : std_logic_vector(31 downto 0);
    
begin

    EncCount1: CWRUCutter_QuadEncCounter port map
    (
        CLK         => tb_clk,
        aRESET      => tb_reset,
        ENC_A       => tb_enc_b,
        ENC_B       => tb_enc_a,
        DIRECTION   => tb_direction,
        ENC_RESET   => tb_enc_reset,
        ENC_COUNT   => tb_enc_count
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
        tb_enc_a <= '0';
        tb_enc_b <= '0';
        
        tb_direction <= '1';
        tb_enc_reset <= '1';
        wait for 60 ns;
        tb_enc_reset <= '0';
        wait for 60 ns;
        
        -- Loop with encoder A leading encoder B
        for i in 0 to 9 loop
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
        end loop;
        
        -- Loop with encoder B leading encoder A
        for i in 0 to 9 loop
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
        end loop;
        
        -- Loop with encoder B leading encoder A
        for i in 0 to 9 loop
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
        end loop;
        
        tb_direction <= '0';
        wait for 20 ns;
        
        -- Loop with encoder A leading encoder B
        for i in 0 to 9 loop
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
        end loop;
        
        -- Loop with encoder B leading encoder A
        for i in 0 to 9 loop
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
        end loop;
        
        -- Loop with encoder A leading encoder B
        for i in 0 to 9 loop
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
        end loop;
        
        tb_enc_reset <= '1';
        wait for 60 ns;
        tb_enc_reset <= '0';
        wait for 60 ns;        
        
        -- Loop with encoder B leading encoder A
        for i in 0 to 9 loop
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
        end loop;
        
        -- Loop with encoder A leading encoder B
        for i in 0 to 9 loop
            tb_enc_a <= not tb_enc_a;
            wait for 60 ns;
            tb_enc_b <= not tb_enc_b;
            wait for 60 ns;
        end loop;
    end process;
end rtl;