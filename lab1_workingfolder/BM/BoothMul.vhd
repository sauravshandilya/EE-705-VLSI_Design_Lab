-------------------------
-- Author: Saurav Shandilya
-- Description: BM implementation
-------------------------

-- ****** Booth Multiplier *******
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity boothmul is

PORT (MR_8B:IN BIT_VECTOR(8 DOWNTO 1);
      MD_8B:IN BIT_VECTOR(16 DOWNTO 9); 
      clk,load,reset:IN BIT;
      out_8B:OUT BIT_VECTOR(15 DOWNTO 0));

end boothmul;

architecture arch boothmul is

-- signal declaration


--component addition

component fulladdsub is		--- import adder
	PORT (A,B:IN std_logic_vector(7 DOWNTO 0); addsub:IN std_logic; sum:OUT std_logic_vector(7 DOWNTO 0);Cout:OUT std_logic);
end component;

component shiftregister is
   PORT (data_in:IN BIT_VECTOR(16 DOWNTO 0); clk_shiftreg,reset_shiftreg:IN BIT; data_out:OUT BIT_VECTOR(16 DOWNTO 0));
end component;

component Counter_8bit is
	port(clk : in std_logic;reset : in std_logic;countout : out std_logic_vector(2 downto 0));
end component;

component Mux_8x1 is
	PORT ( Mux_in_1:IN std_logic_vector(7 DOWNTO 0);Mux_in_2:IN std_logic_vector(7 DOWNTO 0);sel:IN std_logic; 
		mux_out:OUT std_logic_vector(7 DOWNTO 0));
end component;

component mux_2to1 is
    port (A,B,sel: in std_logic;muxout: out std_logic);
end component;

end arch;
