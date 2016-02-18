-------------------------
-- Author: Saurav Shandilya
-- Description: 2x1 Multiplexer implementation
-------------------------

-- ****** AND Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity andGate is	
   port( A, B : in bit;
            C : out bit);
end andGate;

-- architecture
architecture arch of andGate is 
begin
   C <= A and B;
end arch;

-- ****** OR Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity orGate is	
   port( A, B : in bit;
            C : out bit);
end orGate;

-- architecture
architecture arch of orGate is 
begin
   C <= A or B;
end arch;

-- ****** NOT Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity notGate is	
   port( A: in bit;
         notA: out bit);
end notGate;

-- architecture
architecture arch of notGate is 
begin
   notA <= not(A);
end arch;

-- ****** 2x1 Mux *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    port (A,B,sel: in bit;
	    muxout: out bit	
	);
end mux2x1;

architecture arch of mux2x1 is

   component andGate is -- import AND Gate
      port( A, B : in bit;
               C : out bit);
   end component;

   component orGate is -- import OR Gate
      port( A, B : in bit;
               C : out bit);
   end component;

   component notGate is -- import NOT Gate
      port( A: in bit;
            notA: out bit);
   end component;
   	
signal sig_and1, sig_and2, sig_not: bit;
    		
begin
    not1: notgate port map(sel,sig_not);
    and1: andgate port map(A,sig_not,sig_and1);
    and2: andgate port map(B,sel,sig_and2);
    or1: orgate port map(sig_and1,sig_and2,muxout);		
end arch;


