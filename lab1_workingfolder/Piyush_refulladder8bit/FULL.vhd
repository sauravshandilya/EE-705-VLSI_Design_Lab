library ieee;
use ieee.std_logic_1164.all;

entity full_add is
	port(
		a,b,c :in std_logic;
		sumf, cf : out std_logic
		);
end full_add;

architecture full_add_arc of full_add is
	begin
	sumf <=((a xor b) xor c);
	cf <=((a and b) or (c and (a xor b)));
end full_add_arc;

--------------------------------------------------------------
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity full_add_4 is
		port (
				a,b:in std_logic_vector (3 downto 0);
				cin:in std_logic;
				sum:out std_logic_vector(3 downto 0);
				co: out std_logic
				);
end full_add_4;

architecture full_add_struct of full_add_4 is
	signal x1, x2, x3 : std_logic;
component full_add
	port(
		a,b,c :in std_logic;
		sumf, cf : out std_logic
		);
end component;

begin
u1: full_add port map(a=>a(0), b=>b(0), c=>cin, sumf=>sum(0), cf=>x1);
u2: full_add port map(a=>a(1), b=>b(1), c=>x1, sumf=>sum(1), cf=>x2);
u3: full_add port map(a=>a(2), b=>b(2), c=>x2, sumf=>sum(2), cf=>x3);
u4: full_add port map(a=>a(3), b=>b(3), c=>x3, sumf=>sum(3), cf=>co);
end full_add_struct;


