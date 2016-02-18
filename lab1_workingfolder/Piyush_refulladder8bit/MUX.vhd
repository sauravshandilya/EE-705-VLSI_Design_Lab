-------------------------------------------------------------
----------NOT gate-------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY inv is
			PORT ( not_in :IN BIT; not_out:OUT BIT);
END inv;

ARCHITECTURE inv_archi of inv is

BEGIN

	not_out	<= 	NOT(not_in);
 	  
end inv_archi;




-------------------------------------------------------------
-----------------Nand gate---------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NAND2in is
	PORT ( A_nand,B_nand:IN BIT;
		   O_nand:OUT BIT
			);
END NAND2in;

ARCHITECTURE NAND2_Archi of NAND2in is

BEGIN

	O_nand<=	A_nand NAND B_nand;
 	  
end NAND2_Archi;


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
			mux_out <= ((in0 and S) or (in1 and ( not S)));
  
end MUX2x1_Archi;