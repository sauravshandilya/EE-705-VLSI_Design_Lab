------------------------------------------------------------------
---------------D FF----------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF is
	PORT ( 
			Din,Dclk,Dreset:IN std_logic; 
			Q_DFF:OUT std_logic
			);
END DFF;

ARCHITECTURE DFF_BEHV of DFF is

BEGIN
		PROCESS(Dclk,Dreset)		
				BEGIN
				IF (Dreset='1') THEN Q_DFF <= '0';
				ELSIF (Dclk='1' AND Dclk'EVENT) THEN   Q_DFF <= Din;       
   				ELSE NULL;                        
				END IF;            
		END PROCESS;

END DFF_BEHV;

--------------------------------------------------------------------------
-------------------------------------------------------------------------

--------------------------------------
----------- SHIFT REGISTER ----------- 
--------------------------------------

-- To include Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity Declarations

ENTITY shift_res is
			PORT ( 
			S_shift_res:IN std_logic_vector(15 DOWNTO 0); 
			clk_shift_rs,reset_shift_rs:IN std_logic; 
			out_shift_rs:OUT std_logic_vector(15 DOWNTO 0));
END shift_res;

-- Architecture Declarations

ARCHITECTURE shift_res_STRUCT of shift_res is

COMPONENT DFF is
	--		PORT ( D_DFF,CLK_DFF,RESET_DFF:IN BIT; Q_DFF:OUT BIT);
		port(
			Din,Dclk,Dreset:IN std_logic; 
			Q_DFF:OUT std_logic
			);
END COMPONENT;

BEGIN
			D1: DFF PORT MAP(Din=>S_shift_res(1), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(0));			
			D2: DFF PORT MAP(Din=>S_shift_res(2), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(1));
			D3: DFF PORT MAP(Din=>S_shift_res(3), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(2));
			D4: DFF PORT MAP(Din=>S_shift_res(4), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(3));
			D5: DFF PORT MAP(Din=>S_shift_res(5), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(4));
			D6: DFF PORT MAP(Din=>S_shift_res(6), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(5));
			D7: DFF PORT MAP(Din=>S_shift_res(7), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(6));
			D8: DFF PORT MAP(Din=>S_shift_res(8), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(7));
			D9: DFF PORT MAP(Din=>S_shift_res(9), Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(8));
			D10:DFF PORT MAP(Din=>S_shift_res(10),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(9));
			D11:DFF PORT MAP(Din=>S_shift_res(11),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(10));
			D12:DFF PORT MAP(Din=>S_shift_res(12),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(11));
			D13:DFF PORT MAP(Din=>S_shift_res(13),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(12));
			D14:DFF PORT MAP(Din=>S_shift_res(14),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(13));
			D15:DFF PORT MAP(Din=>S_shift_res(15),Dclk=>clk_shift_rs,Dreset=>reset_shift_rs,Q_DFF=> out_shift_rs(14));
			
END shift_res_STRUCT;