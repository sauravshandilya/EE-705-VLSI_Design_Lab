-- Author: Saurav Shandilya
-- Description: myand for 3 input(AND Gate implementation)


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: name, inputs, outputs
entity myand_3ip is					
   port( in1, in2, in3 : in bit;
            out1 : out bit);
end myand_3ip;

--Architecture of AND gate
architecture arch of myand_3ip is 
begin
  out1 <= in1 and in2 and in3;		
end arch;


