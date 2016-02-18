-----------------------------------------------------------
-------- FULL_ADDER------------------------------------------


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



------------------------------------------------------------------
-------------- XOR gate----------------------------


library ieee;
use ieee.std_logic_1164.all;
entity xor_gate is
port(	
	x: in std_logic;
	y: in std_logic;
	o: out std_logic
	);
end xor_gate; 
architecture xor_archi of xor_gate is 
signal sig1, sig2: std_logic;
begin
	sig1<= x and (not(y));
 	sig2<= (not(x)) and y;
	o<=sig1 or sig2;  
end xor_archi;


--------------------------------------------------------------
---------------------------------------------------------------






-----------------------------------------------------------------
--------------Full Adder 8 bit-----------------------------------


--------------------------------------------------------------
---------------------------------------------------------------



----------------------------------------------------------------
-----------Full adder with x-or gate----------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA_xor is
	PORT (
			A,B:IN std_logic_vector(7 DOWNTO 0); 
			ADD_SUB_BIT:IN std_logic; 
			SUM:OUT std_logic_vector(7 DOWNTO 0);
			Cout:OUT std_logic
			);
END FA_xor; 

ARCHITECTURE FULL_ADDER_8B_Struct of FA_xor is

SIGNAL CF,Bin: std_logic_vector(7 DOWNTO 0);

COMPONENT full_add is
	port(
		a,b,c :in std_logic;
		sumf, cf : out std_logic
		);
END COMPONENT;

COMPONENT xor_gate is
	port(	
		x: in std_logic;
		y: in std_logic;
		o: out std_logic
		);
END COMPONENT;

BEGIN			

	X0: xor_gate 	PORT MAP (x=>B(0),y=>ADD_SUB_BIT,o=>Bin(0));
	X1: xor_gate 	PORT MAP (x=>B(1),y=>ADD_SUB_BIT,o=>Bin(1));
	X2: xor_gate 	PORT MAP (x=>B(2),y=>ADD_SUB_BIT,o=>Bin(2));
	X3: xor_gate 	PORT MAP (x=>B(3),y=>ADD_SUB_BIT,o=>Bin(3));
	X4: xor_gate 	PORT MAP (x=>B(4),y=>ADD_SUB_BIT,o=>Bin(4));
	X5: xor_gate 	PORT MAP (x=>B(5),y=>ADD_SUB_BIT,o=>Bin(5));
	X6: xor_gate 	PORT MAP (x=>B(6),y=>ADD_SUB_BIT,o=>Bin(6));
	X7: xor_gate 	PORT MAP (x=>B(7),y=>ADD_SUB_BIT,o=>Bin(7));


	FA0: full_add  PORT MAP (a=>A(0),b=>Bin(0),c=>ADD_SUB_BIT,sumf=>SUM(0),cf=>CF(1));
	FA1: full_add  PORT MAP (a=>A(1),b=>Bin(1),c=>CF(1),sumf=>SUM(1),cf=>CF(2));
	FA2: full_add  PORT MAP (a=>A(2),b=>Bin(2),c=>CF(2),sumf=>SUM(2),cf=>CF(3));
	FA3: full_add  PORT MAP (a=>A(3),b=>Bin(3),c=>CF(3),sumf=>SUM(3),cf=>CF(4));
	FA4: full_add  PORT MAP (a=>A(4),b=>Bin(4),c=>CF(4),sumf=>SUM(4),cf=>CF(5));
	FA5: full_add  PORT MAP (a=>A(5),b=>Bin(5),c=>CF(5),sumf=>SUM(5),cf=>CF(6));
	FA6: full_add  PORT MAP (a=>A(6),b=>Bin(6),c=>CF(6),sumf=>SUM(6),cf=>CF(7));
	FA7: full_add  PORT MAP (a=>A(7),b=>Bin(7),c=>CF(7),sumf=>SUM(7),cf=>Cout);

end FULL_ADDER_8B_Struct;
