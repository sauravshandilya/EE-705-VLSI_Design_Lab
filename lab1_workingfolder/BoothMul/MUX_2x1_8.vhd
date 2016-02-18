-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 2x1 Multiplexer implementation - for 8-bit Input
-------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Mux2x1_8bit is
	port 
	( Mux_in_1:IN bit_vector(7 DOWNTO 0);
		Mux_in_2:IN bit_vector(7 DOWNTO 0);
		sel:IN bit; 
		mux_out:OUT bit_vector(7 DOWNTO 0)
	);		
end Mux2x1_8bit;

---
architecture arch of Mux2x1_8bit is


COMPONENT mux2x1 is
			port (A,B,sel: in bit;
	    muxout: out bit	
	);
END COMPONENT;

begin

			D7: 	mux2x1 PORT MAP(A=>Mux_in_1(7),B=> Mux_in_2(7),sel=> sel,muxout=> mux_out(7));		
			D6: 	mux2x1 PORT MAP(A=>Mux_in_1(6),B=> Mux_in_2(6),sel=> sel,muxout=> mux_out(6));
			D5: 	mux2x1 PORT MAP(A=>Mux_in_1(5),B=> Mux_in_2(5),sel=> sel,muxout=> mux_out(5));
			D4: 	mux2x1 PORT MAP(A=>Mux_in_1(4),B=> Mux_in_2(4),sel=> sel,muxout=> mux_out(4));	
			D3: 	mux2x1 PORT MAP(A=>Mux_in_1(3),B=> Mux_in_2(3),sel=> sel,muxout=> mux_out(3));
			D2: 	mux2x1 PORT MAP(A=>Mux_in_1(2),B=> Mux_in_2(2),sel=> sel,muxout=> mux_out(2));
			D1: 	mux2x1 PORT MAP(A=>Mux_in_1(1),B=> Mux_in_2(1),sel=> sel,muxout=> mux_out(1));	
			D0: 	mux2x1 PORT MAP(A=>Mux_in_1(0),B=> Mux_in_2(0),sel=> sel,muxout=> mux_out(0));

end arch;