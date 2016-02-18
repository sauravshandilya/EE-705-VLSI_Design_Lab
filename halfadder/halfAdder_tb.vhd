-------------------------
-- Author: Saurav Shandilya
-- Description: halfAdder testbench implementation
-------------------------


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: no inputs, no outputs
entity halfAdder_tb is
end halfAdder_tb;

-- Describe how to test the AND Gate
architecture arch of halfAdder_tb is
   --pass myand entity to the testbench as component
   component halfAdder is	
   port( A, B : in std_logic;
           sum, Cout : out std_logic);
   end component;
	
   signal  A, B, sum,Cout : std_logic;
begin 
   --map the testbench signals to the ports of the halfAdder
   mapping: halfAdder port map(A, B, sum, Cout);

   process
      --variable to track errors
      variable errCnt : integer := 0;
   begin
      --TEST 1
      A <= '0';
      B <= '0';
      wait for 15 ns;
      assert(sum = '0')  report "Error-1: Both Input Low - Expected output was 0"  severity error;
      if(sum /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 2
      A <= '0';
      B <= '1';
      wait for 15 ns;
      assert(sum = '1')  report "Error-2: One input High - Expected output was 1"  severity error;
      if(sum /= '1') then
         errCnt := errCnt + 1;
      end if;

      --TEST 3
      A <= '1';
      B <= '0';
      wait for 15 ns;
      assert(sum = '1')  report "Error-3: One input High - Expected output was 1"  severity error;
      if(sum /= '1') then
         errCnt := errCnt + 1;
      end if;

      --TEST 4
      A <= '1';
      B <= '1';
      wait for 15 ns;
      assert(sum = '0')  report "Error-4: Both Input High - Expected output was 0"  severity error;
      if(sum /= '0') then
         errCnt := errCnt + 1;
      end if;

      -------------- SUMMARY -------------
      if(errCnt = 0) then
         assert false report "AND Gate created Succesfully!!"	severity note;
      else
         assert true report "Error!.."	severity error;
      end if;
      wait;	
   end process;
end arch;
--------------------------------------------
configuration cfg_tb of halfAdder_tb is
   for arch
   end for;
end cfg_tb;
