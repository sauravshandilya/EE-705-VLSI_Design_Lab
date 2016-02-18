library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity FA_XOR_TB is 
end entity;

architecture FULL_TB_archi of FA_XOR_TB is
signal a,b: std_logic_vector (7 downto 0);
signal sum: std_logic_vector (7 downto 0);
signal cin: std_logic;
signal co: std_logic;
signal cnt: integer range 0 to 250;

component FA_xor
	port (
			A,B:IN std_logic_vector(7 DOWNTO 0); 
			ADD_SUB_BIT:IN std_logic; 
			SUM:OUT std_logic_vector(7 DOWNTO 0);
			Cout:OUT std_logic
			);
	end component;
	
begin

dut: FA_xor port map (A=>a, B=>b, ADD_SUB_BIT=>cin, SUM=>sum, Cout=>co);

process
	begin
	for cnt in 0 to 250 loop
		a<=std_logic_vector(to_unsigned(cnt, a'length));
		b<="10001111";
		cin<='0';
		wait for 10 ns; 
		--assert(sum="0010")report "not working"severity error;	
		wait for  5 ns;
	end loop;
	
	wait;
end process;
end FULL_TB_archi;