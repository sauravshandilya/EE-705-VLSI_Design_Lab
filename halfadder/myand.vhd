-- Author: Saurav Shandilya
-- Description: myand (AND Gate implementation)


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: name, inputs, outputs
entity myand is					
   port( in1, in2 : in std_logic;
            out1 : out std_logic);
end myand;

--Architecture of AND gate
architecture arch of myand is 
begin
  out1 <= in1 and in2;		
end arch;
