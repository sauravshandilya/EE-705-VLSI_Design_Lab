`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:00 02/16/2016 
// Design Name: 
// Module Name:    lift_control1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lift_control1(
    input 				clk,
	 input 				poweron,
	 input 	wire[6:0] ack_reg,
	 input   wire[6:0] pulse_in,
	 input   wire[5:0] pulse_up,
	 input   wire[5:0] pulse_down,
	 output  reg[6:0] reg_in,
	 output  reg[5:0] reg_up,
	 output  reg[5:0] reg_down
	 );
		reg [6:0] in_reg;
		reg [5:0] up_reg,down_reg;
		reg up,down,problem;
		integer count,i;
		reg [2:0] cur_state,next_state;
		parameter  check 		= 3'b 000;
		parameter  goup  		= 3'b 001;
		parameter  godown		= 3'b 010;
		parameter  dooropen	= 3'b 011;
		parameter  waiting   = 3'b 100;
		parameter  close     = 3'b 101;
		
		/* start of code from now */
		always@(*)
			begin
					reg_in = in_reg;
					reg_up = up_reg;
					reg_down = down_reg;
			end
		
							
							
		////////////////////////////////////////////////////////combination block for reaching next state 					
		always@(*) begin
				case(cur_state)
						check:		if(ack_reg[0] && ((poweron==1'b0)))	begin
												if(up_reg[0])									next_state<=dooropen;
												else if (up)									next_state<=goup;
												else												next_state<= check;
											end
										else if(ack_reg[1] && ((poweron==1'b0)))	begin
												if(up_reg[1] || down_reg[0]) 				next_state<=dooropen;
												else if(up) 									next_state<=goup;
												else if(down)									next_state<=godown;
												else												next_state<=check;
											end	
										else if(ack_reg[2] && ((poweron==1'b0)))	begin
												if(up_reg[2] || down_reg[1]) 				next_state<=dooropen;
												else if(up) 									next_state<=goup;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[3] && ((poweron==1'b0)))	begin
												if(up_reg[3] || down_reg[2]) 				next_state<=dooropen;
												else if(up) 									next_state<=goup;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[4] && ((poweron==1'b0)))	begin
												if(up_reg[4]  || down_reg[3]) 				next_state<=dooropen;
												
												else if(up) 									next_state<=goup;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[5] && ((poweron==1'b0)))	begin
												if(up_reg[5] || down_reg[4]) 				next_state<=dooropen;
												else if(up) 									next_state<=goup;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[6] && ((poweron==1'b0)))	begin
												if(down_reg[5])								next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
										end
										else														next_state<=check;														
						
						goup:			if(ack_reg[0])	begin
												if(in_reg[0] || up_reg[0])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[1])	begin
												if(in_reg[1] || up_reg[1])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[2])	begin
												if(in_reg[2] || up_reg[2])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[3])	begin
												if(in_reg[3] || up_reg[3])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[4])	begin
												if(in_reg[4] || up_reg[4])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[5])	begin
												if(in_reg[5] || up_reg[5])					next_state<=dooropen;
												else if(up)										next_state<=goup;
												else												next_state<=check;
												end
										else if(ack_reg[6])	begin
												if(in_reg[6])									next_state<=dooropen;
												else												next_state<=check;
												end
										else     // when sensor malfunctioning
																									next_state<=check;
						
						godown:     if(ack_reg[0])begin
												if(in_reg[0])									next_state<=dooropen;
												else												next_state<=check;
												end
										else if(ack_reg[1]) begin
												if(in_reg[1] || down_reg[0])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[2])	begin
												if(in_reg[2] || down_reg[1])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[3])  begin
												if(in_reg[3] || down_reg[2])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[4])	begin
												if(in_reg[4] || down_reg[3])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[5])	begin
												if(in_reg[5] || down_reg[4])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else if(ack_reg[6])	begin
												if(in_reg[6] || down_reg[5])				next_state<=dooropen;
												else if(down)									next_state<=godown;
												else												next_state<=check;
												end
										else 														next_state<=check;
										
							
					dooropen:		next_state<=waiting;
					waiting :
										
												if(count==0)										next_state<=close;
												else												next_state<=waiting;
											
					  
					  close :		if(up && ((down==1'b0))) 								next_state<=goup;
										else if(up==1'b0 && down==1'b1)						next_state<=godown;
										else														next_state<=check;
						
					default :																	next_state<=check;
									
				endcase
				end		
			///////////////////////////////////////////////////////////////////////////////////////////////
			
			
			/////////////////////////////////////////////////////////////////////////////////////////////output logic
			
			always@(cur_state,posedge clk) begin
				case(cur_state)
							
						check :    if(ack_reg[0] && ((poweron==1'b0)))
													begin
													up<=(in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) | (up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
													down<=0;problem<=0;
													if(up_reg[0] &&  (clk)) begin
															up_reg[0]<=1'b0;	end
													end
														
										else if(ack_reg[1] && ((poweron==1'b0)))begin
													up<=(in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
													down<= (in_reg[0]) | (up_reg[0]);problem<=0;
													if((up_reg[1] || down_reg[0]) &&  clk )
																up_reg[1]<=0;down_reg[0]<=0;end
						
										else if(ack_reg[2] && ((poweron==1'b0)))begin
													up<=(in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
													down<= (in_reg[0] | in_reg[1]) | (up_reg[0] | up_reg[1])| (down_reg[0]);
													problem<=0;
													if((up_reg[2] || down_reg[1])  && (clk))
																up_reg[2]<=0;down_reg[1]<=0;end
										
										else if(ack_reg[3] && ((poweron)==1'b0))begin						
													up<=(in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[4] | up_reg[5]) | (down_reg[3] | down_reg[4] | down_reg[5]);
													down<= (in_reg[0] | in_reg[1] | in_reg[2]) | (up_reg[0] | up_reg[1] | up_reg[2])| (down_reg[0] | down_reg[1]);
													problem<=0;
													if((up_reg[3] || down_reg[2])  && ((clk))) 
																up_reg[3]<=0;down_reg[2]<=0;end

										else if(ack_reg[4] && ((poweron)==1'b0))	begin
													up<=(in_reg[5] | in_reg[6]) |(up_reg[5]) | (down_reg[4] | down_reg[5]);
													down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3])| (down_reg[0] | down_reg[1] | down_reg[2]);
													problem<=0;
													if((up_reg[4]==1 || down_reg[3]==1)  && ((clk))) 
																up_reg[4]<=1'b0;down_reg[3]<=1'b0;end
														
										else if(ack_reg[5] && ((poweron==1'b0)))	begin
													up<=(in_reg[6])  | (down_reg[5]);
													down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4])| (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3]);
													problem<=0;
													if((up_reg[5]==1 || down_reg[4]==1)  && ((clk))) 
																up_reg[5]<=0;down_reg[4]<=0;end
										
										else if(ack_reg[6] && ((poweron==1'b0)))	begin
												up<=0;
												down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5])| (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4]);
												problem<=0;
												if(down_reg[5]==1  && ((clk))) 
																down_reg[5]<=0;end
										else

																problem<=1;
																
					goup:			
										if(ack_reg[0])begin
												up<=(in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) | (up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
												down<=0;
												problem<=0;
												if((in_reg[0]==1 || up_reg[0]==1)  && ((clk)))
																in_reg[0]<=0;up_reg[0]<=0;end
																
										else if(ack_reg[1]==1)begin
												up<=(in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
												down<=0;
												problem<=0;
												if((in_reg[1]==1 || up_reg[1]==1) && ((clk)))
																in_reg[1]<=0;up_reg[1]<=0;end
																
										else if(ack_reg[2]==1)begin
												up<=(in_reg[3] | in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[3] | up_reg[4] | up_reg[5]) | (down_reg[2] | down_reg[3] | down_reg[4] | down_reg[5]);
												down<=0;
												
												problem<=0;
												if((in_reg[2]==1 || up_reg[2]==1) && ((clk))) 
																in_reg[2]<=0 ; up_reg[2]<=0;end
																
										else if(ack_reg[3]==1)begin
												up<=(in_reg[4] | in_reg[5] | in_reg[6]) |(up_reg[4] | up_reg[5]) | (down_reg[3] | down_reg[4] | down_reg[5]);
												down<=0;
												problem<=0;
												if((in_reg[3]==1 || up_reg[3]==1) && ((clk)))
																in_reg[3]<=0 ; up_reg[3]<=0;end
										
										else if(ack_reg[4]==1)begin
												up<=(in_reg[5] | in_reg[6]) |(up_reg[5]) | (down_reg[4] | down_reg[5]);
												down<=0;
												problem<=0;
												if((in_reg[4]==1|| up_reg[4]==1) && ((clk)))
																in_reg[4]<=0 ; up_reg[4]<=0;end
																
										else if(ack_reg[5]==1)begin
												down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4])| (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3]);
												up<=0;
												problem<=0;
												if((in_reg[5]==1 || up_reg[5]==1) && ((clk)))
															in_reg[5]<=0 ; up_reg[5]<=0;end
															
										else if(ack_reg[6]==1)begin
												up<=0;
												down<=0;
												problem<=0;
												if(in_reg[6]==1 && ((clk))) 
															in_reg[6]<=0;end
										else
												problem<=1;
							
					godown:			if(ack_reg[0])begin
												down<=0 ; up<=0 ;
												problem<=0;
												if(in_reg[0]==1 && ((clk)))
															in_reg[0]<=0;end
															
										else if(ack_reg[1])begin
												down<= (in_reg[0]) | (up_reg[0]);
												up<=0;
												problem<=0;
												if((in_reg[1]==1 || down_reg[0]==1) && ((clk)))
															in_reg[1]<=0;down_reg[0]<=0;end
										else if(ack_reg[2])begin
												down<= (in_reg[0] | in_reg[1]) | (up_reg[0] | up_reg[1])| (down_reg[0]);
												up<=0;
												problem<=0;
												if((in_reg[2]==1 || down_reg[1]==1)  && ((clk)))
															in_reg[2]<=0;down_reg[1]<=0;end
															
										else if(ack_reg[3])begin
												down<= (in_reg[0] | in_reg[1] | in_reg[2]) | (up_reg[0] | up_reg[1] | up_reg[2])| (down_reg[0] | down_reg[1]);
												up<=0;
												problem<=0;
												if((in_reg[3]==1 || down_reg[2]==1)  && ((clk)))
															in_reg[3]<=0;down_reg[2]<=0;end
														
										else if(ack_reg[4])begin
												down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3])| (down_reg[0] | down_reg[1] | down_reg[2]);
												up<=0;
												problem<=0;
												if((in_reg[4]==1 || down_reg[3]==1)  && ((clk)))
															in_reg[4]<=0;down_reg[3]<=0;end
															
										else if(ack_reg[5])begin
												down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4])| (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3]);
												up<=0;
												problem<=0;
												if((in_reg[5]==1 || down_reg[4]==1)  && ((clk)))
															in_reg[5]<=0;down_reg[4]<=0;end
															
										else if(ack_reg[6])begin
												down<= (in_reg[0] | in_reg[1] | in_reg[2] | in_reg[3] | in_reg[4] | in_reg[5]) | (up_reg[0] | up_reg[1] | up_reg[2] | up_reg[3] | up_reg[4] | up_reg[5])| (down_reg[0] | down_reg[1] | down_reg[2] | down_reg[3] | down_reg[4]);
												up<=0;
												problem<=0;
												if((in_reg[6]==1 || down_reg[5]==1)  && ((clk)))
															in_reg[6]<=0;down_reg[5]<=0;end
															
										else
												problem<=1;
												
						dooropen:		count<=30;
						waiting :		count<=count-1	;
						close	  :							;
				endcase;
				end	
			////////////////////////////////////////////////////////////////////////////////////////////
			
			////////////////////////////////////////////////////////////////////////////////////////////state register
				always@(posedge clk,posedge poweron) begin
						if(poweron) begin
								cur_state<=check;up_reg<=6'b000000;down_reg<=6'b000000;in_reg<=7'b0000000;up<=1'b0;down<=1'b0;
						end 
						else if(clk)
						
								cur_state<=next_state;
					
					end		
				always@(negedge(clk)) begin
						if((clk)==0)begin
								for (i=0;i<=6;i=i+1)					//for recording inside sensor requests
										if (pulse_in[i]==1)
												in_reg[i]<=1;
										else
																;
		
								for (i=0;i<=5;i=i+1)												// for recording up down requests
										if (pulse_up[i]==1)
													up_reg[i]<=1;
										else 
																	;
				
										if(pulse_down[i]==1)
													down_reg[i]<=1;
										else 
																	;
							end
							end		

endmodule
