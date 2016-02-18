-------------------------
-- Author: Saurav Shandilya
-- Description: BM implementation - This file is the Test Bench.
-- This implementation is
-------------------------

-- ****** Test Bench for Booth Multiplier *******

-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- entity desription
entity boothmul_TB is
end boothmul_TB;

-- Architecture Description

architecture arch of boothmul_TB is

-- component declaration
component boothmul is
port 
(
  sysclk: In bit;       -- clock
  reset: In bit;
  done: out bit;
  data_in1: in  bit_vector(7 downto 0);  -- 8 bit input - for Multiplier
  data_in2: in  bit_vector(7 downto 0);  -- 8 bit input - for Multiplicand 
  data_out: out bit_vector(15 downto 0)  --  16 bit output
);
end component;

-- signals 
signal sysclk,reset,done : bit;
signal data_in1,data_in2 : bit_vector(7 downto 0):=(OTHERS=>'0');
signal data_out : bit_vector(15 downto 0);
signal clocktime :time := 100 ns;

-- begin 

begin 

    boothmul1 : boothmul 
                    port map 
                    (sysclk,
                    reset,
                    done,
                    data_in1,
                    data_in2,
                    data_out);
                    
---- Process-1 for clock                    
    clock: process        
    begin
        sysclk <= '0'; 
        wait for clocktime/2;
        sysclk <= '1'; 
        wait for clocktime/2;    
    end process;
    
--- Process-2 for testing various input cases    
    inputtestcase : process 
    begin
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        data_in1 <= "00000111";  --- 13
        data_in2 <= "11111001";  --- 5        
        wait for 4500 ns;
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        data_in1 <= "11110011";  --- -13
        data_in2 <= "00000101";  --- 5        
        wait for 4500 ns;
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        data_in1 <= "11110011";  --- -13
        data_in2 <= "11111011";  --- -5        
        wait for 4500 ns;
        
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        data_in1 <= "00001101";  --- 13
        data_in2 <= "11111011";  --- -5        
        wait for 4500 ns;
        

         
    
    
    end process;

end arch;    
    