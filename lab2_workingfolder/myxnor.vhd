-- Author: Saurav Shandilya
-- Description: myxnor (XNOR Gate implementation)


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: name, inputs, outputs
entity myxnor_8bit is
   port( 
      input1_xnor : in bit_vector(7 downto 0);
      input2_xnor : in bit_vector(7 downto 0);     
      out_xnor : out bit_vector(7 downto 0));
end myxnor_8bit;

--Architecture of AND gate
architecture arch of myxnor_8bit is 
begin
  out_xnor <= input1_xnor xnor input2_xnor;		
end arch;


