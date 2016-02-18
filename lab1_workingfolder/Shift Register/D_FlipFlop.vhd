-------------------------
-- Author: Saurav Shandilya
-- Description: D Flip Flop implementation. State Changes on Rising edge of clock - Positive Edge trigerred
-------------------------

-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity Declarations

ENTITY D_FlipFlop is
   PORT ( in_D,clk,reset:IN BIT; out_D:OUT BIT);
END D_FlipFlop;

ARCHITECTURE arch of D_FlipFlop is

BEGIN

   PROCESS(clk,reset)
   BEGIN
	IF (reset='1') THEN 
	   out_D <= '0';
	ELSIF (clk='1' AND clk'EVENT) THEN   
	   out_D <= in_D;                
	ELSE NULL;
	END IF;
	END PROCESS;

END arch;
