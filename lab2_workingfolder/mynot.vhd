-- Author: Saurav Shandilya
-- Description: mynot (NOT Gate implementation)


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: name, inputs, outputs
entity mynot is					
   port( in1 : in bit;
        out1 : out bit);
end mynot;

--Architecture of NOT gate
architecture arch of mynot is 
begin
  out1 <= not(in1);		
end arch;

