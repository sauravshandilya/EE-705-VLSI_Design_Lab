library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity shift_TB is 
end entity;

architecture FULL_TB_archi of shift_TB is
signal a,b: std_logic_vector(15 downto 0);
signal clk,reset: std_logic;

signal out_8x1: std_logic_vector(7 downto 0);
signal cnt: integer range 0 to 250;

component shift_res
	PORT ( 
			S_shift_res:IN std_logic_vector(15 DOWNTO 0); 
			clk_shift_rs,reset_shift_rs:IN std_logic; 
			out_shift_rs:OUT std_logic_vector(15 DOWNTO 0));
	end component;
	
begin

dut: shift_res port map (S_shift_res=>a,
						clk_shift_rs=>clk,
						reset_shift_rs=>reset,
						out_shift_rs=>b);

process
	begin
	
		a<="1000000000000000";
		reset<='0';
		
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		clk<='0';
		wait for 10 ns; 		
		clk<='1';
		wait for 10 ns; 
		
			
	
	wait;
end process;
end FULL_TB_archi;