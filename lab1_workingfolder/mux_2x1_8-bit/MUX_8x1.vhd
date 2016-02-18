

--------------------------------------------------------------
------------Mux 2x1-------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX2x1 is
	PORT ( in0,in1,S:IN std_logic; 
		mux_out:OUT std_logic);
END MUX2x1;

ARCHITECTURE MUX2x1_Archi of MUX2x1 is
SIGNAL S1, S2, S3: BIT;

COMPONENT NAND2in is
			PORT (A_nand,B_nand:IN BIT; O_nand:OUT BIT);
END COMPONENT;

COMPONENT inv is
			PORT (not_in:IN BIT; not_out:OUT BIT);
END COMPONENT;

BEGIN
			mux_out <= ((in1 and S) or (in0 and ( not S)));
  
end MUX2x1_Archi;


---------------------------------------------------------------
---------------------------------------------------------------



-------------------------------------------------------------------
--------------------8x1 mux---------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux_8x1 is
	PORT ( Mux_in_1:IN std_logic_vector(7 DOWNTO 0);
			Mux_in_2:IN std_logic_vector(7 DOWNTO 0);
			sel:IN std_logic; 
			mux_out:OUT std_logic_vector(7 DOWNTO 0)
			);
			
END Mux_8x1;


ARCHITECTURE Mux_8x1_archi of Mux_8x1 is

COMPONENT MUX2x1 is
		--	PORT ( A0_MUX2x1,A1_MUX2x1,S0_MUX2x1:IN BIT; MO_MUX2x1:OUT BIT);
			PORT ( in0,in1,S:IN std_logic; 
					mux_out:OUT std_logic);
	END COMPONENT;

BEGIN

			D7: 	MUX2x1 PORT MAP(in0=>Mux_in_1(7),in1=> Mux_in_2(7),S=> sel,mux_out=> mux_out(7));		
			D6: 	MUX2x1 PORT MAP(in0=>Mux_in_1(6),in1=> Mux_in_2(6),S=> sel,mux_out=> mux_out(6));
			D5: 	MUX2x1 PORT MAP(in0=>Mux_in_1(5),in1=> Mux_in_2(5),S=> sel,mux_out=> mux_out(5));
			D4: 	MUX2x1 PORT MAP(in0=>Mux_in_1(4),in1=> Mux_in_2(4),S=> sel,mux_out=> mux_out(4));	
			D3: 	MUX2x1 PORT MAP(in0=>Mux_in_1(3),in1=> Mux_in_2(3),S=> sel,mux_out=> mux_out(3));
			D2: 	MUX2x1 PORT MAP(in0=>Mux_in_1(2),in1=> Mux_in_2(2),S=> sel,mux_out=> mux_out(2));
			D1: 	MUX2x1 PORT MAP(in0=>Mux_in_1(1),in1=> Mux_in_2(1),S=> sel,mux_out=> mux_out(1));	
			D0: 	MUX2x1 PORT MAP(in0=>Mux_in_1(0),in1=> Mux_in_2(0),S=> sel,mux_out=> mux_out(0));

END Mux_8x1_archi;