-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 8-bit Full adder Implementation. With Subtractor 
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

-- ****** FULL ADDER 8-bit *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity fullAdder_8bit is
   port( A, B : in bit_vector(7 downto 0);
         sum: out bit_vector(7 downto 0); 
	 Cout : out bit);
end fullAdder_8bit;
--
architecture arch of fullAdder_8bit is

   component halfAdder is --import Half Adder entity
      port( A, B  : in bit;
        sum, Cout : out bit);
   end component;

   component fullAdder is --import full Adder entity
      port( A, B, Cin  : in bit;
        sum, Cout : out bit);
   end component;
	
   signal  signal_cout : bit_vector(7 downto 0);

begin

	FA1: fullAdder port map(A(0),B(0),'0',sum(0),signal_cout(0));
	grp_gen: for i in 1 to 7 generate
		grp_fulladder: fullAdder port map (signal_cout(i-1),A(i),B(i),sum(i),signal_cout(i));
	end generate grp_gen;
	Cout<=signal_cout(7);
 
end arch;

-- ****** FULL ADDER Sub 8-bit *******

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladdsub is
	PORT (
		A,B:IN bit_vector(7 DOWNTO 0); 
		addsub:IN bit; 
		sum:OUT bit_vector(7 DOWNTO 0);
		Cout:OUT bit
			);
END fulladdsub;

architecture arch of fulladdsub is


   component xorGate is -- import XOR Gate
      port( A, B : in bit;
               C : out bit);
   end component;

   component fullAdder is --import full Adder entity
      port( A, B, Cin  : in bit;
        sum, Cout : out bit);
   end component;

   signal CF,temp: bit_vector(7 DOWNTO 0);

begin
	X0: xorGate 	PORT MAP (A=>B(0),B=>addsub,C=>temp(0));
	X1: xorGate 	PORT MAP (A=>B(1),B=>addsub,C=>temp(1));
	X2: xorGate 	PORT MAP (A=>B(2),B=>addsub,C=>temp(2));
	X3: xorGate 	PORT MAP (A=>B(3),B=>addsub,C=>temp(3));
	X4: xorGate 	PORT MAP (A=>B(4),B=>addsub,C=>temp(4));
	X5: xorGate 	PORT MAP (A=>B(5),B=>addsub,C=>temp(5));
	X6: xorGate 	PORT MAP (A=>B(6),B=>addsub,C=>temp(6));
	X7: xorGate 	PORT MAP (A=>B(7),B=>addsub,C=>temp(7));


	FA0: fullAdder  PORT MAP (A=>A(0),B=>temp(0),Cin=>addsub,sum=>SUM(0),Cout=>CF(1));
	FA1: fullAdder  PORT MAP (A=>A(1),B=>temp(1),Cin=>CF(1),sum=>SUM(1),Cout=>CF(2));
	FA2: fullAdder  PORT MAP (A=>A(2),B=>temp(2),Cin=>CF(2),sum=>SUM(2),Cout=>CF(3));
	FA3: fullAdder  PORT MAP (A=>A(3),B=>temp(3),Cin=>CF(3),sum=>SUM(3),Cout=>CF(4));
	FA4: fullAdder  PORT MAP (A=>A(4),B=>temp(4),Cin=>CF(4),sum=>SUM(4),Cout=>CF(5));
	FA5: fullAdder  PORT MAP (A=>A(5),B=>temp(5),Cin=>CF(5),sum=>SUM(5),Cout=>CF(6));
	FA6: fullAdder  PORT MAP (A=>A(6),B=>temp(6),Cin=>CF(6),sum=>SUM(6),Cout=>CF(7));
	FA7: fullAdder  PORT MAP (A=>A(7),B=>temp(7),Cin=>CF(7),sum=>SUM(7),Cout=>Cout);
end arch;
 
-- ****************
