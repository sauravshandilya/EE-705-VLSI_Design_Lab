/*
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: 6 FLoor Lift controller using verilog
--              System consist of 6 floor (Ground floor to 5th Floor).
--              
*/

/*
*  Module Starts
*/
module elevatorsixfloor
(
	reset,			
	clk,			// clock
	carcall,		// car call button - 6 inside the car
	hallcall_up,		// hall call up button. 1 on each floor except 5th floor
	hallcall_down,		// hall call down button. 1 on each floor except ground floor
	floorsensor,		// floor sensors to detect if car has reached the floor. 1 for each floor

	carled,			// LED indicator for each carcall button
	hallcall_upled,		// LED indicator for each hall call up button
	hallcall_downled,	// LED indicator for each hall call down button
	floorindicatorled,	// LED to indicate which floor lift is
	dooropen,		// 1 if Door is open
	dir_up,			// 1 if lift mnoving up
	dir_down,		// 1 if lift is moving down
	liftmoving		// 1 if lift is in motion 
);

parameter floorcount = 6;	// number for floor for which lift is designed. Changing this can scale the program to operate for any floor

/*
*	Input Port definition
*/
input	wire reset;
input	wire clk;
input	wire [(floorcount-1):0]	carcall;
input	wire [(floorcount-2):0]	hallcall_up;
input	wire [(floorcount-1):1]	hallcall_down;
input	wire [(floorcount-1):0]	floorsensor;

/*
*	Output Port definition
*/
output	[(floorcount-1):0]	carled;
output	[(floorcount-2):0]	hallcall_upled;
output	[(floorcount-1):1]	hallcall_downled;
output	[(floorcount-1):0]	floorindicatorled;
output dooropen;
output dir_up;
output dir_down;
output liftmoving;

/*
*	Wires and reg
*/

//******** For inputs  
//wire clk;
//wire reset;
//wire	[(floorcount-1):0]	wire_carcall;
//wire	[(floorcount-2):0]	wire_hallcall_up;
//wire	[(floorcount-1):1]	wire_hallcall_down;
//wire	[(floorcount-1):0]	wire_floorsensor;

//******** For outputs
reg	[(floorcount-1):0]	carled;
reg	[(floorcount-2):0]	hallcall_upled;
reg	[(floorcount-1):1]	hallcall_downled;
reg	[(floorcount-1):0]	floorindicatorled;


 
//******** Counter-1 related variables- 
reg reg_counter1_en;
reg reg_counter1_rst;
wire [3:0] wire_counter1_out;

//******** Counter-2 related variables- 	
reg reg_counter2_en;
reg reg_counter2_rst;
wire [4:0] wire_counter2_out;

//********* FSM related

//typedef mystate (s_init,s_idle,s_up,s_down, s_stop, s_door);
parameter state_bits = 3,	// Maximum possible states = 2^state_bits (eg. 8 in case state_bits = 3)
	s_init = 3'd0,
	s_idle = 3'd1,
	s_up = 3'd2,
	s_down = 3'd3, 
	s_stop = 3'd4, 
	s_door = 3'd5;
	
reg [state_bits-1:0] state;
reg [state_bits-1:0] nextstate;
reg [state_bits-1:0] curstate;

//********* Other Variables
wire  [(floorcount-1):0] wire_request;
wire  [(floorcount-1):0] wire_request_remain;
wire 	wire_stop;
reg	[(floorcount-1):0]	reg_carcall;
reg	[(floorcount-2):0]	reg_hallcall_up;
reg	[(floorcount-1):1]	reg_hallcall_down;
reg	[(floorcount-1):0]	reg_floorsensor;
reg	[(floorcount-1):0] reg_request;
reg	[(floorcount-1):0] reg_request_remain;
reg	 [4:0] reg_counter2_out;
reg	 [3:0] reg_counter1_out;
reg 	reg_dir_up;
reg 	reg_dir_down;
reg	reg_liftmoving;
reg 	reg_dooropen;
reg	reg_stop;


/*
*	counter-1 Instantation 
*	door will open after 5 clock cycle. This time is given for lift to stop properly leveled on floor. 
*/
	counterncycle #(4,5) inst1  
	(	.clk	(clk),
		.enable	(reg_counter1_en),
		.reset	(reg_counter1_rst),
		.counterout	(wire_counter1_out)
	);
	
/*
*	counter-2 Instantation 
*	door remain open for 30 clock cycle and then closes 
*/
	counterncycle #(5,30) inst2  
	(	.clk	(clk),
		.enable	(reg_counter2_en),
		.reset	(reg_counter2_rst),
		.counterout	(wire_counter2_out)
	);	
	

/* 
*	PROCESS-0 Update counter output
*/
always @ (posedge clk)
begin : counter_update

	reg_counter1_out = wire_counter1_out; 		//counter-1 data update
	reg_counter2_out = wire_counter2_out; 		//counter-1 data update
end
/* 
*	PROCESS-1 state transition
*/
always @ (posedge clk)
begin : FSM_state_tran
	if (reset == 1)
	begin 
		curstate <= s_init;
	end
	else
		curstate <= nextstate;
end

/* 
*	PROCESS-2 state definition
*/
always @ (posedge clk, posedge curstate)
begin : FSM_state_def

	if (reset == 1) begin
		reg_carcall <= 0;
		reg_hallcall_up <= 0;
		reg_hallcall_down <= 0;
		reg_request <= 0;
		reg_request_remain <= 0;
		reg_counter1_rst = 1;
		reg_counter2_rst = 1;
		reg_dir_down <= 0;
		reg_dir_up <= 0;
		//wire_stop <= 0;
		reg_liftmoving <= 0;
		//wire_liftmoving <= 0;
		reg_dooropen <= 0;
		reg_floorsensor <= 6'b0;
		reg_stop <= 0;
		
	end
//	
//	else begin
//		nextstate = curstate;
	


	//nextstate = curstate;
	case(curstate)
		s_init: 
		begin

			nextstate <= s_idle;
		end
		
		s_idle: 
		begin
			reg_counter1_rst = 1;
			reg_counter2_rst = 1;
			
			// lift on ground floor 
			if ((floorsensor[0] == 1) && (reg_request != 0 )) 
			begin
				if (reg_request == 1) 
				begin
					nextstate <= s_stop;
				end
				
				else if (reg_request > 1)
				begin
					nextstate <= s_up;
				end
			end
			
			// lift on first floor 
			if ((floorsensor[1] == 1) && (reg_request != 0)) 
			begin
				if (reg_request < 6'b000010) 
				begin
					nextstate <= s_down;
				end
				
				else if (reg_request == 6'b000010)
				begin
					nextstate <= s_stop;
				end
				
				else if (reg_request > 6'b000010)
				begin
					nextstate <= s_up;
				end
			end
			
			// lift on 2nd floor 
			if ((floorsensor[2] == 1) && (reg_request != 0)) 
			begin
				if (reg_request < 6'b000100) 
				begin
					nextstate <= s_down;
				end
				
				else if (reg_request == 6'b000100)
				begin
					nextstate <= s_stop;
				end
				
				else if (reg_request > 6'b000100)
				begin
					nextstate <= s_up;
				end
			end
			
			// lift on 3rd floor 
			if ((floorsensor[3] == 1) && (reg_request != 0)) 
			begin
				if (reg_request < 6'b001000) 
				begin
					nextstate <= s_down;
				end
				
				else if (reg_request == 6'b001000)
				begin
					nextstate <= s_stop;
				end
				
				else if (reg_request > 6'b001000)
				begin
					nextstate <= s_up;
				end
			end
			
			// lift on 4th floor 
			if ((floorsensor[4] == 1) && (reg_request != 0)) 
			begin
				if (reg_request < 6'b010000) 
				begin
					nextstate <= s_down;
				end
				
				else if (reg_request == 6'b010000)
				begin
					nextstate <= s_stop;
				end
				
				else if (reg_request > 6'b010000)
				begin
					nextstate <= s_up;
				end
			end
			
			// lift on 5th floor 
			if ((floorsensor[5] == 1) && (reg_request != 0)) 
			begin
				if (reg_request < 6'b100000) 
				begin
					nextstate <= s_down;
				end
				
				else if (reg_request == 6'b100000)
				begin
					nextstate <= s_stop;
				end
			end
			
			// all request served 
			if ((floorsensor >= 0) && (reg_request == 0)) 
			begin
				nextstate <= s_door;
			end
		end
		
		s_up:
		begin
			reg_dir_up = 1;
			
			if ((floorsensor[0] == 1) && ((carcall[0] == 1) || (hallcall_up[0] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
			if ((floorsensor[1] == 1) && ((carcall[1] == 1) || (hallcall_up[1] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
			if ((floorsensor[2] == 1) && ((carcall[2] == 1) || (hallcall_up[2] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
			if ((floorsensor[3] == 1) && ((carcall[3] == 1) || (hallcall_up[3] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
			if ((floorsensor[4] == 1) && ((carcall[4] == 1) || (hallcall_up[4] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
			if ((floorsensor[5] == 1) && ((carcall[5] == 1) || (hallcall_up[5] == 1)))
			begin
				//sig_floorsensor <= "000000";
				reg_dir_up <= 1;
				nextstate <= s_stop;
			end
			
		end
		
		s_stop: 
		begin
			//reg_liftmoving = 0;
			reg_counter1_rst = 0;
			reg_counter2_rst = 1;
			reg_counter1_en = 1; 		//-- enable counter1. This counter will count for 5 clk cycle before opening the door
			//reg_stop = 0;
			
			//reg_counter1_out = wire_counter1_out;

			if ((reg_counter1_out == 4) && (reg_stop == 0))			//-- Open DOOR
			begin
				//reg_stop = 1;
				reg_request_remain <= (!(floorsensor) && reg_request);		
				reg_request <= (reg_request ^ floorsensor);
				//reg_carcall_status = (carcall ^ floorsensor);
				nextstate <= s_door;
			end
			
			//-- AFTER DOOR CLOSES
			if (reg_liftmoving == 0)
			begin 
				if ((reg_request_remain == 0) && (reg_stop == 1))  	//-- this is executed when no up/down request - gos in Idle state
				begin
					reg_dir_up <= 0;	
					reg_dir_down <= 0;
					reg_request <= 0;
					nextstate <= s_idle;
				end
				
				else if ((reg_request_remain > floorsensor) && (reg_stop == 1)) 	//-- move up
				begin
					reg_dir_up <= 1;
					nextstate <= s_up;
				end
				
				else if ((reg_request_remain < floorsensor) && (reg_stop == 1)) 	//-- moves down
				begin	
					reg_dir_down <= 1;
					nextstate <= s_down;
				end	
			end 
			
			reg_request_remain <= (!(floorsensor) && (reg_request));		//-- disable request of floor which is serviced and keep track of other requests
			
 		
			//nextstate <= s_stop;
		end
		
		s_door: 
		begin
			reg_liftmoving = 0;
			reg_stop = 1;
			nextstate <= s_stop;
		end
		
		default: ;	// null
	endcase	
end

/* 
*	PROCESS-3 switchpress
*/
always @ (reset, carcall,hallcall_up,hallcall_down,floorsensor)
begin : switch_status

	if (reset == 1) begin
		reg_carcall <= 0;
		reg_hallcall_up <= 0;
		reg_hallcall_down <= 0;
		reg_request <= 0;
		reg_request_remain <= 0;
		reg_counter1_rst = 1;
		reg_counter2_rst = 1;
		reg_dir_down <= 0;
		reg_dir_up <= 0;
		//wire_stop <= 0;
		reg_liftmoving <= 0;
		//wire_liftmoving <= 0;
		reg_dooropen <= 0;
		reg_floorsensor <= 6'b0;
	end
	
	else if (carcall != 0 || hallcall_up != 0 || hallcall_down != 0) begin
	
		// ---- Car call button press
		if (carcall[0] == 1) 
		begin
			reg_carcall[0] <= 1;
			reg_request[0] <= 1;
		end
		
		if (carcall[1] == 1) 
		begin
			reg_carcall[1] <= 1;
			reg_request[1] <= 1;
		end
		
		if (carcall[2] == 1) 
		begin
			reg_carcall[2] <= 1;
			reg_request[2] <= 1;
		end
		
		if (carcall[3] == 1) 
		begin
			reg_carcall[3] <= 1;
			reg_request[3] <= 1;
		end
		
		if (carcall[4] == 1) 
		begin
			reg_carcall[4] <= 1;
			reg_request[4] <= 1;
		end
		
		if (carcall[5] == 1) 
		begin
			reg_carcall[5] <= 1;
			reg_request[5] <= 1;
		end
		
		// -- hall call up press. No hall call button on 5th floor
		if (hallcall_up[0] == 1) 
		begin
			reg_hallcall_up[0] <= 1;		
			reg_request[0] <= 1;
		end
		
		if (hallcall_up[1] == 1) 
		begin
			reg_hallcall_up[1] <= 1;
			reg_request[1] <= 1;
		end
		
		if (hallcall_up[2] == 1) 
		begin
			reg_hallcall_up[2] <= 1;
			reg_request[2] <= 1;
		end
		
		if (hallcall_up[3] == 1) 
		begin
			reg_hallcall_up[3] <= 1;
			reg_request[3] <= 1;
		end
		
		if (hallcall_up[4] == 1) 
		begin
			reg_hallcall_up[4] <= 1;		
			reg_request[4] <= 1;
		end
		
		// ----- hall call down press. No hall call down button on gnd floor.
		if (hallcall_down[1] == 1) 
		begin
			reg_hallcall_down[1] <= 1;		
			reg_request[1] <= 1;
		end
		
		if (hallcall_down[2] == 1) 
		begin
			reg_hallcall_down[2] <= 1;		
			reg_request[2] <= 1;
		end
		
		if (hallcall_down[3] == 1) 
		begin
			reg_hallcall_down[3] <= 1;		
			reg_request[3] <= 1;
		end
		
		if (hallcall_down[4] == 1) 
		begin
			reg_hallcall_down[4] <= 1;		
			reg_request[4] <= 1;
		end
		
		if (hallcall_down[5] == 1) 
		begin
			reg_hallcall_down[5] <= 1;
			reg_request[5] <= 1;
		end
		
	end
			
	
end


endmodule



