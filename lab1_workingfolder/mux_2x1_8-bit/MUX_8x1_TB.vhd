library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity MUX_8x1_TB is 
end entity;

architecture FULL_TB_archi of MUX_8x1_TB is
signal a,b: std_logic_vector(7 downto 0);
signal control: std_logic;
signal out_8x1: std_logic_vector(7 downto 0);
signal cnt: integer range 0 to 250;

component Mux_8x1
	PORT ( Mux_in_1:IN std_logic_vector(7 DOWNTO 0);
			Mux_in_2:IN std_logic_vector(7 DOWNTO 0);
			sel:IN std_logic; 
			mux_out:OUT std_logic_vector(7 DOWNTO 0)
			);
	end component;
	
begin

dut: Mux_8x1 port map (Mux_in_1=>a,Mux_in_2=>b,sel=>control,mux_out=>out_8x1);

process
	begin
	
		a<="00001111";
		b<="11110000";
		control<='0';
		wait for 10 ns; 		
	
		a<="00001111";
		b<="11110000";
		control<='1';
		wait for 10 ns; 		
	
	wait;
end process;
end FULL_TB_archi;