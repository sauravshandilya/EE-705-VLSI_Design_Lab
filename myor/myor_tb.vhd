-- Author: Saurav Shandilya
-- Description: Testbench for myor implementation


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: no inputs, no outputs
entity myor_tb is
end myor_tb;

-- Describe how to test the AND Gate
architecture arch of myor_tb is
   --pass myand entity to the testbench as component
   component myor is	
   port( in1, in2 : in std_logic;
            out1 : out std_logic);
   end component;
	
   signal  inA, inB, outF : std_logic;
begin 
   --map the testbench signals to the ports of the andGate
   mapping: myor port map(inA, inB, outF);

   process
      --variable to track errors
      variable errCnt : integer := 0;
   begin
      --TEST 1
      inA <= '0';
      inB <= '0';
      wait for 15 ns;
      assert(outF = '0')  report "Both Input Low - OR Gate expected output was 0"  severity error;
      if(outF /= '0') then
         errCnt := errCnt + 1;
      end if;

      --TEST 2
      inA <= '0';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '1')  report "One input High - OR Gate expected output was 1"  severity error;
      if(outF /= '1') then
         errCnt := errCnt + 1;
      end if;

      --TEST 3
      inA <= '1';
      inB <= '0';
      wait for 15 ns;
      assert(outF = '1')  report "One input High - OR Gate expected output was 1"  severity error;
      if(outF /= '1') then
         errCnt := errCnt + 1;
      end if;

      --TEST 4
      inA <= '1';
      inB <= '1';
      wait for 15 ns;
      assert(outF = '1')  report "Both Input High - OR Gate expected output was 1"  severity error;
      if(outF /= '1') then
         errCnt := errCnt + 1;
      end if;

      -------------- SUMMARY -------------
      if(errCnt = 0) then
         assert false report "OR Gate created Succesfully!!"	severity note;
      else
         assert true report "Error!.."	severity error;
      end if;
      wait;

   end process;
end arch;
--------------------------------------------
configuration cfg_tb of myor_tb is
   for arch
   end for;
end cfg_tb;
