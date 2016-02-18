-------------------------
-- Author: Saurav Shandilya
-- Description: 2x1 Multiplexer implementation
-------------------------

-- ****** 2x1 Mux *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_tb is
end mux_2to1_tb;

architecture arch of mux_2to1_tb is

   component mux_2to1 is -- import 2x1 MUX
      port (A,B,sel: in std_logic;
	    muxout: out std_logic	
	);
   end component;
   	
signal A, B, sel, muxout : std_logic;
    		
begin
    mapping: mux_2to1 port map (A,B,sel,muxout);

-- Test bench use 2 concurrent processes
-- concurrent process-1 (this process will toggle sel bit of Mux)
process
begin
     sel <= '0';
     wait for 5 ns;
     sel <= '1'; 
     wait for 5 ns;
end process;

-- concurrent process-2 (this process will change value of input)
process
begin

    --TEST 1
      A <= '0';
      B <= '0';
      wait for 8 ns;
      if(sel = '0') then 
      	assert(muxout = '0') report "Error 1.1 when sel = 0" severity error;
      else 
         assert(muxout = '0') report "Error 1.2 when sel = 1" severity error;
      end if;

    --TEST 2
      A <= '0';
      B <= '1';
      wait for 8 ns;
      if(sel = '0') then 
      	assert(muxout = '0') report "Error 2.1 when sel = 0" severity error;
      else 
         assert(muxout = '1') report "Error 2.2 when sel = 1" severity error;
      end if;

    --TEST 3
      A <= '1';
      B <= '0';
      wait for 8 ns;
      if(sel = '0') then 
      	assert(muxout = '1') report "Error 3.1 when sel = 0" severity error;
      else 
        assert(muxout = '0') report "Error 3.2 when sel = 1" severity error;
      end if;

    --TEST 4
      A <= '1';
      B <= '1';
      wait for 8 ns;
      if(sel = '0') then 
      	assert(muxout = '1') report "Error 4.1 when sel = 0" severity error;
      else 
         assert(muxout = '1') report "Error 4.2 when sel = 1" severity error;
      end if;
end process;	
end arch;

configuration cfg_tb of Mux_2to1_tb is
   for arch
   end for;
end cfg_tb;


