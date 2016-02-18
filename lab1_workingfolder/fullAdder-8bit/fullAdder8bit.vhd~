-------------------------
-- Author: Saurav Shandilya
-- Description: fulladder implementation
-------------------------

-- ****** AND Gate *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- entity
entity andGate is	
   port( A, B : in std_logic;
            C : out std_logic);
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
   port( A, B : in std_logic;
            C : out std_logic);
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
   port( A, B : in std_logic;
    	sum, Cout : out std_logic);
end halfAdder;

architecture arch of halfAdder is

   component andGate is -- import AND Gate
      port( A, B : in std_logic;
               C : out std_logic);
   end component;

   component xorGate is -- import XOR Gate
      port( A, B : in std_logic;
               C : out std_logic);
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
   port( A, B : in std_logic;
            C : out std_logic);
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
   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
end fullAdder;
--
architecture arch of fullAdder is

   component halfAdder is --import Half Adder entity
      port( A, B  : in std_logic;
        sum, Cout : out std_logic);
   end component;

   component orGate is --import OR Gate entity
      port( A, B : in std_logic;
             C : out std_logic);
   end component;
	
   signal halfTohalf, halfToOr1, halfToOr2: std_logic;

begin
   HA1: halfAdder port map(A, B, halfTohalf, halfToOr1);
   HA2: halfAdder port map(halfTohalf, Cin, sum, halfToOr2);
   OR1: orGate port map(halfToOr1, halfToOr2, Cout);
end arch;

-- ****** FULL ADDER 8-bit *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity fullAdder_8bit is
   port( A, B : in std_logic_vector(7 downto 0);
         sum: out std_logic_vector(7 downto 0); 
	 Cout : out std_logic);
end fullAdder_8bit;
--
architecture arch of fullAdder_8bit is

   component halfAdder is --import Half Adder entity
      port( A, B  : in std_logic;
        sum, Cout : out std_logic);
   end component;

   component fullAdder is --import full Adder entity
      port( A, B, Cin  : in std_logic;
        sum, Cout : out std_logic);
   end component;
	
   signal  signal_cout : std_logic_vector(7 downto 0);

begin

	FA1: fullAdder port map(A(0),B(0),'0',sum(0),signal_cout(0));
	grp_gen: for i in 1 to 7 generate
		grp_fulladder: fullAdder port map (signal_cout(i-1),A(i),B(i),sum(i),signal_cout(i));
	end generate grp_gen;
	Cout<=signal_cout(7);
 
end arch;
-- ****************
