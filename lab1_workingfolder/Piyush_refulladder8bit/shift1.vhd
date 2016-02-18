

--------------------------------------
----------- SHIFT REGISTER ----------- 
--------------------------------------

-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity Declarations

ENTITY shift_res1 is
			PORT ( 
			S_shift_res:IN std_logic_vector(15 DOWNTO 0); 
			out_shift_rs:OUT std_logic_vector(15 DOWNTO 0));
END shift_res1;

-- Architecture Declarations

ARCHITECTURE shift_res_STRUCT of shift_res1 is

BEGIN
		out_shift_rs(0)<=S_shift_res(1);
		out_shift_rs(1)<=S_shift_res(2);
		out_shift_rs(2)<=S_shift_res(3);
		out_shift_rs(3)<=S_shift_res(4);
		out_shift_rs(4)<=S_shift_res(5);
		out_shift_rs(5)<=S_shift_res(6);
		out_shift_rs(6)<=S_shift_res(7);
		out_shift_rs(7)<=S_shift_res(8);
		out_shift_rs(8)<=S_shift_res(9);
		out_shift_rs(9)<=S_shift_res(10);
		out_shift_rs(10)<=S_shift_res(11);
		out_shift_rs(11)<=S_shift_res(12);
		out_shift_rs(12)<=S_shift_res(13);
		out_shift_rs(13)<=S_shift_res(14);
		out_shift_rs(14)<=S_shift_res(15);		
		out_shift_rs(15)<=S_shift_res(15);	
END shift_res_STRUCT;