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
				a,b:in std_logic_vector (7 downto 0);
				cin:in std_logic;
				sum:out std_logic_vector(7 downto 0);
				co: out std_logic
				);
end full_add_4;

architecture full_add_struct of full_add_4 is
	signal x1, x2, x3, x4, x5,x6,x7 : std_logic;
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
u4: full_add port map(a=>a(3), b=>b(3), c=>x3, sumf=>sum(3), cf=>x4);
u5: full_add port map(a=>a(4), b=>b(4), c=>x4, sumf=>sum(4), cf=>x5);
u6: full_add port map(a=>a(5), b=>b(5), c=>x5, sumf=>sum(5), cf=>x6);
u7: full_add port map(a=>a(6), b=>b(6), c=>x6, sumf=>sum(6), cf=>x7);
u8: full_add port map(a=>a(7), b=>b(7), c=>x7, sumf=>sum(7), cf=>co);
end full_add_struct;


