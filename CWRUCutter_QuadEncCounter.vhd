------------------------------------------------------------
-- CWRUCutter_QuadEncCounter.vhd
-- EJ Kreinar
-- 
-- Given a quatrature encoder A/B channels, counts the encoder ticks in 4 phases
-- 
-- Inputs:
--   ENC_A: Encoder A channel
--   ENC_B: Encoder B channel
--   DIRECTION: True-  increments when B leads A, decrements when B leads A
--              False- increments when B leads A, decrements when A leads B
--   ENC_RESET: Reset the count
-- 
-- Outputs:
--   ENC_COUNT: Current encoder count
--
-- Notes: 
--
-- History
-- 9/19: ejk43- Created
------------------------------------------------------------

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CWRUCutter_QuadEncCounter is
    port (
        CLK           : in  std_logic;
        aRESET        : in  std_logic;
        ENC_A         : in  std_logic;
        ENC_B         : in  std_logic;
        DIRECTION     : in  std_logic;
        ENC_RESET     : in  std_logic;
        ENC_COUNT     : out std_logic_vector(31 downto 0) := (others => '0')
      );
end CWRUCutter_QuadEncCounter;

architecture rtl of CWRUCutter_QuadEncCounter is
    signal enc_a_old: std_logic;
    signal enc_b_old: std_logic;
    signal count_int: signed(31 downto 0);
begin
    ENC_COUNT <= std_logic_vector(count_int);
    
    process(aRESET, CLK) 
    begin
      if(aRESET = '1') then
        enc_a_old     <= '0';
        enc_b_old     <= '0';
        count_int     <= (others => '0');
      elsif rising_edge(clk) then
        enc_a_old <= ENC_A;
        enc_b_old <= ENC_B;
      
        if ENC_RESET = '1' then
            count_int <= (others => '0');
        else
            if ((ENC_A XOR enc_a_old) OR (ENC_B XOR enc_b_old)) = '1' then
                if NOT (ENC_A XOR enc_b_old XOR DIRECTION) = '1' then
                    count_int <= count_int + 1;
                elsif NOT (ENC_A XOR enc_b_old XOR DIRECTION) = '0' then
                    count_int <= count_int - 1;
                end if;
            else 
                count_int <= count_int;
            end if;
        end if;
        
      end if;
    end process;
end rtl;