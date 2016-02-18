-------------------------
-- Author: Saurav Shandilya
-- Description: D Flip Flop testbench
-------------------------

-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity Declarations

ENTITY D_FlipFlop_tb is
END D_FlipFlop_tb;

ARCHITECTURE arch of D_FlipFlop_tb is

    component D_FlipFlop is -- import D flip flop
      PORT ( in_D,clk,reset:IN BIT; out_D:OUT BIT);
   end component;

signal in_D,clk,reset,out_D : BIT;

constant clk_period : time := 10 ns;

begin
mapping: D_FlipFlop port map (in_D,clk,reset,out_D);

-- Test bench use 2 concurrent processes
-- concurrent process-1 (this process will toggle clock)
process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1'; 
     wait for 10 ns;	
end process;

-- concurrent process-2 (this process will change value of input)
process
begin

     in_D<='1';
     wait for 20 ns; -- hold reset state for 20 ns.
     in_D<='0';
     wait for 20 ns; -- hold reset state for 20 ns
end process;
end arch;

configuration cfg_tb of D_FlipFlop_tb is
   for arch
   end for;
end cfg_tb;

