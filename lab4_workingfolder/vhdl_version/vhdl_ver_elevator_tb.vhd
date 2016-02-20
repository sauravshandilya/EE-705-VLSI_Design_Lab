-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Test Bench for 6 floor elevator        
-- 4 test cases
-- Select "Test case - # starts "and Test case - # ends" and uncomment once. 
-------------------------

-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- entity desription
entity elevator6floor_TB is
end elevator6floor_TB;

-- Architecture Description

architecture behav of elevator6floor_TB is

-- component declaration
component elevator6floor
	generic (floorcount : integer := 6; cyclecount:integer:= 5); 
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
end component;


-- signals 
signal clk,reset : std_logic;
signal carcall : std_logic_vector (5 downto 0):=(others=>'0');
signal hallcall_up : std_logic_vector (4 downto 0):=(others=>'0');
signal hallcall_down : std_logic_vector (5 downto 1):=(others=>'0');
signal floorsensor : std_logic_vector (5 downto 0):=(others=>'0');
signal carled : std_logic_vector (5 downto 0):=(others=>'0');
signal hallcall_upled: std_logic_vector (4 downto 0):=(others=>'0');
signal hallcall_downled: std_logic_vector (5 downto 1):=(others=>'0');
signal floorindicatorled: std_logic_vector (5 downto 0):=(others=>'0');

signal dooropen,dir_up,dir_down,liftmoving : std_logic; 
signal clocktime :time := 100 ps;

-- begin 

begin 

elevatorTB : elevator6floor
	generic map (floorcount => 6, cyclecount => 5)  
	port map (
	reset,
	clk,
	carcall,
	hallcall_up,
	hallcall_down,
	floorsensor,
	carled,
	hallcall_upled,
	hallcall_downled,
	floorindicatorled,
	dooropen,
	dir_up,
	dir_down,
	liftmoving
	);

---- Process-1 for clock
clock: process        
	begin
	clk <= '0'; 
	wait for (clocktime/2);
	clk <= '1'; 
	wait for (clocktime/2);    
end process;


IP0: process


begin

	reset <= '1';
	wait for 200 ps;
	reset <= '0';
	wait for 100 ps;

---- TEST CASE - 1 Starts -- Sample test case as provided in email

--	floorsensor <= "000001";	-- lift at ground floor
--	wait for 500 ps;
--	
--	hallcall_up <= "00100";		-- UP hall call button from 2nd floor
--	wait for 1 ns;			-- lift traverse upward - reaches 2nd floor in 1 ns
--	
--	floorsensor <= "000010";	-- Lift at 1st floor - No request - should not stop
--	wait for 400 ps;
--	
--	floorsensor <= "000100";	-- stop at 2nd floor based on UP call request. 
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).
--	wait for 2500 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	
--	carcall <= "010000";		-- Carcall of 4th floor is pressed - 
--	wait for 700 ps;		-- door closes
--	
--	floorsensor <= "001000";	-- lift reaches 3rd floor- should not stop
--	wait for 500 ps;
--	hallcall_down <= "10000";	-- while in transit towards upward floor - DOWN hallcall from 5th floor is received
--	wait for 500 ps;

--	floorsensor <= "010000";	-- lift reaches 4th floor 
--	wait for 600 ps;		-- After 5 cycle door will open (= 100*5 ps).
--	wait for 3200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps. Door closes
--	
--	wait for 700 ps; 		-- lift travers up from 4th to 5th floor. reaches in 700 ps
--	
--	floorsensor <= "100000";	-- lift reaches 5th floor 
--	wait for 600 ps;		-- After 5 cycle door will open (= 100*5 ps).
--	wait for 2500 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	
--	carcall <= "000001";		-- request for ground floor
--	wait for 900 ps;		-- door closes. Lifts starts moving down
--	
--	hallcall_up <= "01000";		-- hall call up from 3rd floor
--	wait for 500 ps;
--	

--	floorsensor <= "000001";	-- ground floor
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).
--	wait for 3200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	wait for 200 ps;		-- to reach 3rd floor
--	
--	floorsensor <= "001000";
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).
--	wait for 3200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	wait for 200 ps;		-- to reach 3rd floor

--	-- Now wait in Idle State	
--	
---- Test case -1 ends

---- Test case - 2 Starts
---- Lift at  floor-3 initially.  Passenger-1 presses hall call down on floor to go down. Lift door opens, passenger-1 enters the lift. Before he press car call button passenger on floor-4 call lift to go up, user presses car call button to go down to ground floor. 
----Expected output - Lift moves up despite passenger-1 calling and entering it first.

--	floorsensor <= "001000";	-- lift on 3 rd floor
--	wait for 1000 ps;
--	
--	hallcall_down <= "00100";	-- call down request of 3rd floor
--	wait for 110 ps;
-- 	hallcall_down <= "00000";	-- button released 

--	wait for 600 ps;		-- After 5 cycle door will open (= 100*5 ps).
--	wait for 2200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	
--	hallcall_up <= "10000";		-- call up request from floor-4.
--	wait for 110 ps;
-- 	hallcall_up <= "00000";		-- button released 

--	wait for 200 ps;	
--	carcall <= "000001";		-- user inside lift presses carcall 2 button.
--	wait for 110 ps;
-- 	carcall <= "000000";		-- button released 

--	wait for 700 ps;			-- door closes

-- 	floorsensor <= "010000";		--Lift on 4th floor -- Lifts stops here
--	wait for 600 ps;		
--	wait for 2200 ps;		
--	wait for 700 ps;			
--	 
-- 	floorsensor <= "100000";		--Lift on 5th floor - randomly moves lift to 5th floor
--	wait for 600 ps;		
--	wait for 2200 ps;		
--	wait for 700 ps;			

-- 	floorsensor <= "001000";		--Lift on 3th floor
--	wait for 600 ps;		
--	wait for 2200 ps;		
--	wait for 700 ps;			

-- 	floorsensor <= "000100";		--Lift on 2th floor
--	wait for 600 ps;		
--	wait for 2200 ps;		
--	wait for 700 ps;			

-- 	floorsensor <= "000001";		--Lift on ground floor - Stops, door open and closes after 30 clock cycle
--	wait for 600 ps;		
--	wait for 2200 ps;		
--	wait for 700 ps;			

---- Test case-2 ends	

	

--- Test case - 3  starts
-- Lift at 3rd floor initially.  Passenger-1 presses hall call up on floor. Lift door opens, passenger-1 enters the lift. He/she remember that he/she wants to go down and not up. So presses the carcall button for ground button. As they is no other request from any up floor. Lifts moves down. 
--Expected output - Lift moves down despite passenger calling hall call up button because there is no other call up request

	floorsensor <= "001000";	-- lift at 3rd floor
	wait for 500 ps;
	
	hallcall_up <= "01000";		-- up button of ground floor
	wait for 110 ps;
	hallcall_up <= "00000";		-- switch released

	wait for 600 ps;		-- After 5 cycle door will open (= 100*5 ps).
	wait for 2200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
	
	carcall <= "000001";		-- car call for ground floor.
	wait for 110 ps;
	carcall <= "000000";		-- switch released

	wait for 200 ps;	
	wait for 700 ps;			-- door closes without user pressing any car requests
	
 -- 	lift should moves down 

 	floorsensor <= "000100";		--Lift on 2nd floor 
	wait for 600 ps;		
	wait for 2200 ps;		
	wait for 700 ps;			
	
 	floorsensor <= "000001";		--Lift on ground floor -- Lifts stops here
	wait for 600 ps;		
	wait for 2200 ps;		


	wait for 1000 ps;
	
-- Test case 3 ends


---- Test -4 Starts --- Lifts moves in downward even if call is from 
--		
--	-- Lift is initially at rest on floor 5. At floor 5, passenger-1 wants to go to floor 0. Presses the hallcall down button on 5th floor. Lift door will open. User enters the lift and press carcall button of 5th floor. Lift door closes after 30 cycles. Lift starts moving down. Passenger on Floor-3 wants to go up and press hallcall up button on floor-3. Lift reaches floor-4, floor-3 (although there is request from this floor, lift will first serve down request as it is requested earlier). Lift moves down to floor-2, floor-1 and stops at ground floor. Passenger-1 leaves the lift. Now lift moves up to floor-3 to serve passegnger-2. 
--	
--	floorsensor <= "100000";		-- Lift iniitally at rest with door closed on 5th floor
--	wait for 500 ps;
--	
--	hallcall_down <= "10000";	-- users want to go down - opens lift door to opening
--	wait for 110 ps;
--	hallcall_down <= "00000";	-- switch is released.
--	
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).
--	wait for 2200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps
--	carcall <= "000001";		-- user want to go to ground floor
--	wait for 110 ps;
--	carcall <= "000000";		-- switch is released
--	
--	wait for 200 ps;	
--	wait for 1000 ps;			-- door closes 
--	
--	
--	hallcall_up <= "01000";		-- user on 3rd floor wants to go up - 
--	wait for 110 ps;
--	hallcall_down <= "00000";	-- switch is realsed
--	
--	wait for 500 ps;
--	floorsensor <= "010000";		-- 4th floor
--	wait for 700 ps;
--	floorsensor <= "001000";		-- 3rd floor
--	
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).

--	wait for 200 ps;
--	floorsensor <= "000100"	;		-- 2nd floor
--	wait for 500 ps;
--	
--	floorsensor <= "000010"	;		-- 1st floor
--	wait for 500 ps;
--	
--	floorsensor <= "000001"	;		-- Ground floor
--	wait for 600 ps;			-- After 5 cycle door will open (= 100*5 ps).
--	wait for 2200 ps;		-- door opens for 30 cycles (= 100*30 = 3000 ps). User enter lift and press car call button after 2500 ps	
--	wait for 1000 ps;			-- door closes 
--	
--	floorsensor <= "000010";			-- lifts moves up to floor-1
--	wait for 1000 ps;
--	floorsensor <= "001000";		-- lifts reaches floor-3. Stops to serve passenger-2
--	wait for 500 ps;

---- test case-4 ends

	wait;


end process;

end behav;

