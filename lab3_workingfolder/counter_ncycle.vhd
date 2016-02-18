-------------------------
-- Author: Saurav Shandilya
-- Description: counter implementation - n cycle
-------------------------
-- ****** Counter *******
LIBRARY IEEE;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_arith.all;

entity Counter_ncycle is
      generic (cyclecount : integer ; maxcount : unsigned(4 downto 0) );
      port(
      	
	clk : in std_logic;
	enable: in std_logic;
        reset : in std_logic;
	countout : out std_logic_vector((cyclecount-1) downto 0)
);
end Counter_ncycle;

architecture behav of Counter_ncycle is

--signal count:std_logic_vector(2 downto 0);
signal count:std_logic_vector((cyclecount-1) downto 0):=(others=>'0');
signal sig_maxcount : std_logic_vector((cyclecount-1) downto 0);

begin
   process(clk,reset)
	
	begin
	sig_maxcount <= std_logic_vector(unsigned (maxcount));
	if (reset='1') THEN 
	   count <= (others=>'0');
	elsif (clk='1' AND clk'EVENT) THEN   
		if count = sig_maxcount then
			count <= (others => '0');
		elsif enable = '1' then
			count <= std_logic_vector(unsigned(count)+1); 
		end if;	               
	else null;
	end if;
   end process;
	countout <= count;
end behav;

