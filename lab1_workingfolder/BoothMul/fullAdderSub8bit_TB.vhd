library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity fulladdsubTB is 
end entity;

architecture FULL_TB_archi of fulladdsubTB is
signal A,B: std_logic_vector (7 downto 0);
signal sum: std_logic_vector (7 downto 0);
signal cin: std_logic;
signal co: std_logic;
signal cnt: integer range 0 to 250;

component fulladdsub
	PORT (
		A,B:IN std_logic_vector(7 DOWNTO 0); 
		addsub:IN std_logic; 
		sum:OUT std_logic_vector(7 DOWNTO 0);
		Cout:OUT std_logic
			);
	end component;
	
begin

dut: fulladdsub port map (A=>A, B=>B, addsub=>cin, sum=>sum, Cout=>co);

process
	begin
	for cnt in 0 to 250 loop
		A<=std_logic_vector(to_unsigned(cnt, A'length));
		B<="00001010";
		cin<='0';
		wait for 10 ns; 
		--assert(sum="0010")report "not working"severity error;	
		wait for  5 ns;
	end loop;
	
	wait;
end process;
end FULL_TB_archi;
