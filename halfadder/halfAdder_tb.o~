-- Author: Saurav Shandilya
-- Description: Testbench for myand implementation


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: no inputs, no outputs
entity myand_tb is
end myand_tb;

-- Describe how to test the AND Gate
architecture arch of myand_tb is
   --pass myand entity to the testbench as component
   component myand is	
   port( in1, in2 : in std_logic;
            out1 : out std_logic);
   end component;
	
   signal  inA, inB, outF : std_logic;
begin 
   --map the testbench signals to the ports of the andGate
   mapping: myand port map(inA, inB, outF);

   process
      --variable to track errors
      variable errCnt : integer := 0;
   begin
      --TEST 1
      inA <= '0';
      inB <= '0';
      wait for 15 ns;
      assert(outF = '0')  report "Both Input Low - AND Gate expected output was 0"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 2
      inA <= '0';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '0')  report "One input Low - AND Gate expected output was 0"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 3
      inA <= '1';
      inB <= '0';
      wait for 15 ns;
      assert(outF = '0')  report "One input Low - AND Gate expected output was 0"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 4
      inA <= '1';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '1')  report "Both Input High - AND Gate expected output was 1"  severity error;
      if(outF /= '1') then
         errCnt := errCnt + 1;
      end if;

      -------------- SUMMARY -------------
      if(errCnt = 0) then
         assert false report "AND Gate created Succesfully!!"	severity note;
      else
         assert true report "Error!.."	severity error;
      end if;

   end process;
end arch;
--------------------------------------------
configuration cfg_tb of myand_tb is
   for arch
   end for;
end cfg_tb;
