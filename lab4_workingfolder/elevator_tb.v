/*
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Test Bench 6 FLoor Lift controller using verilog
--              
--              
*/

module elevatorsixfloor_tb (); 

/*
*	Input Port definition
*/
reg reset;
reg clk;
reg [(floorcount-1):0]	carcall;
reg [(floorcount-2):0]	hallcall_up;
reg [(floorcount-1):1]	hallcall_down;
reg [(floorcount-1):0]	floorsensor;

/*
*	Output Port definition
*/
wire	[(floorcount-1):0]	carled;
wire	[(floorcount-2):0]	hallcall_upled;
wire	[(floorcount-1):1]	hallcall_downled;
wire	[(floorcount-1):0]	floorindicatorled;
wire dooropen;
wire dir_up;
wire dir_down;
wire liftmoving;

// Device Under Test - Instantation
	elevatorsixfloor (# .floorcount(4)) DUT
(
	.reset(reset),			
	.clk(clk),			// clock
	.carcall(carcall),		// car call button - 6 inside the car
	.hallcall_up(hallcall_up),		// hall call up button. 1 on each floor except 5th floor
	.hallcall_down(hallcall_down),		// hall call down button. 1 on each floor except ground floor
	.floorsensor(floorsensor),		// floor sensors to detect if car has reached the floor. 1 for each floor

	.carled(carled),			// LED indicator for each carcall button
	.hallcall_upled(hallcall_upled),		// LED indicator for each hall call up button
	.hallcall_downled(hallcall_downled),	// LED indicator for each hall call down button
	.floorindicatorled(floorindicatorled),	// LED to indicate which floor lift is
	.dooropen(dooropen),		// 1 if Door is open
	.dir_up(dir_up),			// 1 if lift mnoving up
	.dir_down(dir_down),		// 1 if lift is moving down
	.liftmoving(liftmoving)		// 1 if lift is in motion 
);

always
begin
	clk <= 1'b0; 
	#50
	clk <= 1'b1;
	 #50
end

initial 
begin
	reset = 1'b1;
	#50
	
	
	reset = 1'b0;
	#50
	carcall = 6'b000001;
	

endmodule


