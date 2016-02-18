library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity FULL_8_TB is 
end entity;

architecture FULL_TB_archi of FULL_8_TB is
signal a,b: std_logic_vector (7 downto 0);
signal sum: std_logic_vector (7 downto 0);
signal cin: std_logic;
signal co: std_logic;
signal cnt: integer range 0 to 15;

component full_add_4
	port (
			a,b:in std_logic_vector (7 downto 0);
			cin:in std_logic;
			sum:out std_logic_vector(7 downto 0);
			co: out std_logic
			);
	end component;
	
begin

dut: full_add_4 port map (a=>a, b=>b, cin=>cin, sum=>sum, co=>co);

process
	begin
	for cnt in 0 to 250 loop
		a<=std_logic_vector(to_unsigned(cnt, a'length));
		b<="00000011";
		cin<='0';
		wait for 10 ns; 
		--assert(sum="0010")report "not working"severity error;	
		wait for  5 ns;
	end loop;
	
	wait;
end process;
end FULL_TB_archi;