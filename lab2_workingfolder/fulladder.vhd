-------------------------
-- Author: Saurav Shandilya
-- Description: fulladder implementation
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

-- ****** XOR Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity xorGate is	
   port( A, B : in bit;
            C : out bit);
end xorGate;

-- architecture
architecture arch of xorGate is 
begin
   C <= A xor B;
end arch;


--- ***** Half adder 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
   port( A, B : in bit;
    	sum, Cout : out bit);
end halfAdder;

architecture arch of halfAdder is

   component andGate is -- import AND Gate
      port( A, B : in bit;
               C : out bit);
   end component;

   component xorGate is -- import XOR Gate
      port( A, B : in bit;
               C : out bit);
   end component;

begin
   G1 : xorGate port map(A, B, sum);
   G2 : andGate port map(A, B, Cout);
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


-- ****** FULL ADDER *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
   port( A, B, Cin : in bit;
         sum, Cout : out bit);
end fullAdder;
--
architecture arch of fullAdder is

   component halfAdder is --import Half Adder entity
      port( A, B  : in bit;
        sum, Cout : out bit);
   end component;

   component orGate is --import OR Gate entity
      port( A, B : in bit;
             C : out bit);
   end component;
	
   signal halfTohalf, halfToOr1, halfToOr2: bit;

begin
   HA1: halfAdder port map(A, B, halfTohalf, halfToOr1);
   HA2: halfAdder port map(halfTohalf, Cin, sum, halfToOr2);
   OR1: orGate port map(halfToOr1, halfToOr2, Cout);
end arch;