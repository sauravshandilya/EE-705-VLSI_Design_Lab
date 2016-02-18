-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Counter 4 bit. Used as Mod-9 counter
-------------------------

-- ****** Counter *******
LIBRARY IEEE;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_arith.all;

entity counter_8bit is
port
(
	clk : in bit;
  reset : in bit;
  enable : in bit;
	countout : out std_logic_vector(3 downto 0)
);
end counter_8bit;

architecture arch of counter_8bit is

signal count:std_logic_vector(3 downto 0) := (others=>'0');

begin

   PROCESS(clk,reset)  
	BEGIN
	IF (reset='1') THEN 
	   count <= "0000";--(others=>'0');
	ELSIF (clk='1' AND clk'EVENT) THEN
	   if (enable = '1') then
	   	   count <= std_logic_vector(unsigned(count)+1);                
    	end if;   
	ELSE NULL;
	END IF;
   END PROCESS;
	countout <= count;
end arch;






