-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 6 FLoor Lift controller using VHDL
--              System consist of 6 floor (Ground floor to 5th Floor).
--              
-------------------------


--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--ENTITY DECLARATION: name, inputs, outputs
entity elevator6floor is
	generic (floorcount : integer := 6; cyclecount:integer:= 5 ); 
	port (
		reset,clk :in std_logic; 
		carcall: in std_logic_vector ((floorcount-1) downto 0):=(others=>'0');
		hallcall_up: in std_logic_vector ((floorcount-2) downto 0) :=(others=>'0');	-- 4 downto 0
		hallcall_down: in std_logic_vector ((floorcount-1) downto 1):=(others=>'0');	-- 5 downto 1
		floorsensor: in std_logic_vector ((floorcount-1) downto 0):=(others=>'0');

		carled: out std_logic_vector ((floorcount-1) downto 0):=(others=>'0');
		hallcall_upled: out std_logic_vector ((floorcount-2) downto 0):=(others=>'0');		-- hallcall up led 
		hallcall_downled: out std_logic_vector ((floorcount-1) downto 1):=(others=>'0');	-- hallcall down led 
		floorindicatorled: out std_logic_vector ((floorcount-1) downto 0):=(others=>'0');	-- indicate floor number
		
		--elvator_status: out std_logic_vector((floorcount-1) downto 0);
		dooropen,dir_up,dir_down,liftmoving: out std_logic 
	);
end elevator6floor;

architecture behav of elevator6floor is
-- signals
component Counter_ncycle
      generic (cyclecount : integer ; maxcount : unsigned(4 downto 0) );
      port(
	clk : in std_logic;
	enable: in std_logic;
        reset : in std_logic;
	countout : out std_logic_vector((cyclecount-1) downto 0)
);
end component;

type mystate is (s_init,s_idle,s_up,s_down, s_stop, s_door);

signal nextstate, curstate: mystate;
--signal state_signal : mystate;
signal sig_carcall,sig_carcall_status : std_logic_vector ((floorcount-1) downto 0):=(others=>'0');
signal sig_hallcall_up,sig_hallcall_up_status : std_logic_vector ((floorcount-2) downto 0):=(others=>'0');
signal sig_hallcall_down,sig_hallcall_down_status : std_logic_vector ((floorcount-1) downto 1):=(others=>'0');
signal sig_floorsensor: std_logic_vector ((floorcount-1) downto 0):=(others=>'0');
signal sig_motorup: std_logic;
signal sig_motordown: std_logic;
signal sig_request: std_logic_vector((floorcount-1) downto 0) :=(others=>'0');					-- store carcall, hallcall request for each floor
signal sig_request_remain: std_logic_vector((floorcount-1) downto 0) :=(others=>'0');				-- request remaining for each floor
signal sig_counter1_out,sig_counter2_out : std_logic_vector((cyclecount-1) downto 0);
signal sig_counter1_en,sig_counter2_en : std_logic;
signal sig_counter1_rst,sig_counter2_rst : std_logic;
signal sig_dir_up : std_logic;
signal sig_dir_down : std_logic;
signal sig_liftmoving : std_logic;
signal sig_stop : std_logic;
signal sig_dooropen : std_logic;

begin

-- process LED Indicators
LEDInd: process (clk,reset)
begin
	floorindicatorled <= sig_floorsensor;
	liftmoving <= sig_liftmoving;
	carled <= sig_carcall;
	hallcall_upled <= sig_hallcall_up;
	hallcall_downled <= sig_hallcall_down;
	
end process;

--- PROCESS-1 state change
nextstate1:
process (reset,clk,carcall,hallcall_up,hallcall_down)		
	begin	
		if (reset = '1') then
			curstate <= s_init;
		elsif (clk'EVENT and clk = '1') then
			curstate <= nextstate;
		end if;
end process;

--counter-1 Open door after 5 clk cycle - after reaching the floor and stoping
	count1: Counter_ncycle
	generic map (cyclecount => cyclecount, maxcount => "00101")
	port map (
		clk => clk,
		enable => sig_counter1_en,
		reset => sig_counter1_rst,
		countout (4 downto 0) => sig_counter1_out
		);

--counter-2 door remain open for 30 clk cycle
	count2: Counter_ncycle
	generic map (cyclecount => cyclecount, maxcount => "11101")
	port map (
		clk => clk,
		enable => sig_counter2_en,
		reset => sig_counter2_rst,
		countout (4 downto 0) => sig_counter2_out
		);
			
--- PROCESS-2 
buttonstate:
process (clk,reset,carcall,hallcall_up,hallcall_down,floorsensor,curstate)
	
	begin

	if (reset = '1') then
		--nextstate_var <= s_init;
		sig_carcall <= "000000";
		sig_hallcall_up <= "00000";
		sig_hallcall_down <= "00000";
		sig_carcall_status <= "000000";
		sig_hallcall_up_status <= "00000";
		sig_hallcall_down_status <= "00000";
		sig_request <= "000000";
		sig_request_remain <= "000000";
		sig_counter1_rst <= '1';
		sig_counter2_rst <= '1';
		dir_down <= '0';
		dir_up <= '0';
		sig_stop <= '0';
		liftmoving <= '0';
		sig_liftmoving <= '0';
		sig_dooropen <= '0';
		dooropen <= '0';
		--floorsensor <= "000000";
		sig_floorsensor <= "000000";
		
		
	
	elsif (
		(carcall'event or hallcall_up'event or hallcall_down'event or floorsensor'event) OR 
		(carcall((floorcount-1) downto 0) /= "000000" OR 
		hallcall_up((floorcount-2)downto 0) /= "00000" OR 
		hallcall_down((floorcount-1)downto 1) /= "00000")
	) then	
	
		sig_floorsensor <= floorsensor;
-- car call button press
		if (carcall'event and carcall(floorcount-1) = '1') then			  -- 5th floor
			sig_carcall(floorcount-1) <= '1';
			sig_request(floorcount-1) <= '1';
		end if;
	
		if (carcall'event and carcall(floorcount-2) = '1') then			  -- 4th floor
			sig_carcall(floorcount-2) <= '1';
			sig_request(floorcount-2) <= '1';			
		end if;
						
		if (carcall'event and carcall(floorcount-3) = '1') then			  -- 3rd floor
			sig_carcall(floorcount-3) <= '1';
			sig_request(floorcount-3) <= '1';			
		end if;
						
		if (carcall'event and carcall(floorcount-4) = '1') then			  -- 2nd floor
			sig_carcall(floorcount-4) <= '1';
			sig_request(floorcount-4) <= '1';			
		end if;
						
		if (carcall'event and carcall(floorcount-5) = '1') then			  -- 1st floor
			sig_carcall(floorcount-5) <= '1';
			sig_request(floorcount-5) <= '1';			
		end if;
						
		if (carcall'event and carcall(floorcount-6) = '1') then			  -- gnd floor
			sig_carcall(floorcount-6) <= '1';
			sig_request(floorcount-6) <= '1';
		end if;
		
-- hall call up press. No hall call button on 5th floor
		if (hallcall_up'event and hallcall_up(floorcount-2) = '1') then		  -- 4th floor
			sig_hallcall_up(floorcount-2) <= '1';
			sig_request(floorcount-2) <= '1';
		end if;
	
		if (hallcall_up'event and hallcall_up(floorcount-3) = '1') then		  -- 3rd floor
			sig_hallcall_up(floorcount-3) <= '1';
			sig_request(floorcount-3) <= '1';
		end if;
						
		if (hallcall_up'event and hallcall_up(floorcount-4) = '1') then		  -- 2nd floor
			sig_hallcall_up(floorcount-4) <= '1';
			sig_request(floorcount-4) <= '1';
		end if;
						
		if (hallcall_up'event and hallcall_up(floorcount-5) = '1') then		  -- 1st floor
			sig_hallcall_up(floorcount-5) <= '1';
			sig_request(floorcount-5) <= '1';
		end if;
						
		if (hallcall_up'event and hallcall_up(floorcount-6) = '1') then		  -- gnd floor
			sig_hallcall_up(floorcount-6) <= '1';
			sig_request(floorcount-6) <= '1';
		end if;
						
-- hall call down press. No hall call down button on gnd floor.
		if (hallcall_down'event and hallcall_down(floorcount-1) = '1') then		  -- 5th floor
			sig_hallcall_down(floorcount-1) <= '1';
			sig_request(floorcount-1) <= '1';
		end if;
	
		if (hallcall_down'event and hallcall_down(floorcount-2) = '1') then		  -- 4th floor
			sig_hallcall_down(floorcount-2) <= '1';
			sig_request(floorcount-2) <= '1';
		end if;
						
		if (hallcall_down'event and hallcall_down(floorcount-3) = '1') then		  -- 3rd floor
			sig_hallcall_down(floorcount-3) <= '1';
			sig_request(floorcount-3) <= '1';
		end if;
						
		if (hallcall_down'event and hallcall_down(floorcount-4) = '1') then		  -- 2nd floor
			sig_hallcall_down(floorcount-4) <= '1';
			sig_request(floorcount-4) <= '1';
		end if;
						
		if (hallcall_down'event and hallcall_down(floorcount-5) = '1') then		  -- 1st floor
			sig_hallcall_down(floorcount-5) <= '1';
			sig_request(floorcount-5) <= '1';
		end if;
		
		--sig_carcall_status <= (not(sig_floorsensor) and sig_carcall);
		--sig_hallcall_up_status <= (not(sig_floorsensor ((floorcount-2) downto 0)) and sig_hallcall_up);
		--sig_hallcall_down_status <= (not(sig_floorsensor((floorcount-1) downto 1)) and sig_hallcall_down);
		--sig_request_remain <= (not(floorsensor) and sig_request);
		
	end if;
		
--end process;
--	
--statejump:
--process (clk,curstate)
--	
--	variable nextstate_var : myState;
--	begin
	
	--nextstate_var :=  state_signal;
	
	if reset = '1' then				--if reset =1 remain in init state
		nextstate <= s_init;
		
	else 
	
		case curstate is

		when s_init => 
		if(reset = '0') then              -- reset = 0, goto idle state
			nextstate <= s_idle;
		end if;  

		when s_idle => 
		sig_counter1_rst <= '1';
		sig_counter2_rst <= '1';
		sig_request_remain <= (not(floorsensor) and sig_request);
		
	-- Lift is Idle on gnd floor - and either up or down call is received
		if (floorsensor ="000001" and sig_request /= "000000") then		-- gnd floor
			if (sig_request = "000001") then -- Open door if lift on ground floor and presses carcall-0 or hallcall_up-0 
				nextstate <= s_stop;					-- open door if hall call button on gnd floor or carcall-1 button is pressed
				sig_stop <= '0';
				sig_liftmoving <= '1';
				--sig_floorsensor(0) <= '1';
				
			elsif (sig_request > "000001") then	-- Higher floor request
				nextstate <= s_up;
				
			end if;
		end if;
		
	-- Lift is Idle on 1st floor - and either up or down call is received
		if (floorsensor ="000010" and sig_request /= "000000") then		-- 1st floor
			if (sig_request < "000010") then -- Open door if lift on ground floor and presses carcall-0 or hallcall_up-0 
				nextstate <= s_down;
				
			elsif (sig_request = "000010") then
				nextstate <= s_stop;					-- open door if hall call button on gnd floor or carcall-1 button is pressed
				sig_stop <= '0';
				sig_liftmoving <= '1';
				--sig_floorsensor(1) <= '1';
				
			elsif (sig_request > "000010") then	-- Higher floor request
				nextstate <= s_up;
				
			end if;
		end if;
		
	-- Lift is Idle on 2nd floor - and either up or down call is received
		if (floorsensor ="000100" and sig_request /= "000000") then		-- 2nd floor
			if (sig_request < "000100") then 		-- lower floor request
				nextstate <= s_down;						
				
			elsif (sig_request = "000100") then	-- Open door if lift on 2nd floor and presses carcall-2 or hallcall_up-2 or hallcall_down-2 
				nextstate <= s_stop;						-- open door if hall call button on 1st floor or carcall-1 button is pressed
				sig_stop <= '0';
				
			elsif (sig_request > "000100") then	--  higher floor request	
				nextstate <= s_up;
			
			end if;
		end if;	
		
	-- Lift is Idle on 3rd floor - and either up or down call is received
		if (floorsensor ="001000" and sig_request /= "000000") then		-- 3rd floor
			if (sig_request < "001000") then 		-- lower floor request
				nextstate <= s_down;						
				
			elsif (sig_request = "001000") then	-- -- Open door if lift on 3rd floor and carcall and hallcall down of floor is pressed
				nextstate <= s_stop;						-- open door if hall call button on 1st floor or carcall-1 button is pressed
				sig_stop <= '0';
				
			elsif (sig_request > "001000") then	-- higher floor request
				nextstate <= s_up;
			
			end if;
		end if;					
		
	-- Lift is Idle on 4th floor - and either up or down call is received
		if (floorsensor ="010000" and sig_request /= "000000") then		-- 4th floor
			if (sig_request < "010000") then 		-- lower floor request
				nextstate <= s_down;						
				
			elsif (sig_request = "010000") then	-- Open door if lift on 4th floor and carcall and hallcall down of floor is pressed
				nextstate <= s_stop;						-- go to open door state
				sig_stop <= '0';
				
			elsif (sig_request > "010000") then	-- higher floor request
				nextstate <= s_up;
			
			end if;
		end if;								

	-- Lift is Idle on 5th floor - and either up or down call is received
		if (floorsensor ="100000" and sig_request /= "000000") then		-- 5th floor
			if (sig_request < "100000") then 		-- lower floor request
				nextstate <= s_down;						
				
			elsif (sig_request = "100000") then	-- Open door if lift on 5th floor and carcall and hallcall down of floor is pressed
				nextstate <= s_stop;						-- go to open door state 
				sig_stop <= '0';
				
			end if;
		end if;
		
		if (floorsensor >="000000" and sig_request = "000000") then		-- if all request served - remain in idle state
			nextstate <= s_idle;
		end if;	

				
-- STATE: UP ---------
		when s_up =>
		
			dir_up <= '1';		-- lift is moving in upward direction
			sig_liftmoving <= '1';
			liftmoving <= '1';
			dir_down <= '0';	-- lift will not move down
			sig_counter1_rst <='1';
			sig_counter2_rst <= '1';
			sig_stop <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			--sig_hallcall_up 
			
		
		--if (floorsensor(0) = '1' and sig_request_remain(0) = '1') then				-- Ground floor 
		if (floorsensor(0) = '1' and (sig_carcall(0) = '1' or sig_hallcall_up(0) = '1')) then
			--sig_floorsensor <= "000000";
			dir_up <= '1';
			sig_motorup <= '0';
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;
		end if;
		
		--if (floorsensor(1) ='1' and (sig_carcall(1) = '1' or sig_hallcall_up(1) = '1' or sig_hallcall_down(1) = '1')) then	-- 1st floor
		if (floorsensor(1) ='1' and (sig_carcall(1) = '1' or sig_hallcall_up(1) = '1')) then	-- 1st floor
			dir_up <= '1';
			sig_motorup <= '0';
			--sig_request <= (sig_request xor "000010");
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;
		
		--elsif (floorsensor(2) ='1' and (sig_carcall(2) = '1' or sig_hallcall_up(2) = '1' or sig_hallcall_down(2) = '1')) then	-- 2nd floor		
		elsif (floorsensor(2) ='1' and (sig_carcall(2) = '1' or sig_hallcall_up(2) = '1')) then	-- 2nd floor
			dir_up <= '1';
			sig_motorup <= '0';
			--sig_request <= (sig_request xor "000100");
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;

		--elsif (floorsensor(3) ='1' and (sig_carcall(3) = '1' or sig_hallcall_up(3) = '1' or sig_hallcall_down(3) = '1')) then	-- 3rd floor		
		elsif (floorsensor(3) ='1' and (sig_carcall(3) = '1' or sig_hallcall_up(3) = '1')) then	-- 3rd floor
			dir_up <= '1';
			sig_motorup <= '0';
			--sig_request <= (sig_request xor "001000");
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;

		--elsif (floorsensor(4) ='1' and (sig_carcall(4) = '1' or sig_hallcall_up(4) = '1' or sig_hallcall_down(4) = '1')) then	-- 4th floor		
		elsif (floorsensor(4) ='1' and (sig_carcall(4) = '1' or sig_hallcall_up(4) = '1')) then	-- 4th floor
			dir_up <= '1';
			sig_motorup <= '0';
			--sig_request <= (sig_request xor "010000");
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;

		--elsif (floorsensor(5) ='1' and (sig_carcall(5) = '1' or sig_hallcall_down(5) = '1')) then	-- 5th floor		
		elsif (floorsensor(5) ='1' and sig_request_remain(5) = '1') then	-- 5th floor
			dir_up <= '1';
			sig_motorup <= '0';
			--sig_request <= (sig_request xor "100000");
			sig_floorsensor <= floorsensor;
			nextstate <= s_stop;
--		else 
--			nextstate <= s_up;		
--			
		end if;

-- STATE: DOWN ---------
		when s_down =>
		
			dir_up <= '0';		-- lift is moving in upward direction
			dir_down <= '1';	-- lift will not move down
			sig_liftmoving <= '1';
			liftmoving <= '1';
			sig_counter1_rst <='1';
			sig_counter2_rst <= '1';
			sig_stop <= '0';
			--sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests

		if (floorsensor(0) = '1' and sig_request_remain(0) = '1') then				-- Ground floor 
			dir_down <= '1';
			sig_motordown <= '0';
			sig_floorsensor(0) <= floorsensor(0);
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			nextstate <= s_stop;
		--end if;
		
		elsif (floorsensor(1) ='1' and (sig_carcall(1) = '1' or sig_hallcall_down(1) = '1')) then	-- 1st floor
		--elsif (floorsensor(1) ='1' and sig_request_remain(1) = '1') then	-- 1st floor
			dir_down <= '1';
			sig_motordown <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			sig_floorsensor(1) <= floorsensor(1);
			nextstate <= s_stop;
		
		elsif (floorsensor(2) ='1' and (sig_carcall(2) = '1' or sig_hallcall_down(2) = '1')) then	-- 2nd floor		
		--elsif (floorsensor(2) ='1' and sig_request_remain(2) = '1') then	-- 2nd floor
			dir_down <= '1';
			sig_motordown <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			sig_floorsensor(2) <= floorsensor(2);
			nextstate <= s_stop;
		elsif (floorsensor(3) ='1' and (sig_carcall(3) = '1' or sig_hallcall_down(3) = '1')) then	-- 3rd floor		
		--elsif (floorsensor(3) ='1' and sig_request_remain(3) = '1') then	-- 3rd floor
			dir_down <= '1';
			sig_motordown <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			sig_floorsensor(3) <= floorsensor(3);
			nextstate <= s_stop;

		elsif (floorsensor(4) ='1' and (sig_carcall(4) = '1' or sig_hallcall_down(4) = '1')) then	-- 4th floor		
		--elsif (floorsensor(4) ='1' and sig_request_remain(4) = '1') then	-- 4th floor
			dir_down <= '1';
			sig_motordown <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			sig_floorsensor(4) <= floorsensor(4);
			nextstate <= s_stop;

		elsif (floorsensor(5) ='1' and (sig_carcall(5) = '1' or sig_hallcall_down(5) = '1')) then	-- 5th floor		
		--elsif (floorsensor(5) ='1' and sig_request_remain(5) = '1') then	-- 5th floor
			dir_down <= '1';
			sig_motordown <= '0';
			sig_request_remain <= (not(sig_floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			sig_floorsensor(5) <= floorsensor(5);
			nextstate <= s_stop;
			
		end if;

		when s_stop => 
			sig_liftmoving <= '0';
			liftmoving <= '0';
			sig_counter1_rst <= '0';
			sig_counter2_rst <= '1';
			sig_counter1_en <= '1'; 		-- enable counter1. This counter will count for 5 clk cycle before opening the door
			
			
			if (sig_liftmoving = '0') then
				if ((sig_request_remain = "000000") and (sig_stop='1')) then
					dir_up <= '0';	
					dir_down <= '0';
					sig_request <= (others => '0');
					nextstate <= s_idle;
				
				elsif ((sig_request_remain > floorsensor) and sig_stop='1') then
					dir_up <= '1';
					nextstate <= s_up;
				elsif ((sig_request_remain < floorsensor) and sig_stop='1') then
					dir_down <= '1';
					nextstate <= s_down;
				end if;	
			end if; 
			
			sig_request_remain <= (not(floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
			
			if (sig_counter1_out = "00101" and sig_stop = '0') then
				--sig_stop <= '1';
				--sig_request_remain <= (not(sig_floorsensor) and sig_request);		
				--sig_request <= (sig_request xor sig_floorsensor);
				--sig_carcall_status <= (sig_carcall xor sig_floorsensor);
				nextstate <= s_door;
			end if;
		
		when s_door =>
			
			dooropen <= '1';			-- door open
			sig_liftmoving <= '0';
			sig_stop <= '1';
			sig_counter2_rst <= '0';
			sig_counter1_rst <= '1';
			sig_counter2_en <= '1'; 
			
			sig_request_remain <= (not(floorsensor) and sig_request);		-- disable request of floor which is serviced and keep track of other requests
				

			if floorsensor(0) = '1' then
				sig_request(0) <= '0';
				sig_carcall(0) <= '0';
				sig_hallcall_up(0) <= '0';
			elsif floorsensor(1) = '1' then
				sig_request(1) <= '0';	
				sig_carcall(1) <= '0';
				sig_hallcall_up(1) <= '0';
				sig_hallcall_down(1) <= '0';
			elsif floorsensor(2) = '1' then
				sig_request(2) <= '0';	
				sig_carcall(2) <= '0';
				sig_hallcall_up(2) <= '0';
				sig_hallcall_down(2) <= '0';
			elsif floorsensor(3) = '1' then
				sig_request(3) <= '0';	
				sig_carcall(3) <= '0';
				sig_hallcall_up(3) <= '0';
				sig_hallcall_down(3) <= '0';
			elsif floorsensor(4) = '1' then
				sig_request(4) <= '0';	
				sig_carcall(4) <= '0';
				sig_hallcall_up(4) <= '0';
				sig_hallcall_down(4) <= '0';
			elsif floorsensor(5) = '1' then
				sig_request(5) <= '0';	
				sig_carcall(5) <= '0';
				sig_hallcall_down(5) <= '0';
			end if;
			
			if (sig_counter2_out = "11101")	then	-- after 30 clk cycle door close
				dooropen <= '0';		-- door close
				nextstate <= s_stop;
				
			end if;	
			

		when others => null;
		end case;
	end if;
end process;

-- begin process-3 - Enable register and set value to required signals in various states                            
--output_process: 
--process(,reset)
--	begin
--		--case state_signal is
--	
--		--when s_idle =>               --- reset all registers to zero in idle state
--	
--end process;
		
end behav;
