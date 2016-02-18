---
-- Author: Saurav Shandilya
-- Description: Comparator

---

---library 
Library ieee;
USE IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit is
port
(
  comp_in10,comp_in11, comp_in12, comp_in13 : in bit ;
  comp_in20,comp_in21, comp_in22, comp_in23 : in bit ;
  
  eql,grt,lss : out bit 
);

end comparator_4bit;


architecture arch of comparator_4bit is
  
component myand 
   port( in1, in2 : in bit;
            out1 : out bit);
end component; 

component mynot					
   port( in1 : in bit;
        out1 : out bit);
end component;

component myor
   port( in1, in2 : in bit;
            out1 : out bit);
end component;

component myxor			
   port( in1, in2 : in bit;
            out1 : out bit);
end component;

component mynor					
   port( in1, in2 : in bit;
            out1 : out bit);
end component; 

component fullAdder
   port( A, B, Cin : in bit;
         sum, Cout : out bit);
end component; 

---- signals

signal inv0, inv1, inv2, inv3: bit;   --inverter output
signal C1, C2, C3, C4: bit;           -- full adder carry
signal S1, S2, S3, S0: bit;           -- full adder sums
signal Cin : bit := '1';              -- full adder Cin  = 1
signal orTop, orBot  : bit;     -- or out
signal xor1, xor2    : bit;
signal nor1          : bit;
  

begin

   G_I0: mynot port map(comp_in20, inv0); 
   G_I1: mynot port map(comp_in21, inv1); 
   G_I2: mynot port map(comp_in22, inv2); 
   G_I3: mynot port map(comp_in23, inv3);

   FA0: fullAdder port map(comp_in10, inv0, Cin, S0, C1); -- S0
   FA1: fullAdder port map(comp_in11, inv1, C1,  S1, C2);   -- S1
   FA2: fullAdder port map(comp_in12, inv2, C2,  S2, C3);   -- S2
   FA3: fullAdder port map(comp_in13, inv3, C3,  S3, C4);   -- S3
	
   G_O1: myor port map(S0, S1, orTop);
   G_O2: myor port map(S2, S3, orBot);
   G_N: mynor port map(orTop, orBot, nor1);

   G_X1: myxor port map(C3, C4, xor1);
   G_X2: myxor port map(S3, xor1, xor2);
   
   ---------FINAL OUTPUTS
   eql <= nor1;
   G_GRT: mynor port map(nor1, xor2, grt);
   lss <= xor2;  
  
  
  
end arch;