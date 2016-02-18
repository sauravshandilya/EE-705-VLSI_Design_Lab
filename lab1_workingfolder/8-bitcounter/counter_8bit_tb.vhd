-------------------------
-- Author: Saurav Shandilya
-- Description: Counter 8-bit test bench
-------------------------

-- ****** Counter 8-bit register *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity counter8bit_tb is
end counter8bit_tb;

architecture arch of counter8bit_tb is

   component Counter_8bit is -- import 2x1 MUX
   port(
	clk : in std_logic;
        reset : in std_logic;
	countout : out std_logic_vector(2 downto 0)
);
   end component;
   	
signal clk,reset:std_logic;
signal countout:std_logic_VECTOR(2 downto 0);
    		
begin
    mapping: Counter_8bit port map (clk,reset,countout);

process
begin				
	clk <= '0';      -- initially low
	wait for 10 ns;
	
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;

	wait;

END PROCESS;
END arch;

configuration cfg_tb of counter8bit_tb is
   for arch
   end for;
end cfg_tb;


