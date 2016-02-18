library ieee ; 
use ieee . std_logic_1164 . all ; 
use ieee . numeric_std . all ; 

entity MUX_TB is 
end entity;

architecture FULL_TB_archi of MUX_TB is
signal a,b: std_logic;
signal control: std_logic;
signal C: std_logic;
signal cnt: integer range 0 to 250;

component MUX2x1
	port ( 
		in0,in1,S:IN std_logic; 
		mux_out:OUT std_logic
		);
	end component;
	
begin

dut: MUX2x1 port map (in0=>a,in1=>b,S=>control,mux_out=>C);

process
	begin
	for cnt in 0 to 8 loop
		a<='0';
		b<='1';
		control<='0';
		wait for 10 ns; 
		
		a<='1';
		b<='0';
		control<='0';
		wait for 10 ns; 
		
	end loop;
	
	wait;
end process;
end FULL_TB_archi;