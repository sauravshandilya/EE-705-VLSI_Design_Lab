--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: no inputs, no outputs
entity andGate_tb is
end andGate_tb;

-- Describe how to test the AND Gate
architecture tb of andGate_tb is
   --pass andGate entity to the testbench as component
   component andGate is	
   port( A, B : in std_logic;
            F : out std_logic);
   end component;
	
   signal  inA, inB, outF : std_logic;
begin 
   --map the testbench signals to the ports of the andGate
   mapping: andGate port map(inA, inB, outF);

   process
      --variable to track errors
      variable errCnt : integer := 0;
   begin
      --TEST 1
      inA <= '0';
      inB <= '0';
      wait for 15 ns;
      assert(outF = '0')  report "Error 1"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 2
      inA <= '0';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '0')  report "Error 2"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 3
      inA <= '1';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '1')  report "Error 3"  severity error;
      if(outF /= '1') then
         errCnt := errCnt + 1;
      end if;

      -------------- SUMMARY -------------
      if(errCnt = 0) then
         assert false report "Good!"	severity note;
      else
         assert true report "Error!"	severity error;
      end if;

   end process;
end tb;
--------------------------------------------
configuration cfg_tb of andGate_tb is
   for tb
   end for;
end cfg_tb;
