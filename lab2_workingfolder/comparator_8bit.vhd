---
-- Author: Saurav Shandilya
-- Description: Comparator

---

---library 
Library ieee;
USE IEEE.STD_LOGIC_1164.ALL;

entity comparator_8bit is
port
(
  comp_in1 : in bit_vector(7 downto 0) ;
  comp_in2 : in bit_vector(7 downto 0) ;
  
  eql,grt,lss : out bit 
);

end comparator_8bit;


architecture arch of comparator_8bit is
  
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

component myxnor_8bit is
   port( 
      input1_xnor : in bit_vector(7 downto 0);
      input2_xnor : in bit_vector(7 downto 0);     
      out_xnor : out bit_vector(7 downto 0));
end component;

---- signals
  signal equal : bit_vector(7 downto 0);
  signal xnorout,tempeq : bit_vector(7 downto 0);
  --signal tempeq : bit;
  

begin
   
   -- F3: Greater then
   
   -- F2: Equal to
   
    f2xnor : myxnor_8bit port map (comp_in1,comp_in2,xnorout);
    eql <= xnorout(7) and xnorout(6) and xnorout(5) and xnorout(4) and xnorout(3) and xnorout(2) and xnorout(1) and xnorout(0);
  
   -- F1: less then
    lss <= (comp_in2(7) AND NOT comp_in1(7)) OR 
          (xnorout(7) AND comp_in2(6) AND NOT comp_in1(6)) OR 
          (xnorout(7) AND xnorout(6) AND comp_in2(5) AND NOT comp_in1(5)) OR
          (xnorout(7) AND xnorout(6) AND xnorout(5) AND comp_in2(4) AND NOT comp_in1(4)) OR
          (xnorout(7) AND xnorout(6) AND xnorout(5) AND xnorout(4) AND comp_in2(3) AND NOT comp_in1(3)) OR
          (xnorout(7) AND xnorout(6) AND xnorout(5) AND xnorout(4) AND xnorout(3) AND comp_in2(2) AND NOT comp_in1(2)) OR
          (xnorout(7) AND xnorout(6) AND xnorout(5) AND xnorout(4) AND xnorout(3) AND xnorout(2) AND comp_in2(1) AND NOT comp_in1(1)) OR
          (xnorout(7) AND xnorout(6) AND xnorout(5) AND xnorout(4) AND xnorout(3) AND xnorout(2) AND xnorout(1) AND comp_in2(0) AND NOT comp_in1(0));
  
end arch;



