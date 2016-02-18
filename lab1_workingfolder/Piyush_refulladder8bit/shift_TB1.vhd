library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity shift_TB1 is 
end entity;

architecture FULL_TB_archi1 of shift_TB1 is
signal a,b: std_logic_vector(15 downto 0);
signal clk,reset: std_logic;

signal out_8x1: std_logic_vector(7 downto 0);
signal cnt: integer range 0 to 250;

component shift_res1
	PORT ( 
			S_shift_res:IN std_logic_vector(15 DOWNTO 0); 			
			out_shift_rs:OUT std_logic_vector(15 DOWNTO 0)
			);
	end component;
	
begin

dut: shift_res1 port map (S_shift_res=>a,
						out_shift_rs=>b);

process
	begin
	
		a<="1000000000000000";
		reset<='0';
		
		clk<='0';
		wait for 10 ns; 		
		 a<=b; 
		 clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		 a<=b; 
		 clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		 a<=b; 
		 clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		 a<=b; 
		 clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		 a<=b; 
		 clk<='1';
		wait for 10 ns; 
		
			
	
	wait;
end process;
end FULL_TB_archi1;