module test_bench_1();
reg g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2;
wire start,open_gate;
wire [2:0] level;
lift DUT(g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2,level,start,open_gate);
initial
begin
	clk <= 1'b1;
	g_1 <= 1'b0;
	f_0 <= 1'b0;
	f_1 <= 1'b0;
	s_0 <= 1'b0;
	s_1 <= 1'b0;
	t_0 <= 1'b0;
	c_0 <= 1'b0;
	p_0 <= 1'b0;
	p_1 <= 1'b0;
	top_0 <= 1'b0;
	in_0 <= 1'b0;
	in_1 <= 1'b0;
	in_3 <= 1'b0;
	in_4 <= 1'b0;
	in_5 <= 1'b0;
	in_6 <= 1'b0;
	sen_5 <= 1'b0;
	sen_6 <= 1'b0;
end
always
 begin
 #50
clk <= 1'b0; 
#50
clk <= 1'b1;
end

always @ (clk) 
begin
#2 clk_1 <= clk;
end

always @ (clk)
begin 
#4 clk_2 <= clk;
end

initial
begin
	
	gate_sen = 1'b0;
	#4400
	gate_sen =  1'b1;
	#800
	gate_sen =  1'b0;
	#4900
	gate_sen =  1'b1;
	#800
	gate_sen =  1'b0;
	#6100
	gate_sen =  1'b1;
	#800
	gate_sen =  1'b0;
	#2400
	gate_sen =  1'b1;
	#800
	gate_sen =  1'b0;	
	end 


initial
begin
	
	sen_0 = 1'b1;
	#1000
	sen_0 =  1'b0;
end

initial
begin
	
	sen_1 = 1'b0;
	#2000
	sen_1 =  1'b1;
	#200
	sen_1 =  1'b0;
end 

initial
begin
	
	sen_2 = 1'b0;
	#3200
	sen_2 =  1'b1;
	#200
	sen_2 =  1'b0;
	#16800
	sen_2 =  1'b1;
end 

initial
begin
	
	sen_3 = 1'b0;
	#4400
	sen_3 =  1'b1;
	#11600
	sen_3 =  1'b0;
	#3000
	sen_3 =  1'b1;
	#200
	sen_3 =  1'b0;
end 

initial
begin
	
	sen_4 = 1'b0;
	#17000
	sen_4 =  1'b1;
	#1000
	sen_4 =  1'b0;
end 

initial
begin
	
	in_2 = 1'b0;
	#14000
	in_2 =  1'b1;
	#200
	in_2 =  1'b0;
end 


initial
begin
	
	c_1 = 1'b0;
	#12000
	c_1 =  1'b1;
	#200
	c_1 =  1'b0;
end 

initial
begin
	
	t_1 = 1'b0;
	#600 
	t_1 = 1'b1;
	#200
	t_1 =  1'b0;
	#9200
	t_1 =  1'b1;
	#200
	t_1 =  1'b0;
end 


endmodule

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module test_bench_2();
reg g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2;
wire start,open_gate;
wire [2:0] level;
lift DUT(g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2,level,start,open_gate);

initial
begin
	clk <= 1'b1;
	g_1 <= 1'b0;
	f_0 <= 1'b0;
	f_1 <= 1'b0;
	s_0 <= 1'b0;
	c_0 <= 1'b0;
	c_1 <= 1'b0;
	p_1 <= 1'b0;
	top_0 <= 1'b0;
	in_1 <= 1'b0;
	in_2 <= 1'b0;
	in_5 <= 1'b0;
	in_6 <= 1'b0;
	sen_6 <= 1'b0;

end 
always
 begin
 #50
clk = 1'b0; 
#50
clk = 1'b1;
end

always @ (clk) 
begin
#2 clk_1 <= clk;
end

always @ (clk)
begin 
#4 clk_2 <= clk;
end

initial
begin
	
	gate_sen = 1'b0;
	#3200 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	#2400 
	gate_sen = 1'b1;
	# 800 
	gate_sen = 1'b0;
	#1200 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	#6000 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	#3600 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	#3700 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	#3200 
	gate_sen = 1'b1;
	#800 
	gate_sen = 1'b0;
	
	
end 


initial
begin
	
	sen_0 = 1'b1;
	#1000 
	sen_0 = 1'b0;
	 #14200 
	sen_0 = 1'b1;
	#1000 
	 sen_0 = 1'b0;
	
end 

initial
begin
	
	sen_1 = 1'b0;
	#2000 
	sen_1 = 1'b1;
	#200 
	sen_1 = 1'b0;
	#11800 
	sen_1 = 1'b1;
	#200 
	sen_1 = 1'b0;
	#3000 
	sen_1 = 1'b1;
	#200 
	sen_1 = 1'b0;
	
	
end 

initial
begin
	
	sen_2 = 1'b0;
	#3200 
	sen_2 = 1'b1;
	#1000 
	sen_2 = 1'b0;
	#8600 
	sen_2 = 1'b1;
	#200 
	sen_2 = 1'b0;
	#5400 
	sen_2 = 1'b1;
	#200 
	sen_2 = 1'b0;
	
end 

initial
begin
	
	sen_3 = 1'b0;
	#5200 
	sen_3 = 1'b1;
	#200 
	sen_3 = 1'b0;
	#6200 
	sen_3 = 1'b1;
	#200 
	sen_3 = 1'b0;
	#7800 
	sen_3 = 1'b1;

end 

initial
begin
	
	sen_4 = 1'b0;
	#6400 
	sen_4 = 1'b1;
	#1000 
	sen_4 = 1'b0;
	#3000 
	sen_4 = 1'b1;
	#200 
	sen_4 = 1'b0;
	
end 

initial
begin
	
	sen_5 = 1'b0;
	#8400 
	sen_5 = 1'b1;
	#1000 
	sen_5 = 1'b0;
	
end 

initial
begin
	
	s_1 = 1'b0;
	#600 
	s_1 = 1'b1;
	#200 
	s_1 = 1'b0;
	
end 

initial
begin
	
	p_0 = 1'b0;
	#5300 
	p_0 = 1'b1;
	#200 
	p_0 = 1'b0;
	
end 

initial
begin
	
	in_3 = 1'b0;
	#24000 
	in_3 = 1'b1;
	#200 
	in_3 = 1'b0;
end 

initial
begin
	in_4 = 1'b0;
	#3800 
	in_4 = 1'b1;
	#200 
	in_4 = 1'b0;
	
end 

initial
begin
	in_0 = 1'b0;
	#8600 
	in_0 = 1'b1;
	#200 
	in_0 = 1'b0;

end 

initial
begin
	t_0 = 1'b0;
	#28000 
	t_0 = 1'b1;
	#200 
	t_0 = 1'b0;
	
end 

initial
begin
	t_1 = 1'b0;
	#10000 
	t_1 = 1'b1;
	#200 
	t_1 = 1'b0;
	
end 
endmodule

//-------------------------------------------------------------------------------------------------------------------------------------------------------

module lift (g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2,level,start,open_gate);
input g_1,f_0,f_1,s_0,s_1,t_0,t_1,c_0,c_1,p_0,p_1,top_0,in_0,in_1,in_2,in_3,in_4,in_5,in_6,sen_0,sen_1,sen_2,sen_3,sen_4,sen_5,sen_6,gate_sen,clk,clk_1,clk_2;
output level;
output start,open_gate;
reg start,open_gate;
reg [2:0] level;
localparam STATE_init = 3'd0 ,
STATE_0 = 3'd1 ,
STATE_1 = 3'd2 ,
STATE_2 = 3'd3 ,
STATE_3 = 3'd4 ,
STATE_4 = 3'd5 ,
STATE_5 = 3'd6 ,
STATE_6 = 3'd7 ;
wire g_1_out,f_0_out,f_1_out,s_0_out,s_1_out,t_0_out,t_1_out,c_0_out,c_1_out,p_0_out,p_1_out,top_0_out;
wire in_ff_0,in_ff_1,in_ff_2,in_ff_3,in_ff_4,in_ff_5,in_ff_6;
wire out_ff_0,out_ff_1,out_ff_2,out_ff_3,out_ff_4,out_ff_5,out_ff_6;
reg pen_up,pen_down;
reg reset_g_1,reset_f_0,reset_f_1,reset_s_0,reset_s_1,reset_t_0,reset_t_1,reset_c_0,reset_c_1,reset_p_0,reset_p_1,reset_top_0;
reg reset_in_0,reset_in_1,reset_in_2,reset_in_3,reset_in_4,reset_in_5,reset_in_6;
reg ready_3,dir;
reg [2:0] cur_state = STATE_init;
reg [2:0] next_state ;

always @ (posedge clk) 
begin

case (cur_state) 
STATE_init : begin 
					reset_g_1 = 1'b1;			
					reset_f_1 = 1'b1;
					reset_f_0 = 1'b1;
					reset_s_0 = 1'b1;
					reset_s_1 = 1'b1;
					reset_t_0 = 1'b1;
					reset_t_1 = 1'b1;
					reset_c_0 = 1'b1;
					reset_c_1 = 1'b1;
					reset_p_0 = 1'b1;
					reset_p_1 = 1'b1;
					reset_top_0 = 1'b1;
					
					reset_in_0 = 1'b1;
					reset_in_1 = 1'b1;
					reset_in_2 = 1'b1;
					reset_in_3 = 1'b1;
					reset_in_4 = 1'b1;
					reset_in_5 = 1'b1;
					reset_in_6 = 1'b1;
					
					start = 1'b0;
					next_state = STATE_0;
					open_gate = 1'b0;
			end
STATE_0 :	begin
					if(sen_0 == 1'b1) begin
					
					level = 0;
					reset_g_1 = 1'b0;			
					reset_f_1 = 1'b0;
					reset_f_0 = 1'b0;
					reset_s_0 = 1'b0;
					reset_s_1 = 1'b0;
					reset_t_0 = 1'b0;
					reset_t_1 = 1'b0;
					reset_c_0 = 1'b0;
					reset_c_1 = 1'b0;
					reset_p_0 = 1'b0;
					reset_p_1 = 1'b0;
					reset_top_0 = 1'b0;
					
					reset_in_0 = 1'b0;
					reset_in_1 = 1'b0;
					reset_in_2 = 1'b0;
					reset_in_3 = 1'b0;
					reset_in_4 = 1'b0;
					reset_in_5 = 1'b0;
					reset_in_6 = 1'b0;
					
					
					if (in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_1 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
						if (dir == 1'b1) begin
							if (in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_1 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
								pen_up = 1'b1;
								start = 1'b1;
							
							end else begin
								pen_up = 1'b0;
								dir = 1'b0;
								next_state = STATE_0;
							end 
						end else begin
								dir = 1'b1;
								pen_down = 1'b0;
								next_state = STATE_0;
							end 
					end else begin 
						pen_down = 1'b0;
						pen_up = 1'b0;
						end 
						
					
					
					if(start == 1'b1 && dir == 1'b0 && (in_ff_0 == 1'b1 || (out_ff_0 == 1'b1 && g_1_out == 1'b1) || open_gate == 1'b1) ) begin
					reset_in_0 = 1'b1;
					reset_g_1 = 1'b1;
					open_gate = 1'b1;
					if(pen_up == 1'b1) begin
					if(gate_sen == 1'b1) begin
						open_gate = 1'b1;
						next_state = STATE_0;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_1;
						end 
					end else if(gate_sen == 1'b1) begin
						open_gate = 1'b1;
						end else begin
						open_gate = 1'b0;
						start = 1'b0;
						end
						next_state = STATE_0;
					end 
//----------------------------------------------------------------------------------------------------------------------------
					if(start == 1'b1 &&  dir == 1'b1 && (in_ff_0 == 1'b0 || (pen_up == 1'b1 && g_1_out == 1'b0))) begin
					reset_in_0 = 1'b1;
					if(gate_sen == 1'b1) begin
						open_gate = 1'b1;
						next_state = STATE_0;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_1;
						end 
					end 
//-----------------------------------------------------------------------------------------------------------------------------
					if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0) begin				
						if(out_ff_0 == 1'b1 || in_ff_0 == 1'b1 || open_gate == 1'b1) begin
						open_gate = 1'b1;
						reset_g_1 = 1'b1;
								reset_in_0 = 1'b1;
							if(gate_sen == 1'b1) begin
								open_gate = 1'b1;
								end else begin
 								//reset_g_1 = 1'b1;
								//reset_in_0 = 1'b1;
								open_gate = 1'b0;
								end
								end
								next_state = STATE_0;
								end
					
					end
					end

					
					
//------------------------------------------------------------------------------------FIRST FLOOR---------------------------------------------
   STATE_1 : begin 
				if(sen_1 == 1'b1) begin
					level = 1;
					reset_g_1 = 1'b0;
					reset_s_0 = 1'b0;
					reset_s_1 = 1'b0;
					
					reset_f_1 = 1'b0;
					reset_f_0 = 1'b0;
					reset_in_1 = 1'b0;
					reset_in_0 = 1'b0;
					reset_in_2 = 1'b0;
					
						if (in_ff_0 == 1'b1  || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_0 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
						if (dir == 1'b1) begin
							if (in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
								pen_up = 1'b1;
								start = 1'b1;
							end else begin
								pen_up = 1'b0;
								dir = 1'b0;
								next_state = STATE_1;		
								end 
						end else if(in_ff_0 == 1'b1 || out_ff_0 == 1'b1) begin
						pen_down = 1'b1;
						start = 1'b1;				
							end else begin
								dir = 1'b1;
								pen_down = 1'b0;
								next_state = STATE_1;					
								end
					end else begin
						pen_down = 1'b0;
						pen_up = 1'b0;
						end
					
					
//-------------------------------------------------------------------------------------------------------------------------------------------------------			
					if(start == 1'b1 && dir == 1'b1 && (in_ff_1 == 1'b1 || (out_ff_1 == 1'b1 && f_1_out == 1'b1) || open_gate == 1'b1) ) begin
					reset_in_1 = 1'b1;
					reset_f_1 = 1'b1;
					open_gate = 1'b1;
						if(pen_up == 1'b1) begin
							if(gate_sen == 1'b1) begin
								open_gate = 1'b1;
								next_state = STATE_1;
							end else begin
								open_gate = 1'b0;
								next_state = STATE_2;
								end 
							 end
						if(pen_up == 1'b0) begin
						if(gate_sen == 1'b1) begin
								open_gate = 1'b1;
							end else begin
								start = 1'b0;
								open_gate = 1'b0;
								end
							next_state = STATE_1;
						end
					end 

					if(start == 1'b1 && dir == 1'b1 && in_ff_1 == 1'b0 && (out_ff_1 == 1'b1 && f_0_out == 1'b1)) begin
					if(pen_up == 1'b1) begin
					if(gate_sen == 1'b1) begin
						open_gate = 1'b1;
						next_state = STATE_1;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_2;
						end 
					end else begin 
					reset_f_0 = 1'b1;
					open_gate = 1'b1;
					if(gate_sen == 1'b1) begin
						open_gate = 1'b1;
						end else begin
						open_gate = 1'b0;
						end
					next_state = STATE_1;
					end 
					end 
//-------------------------------------------------------------------------------------------------------------------------------------------	
					if(start == 1'b1 && dir == 1'b0 && (in_ff_1 == 1'b1 || (out_ff_1 == 1'b1 && f_0_out == 1'b1) || open_gate == 1'b1) ) begin
						reset_in_1 = 1'b1;
						reset_f_0 = 1'b1;
						open_gate = 1'b1;
						if(pen_down == 1'b1) begin
						if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_1;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_0;
						end
						end else begin 
						if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						end else begin
						open_gate = 1'b0;
						start = 1'b0;
						end
						next_state = STATE_1;
						end 
					end
					
					if(start == 1'b1 && dir == 1'b0 && in_ff_1 == 1'b0 && (out_ff_1 == 1'b1 && f_1_out == 1'b1)) begin
					if(pen_down == 1'b1) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_1;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_0;
						end
					end else begin 
					reset_f_1 = 1'b1;
					open_gate = 1'b1;
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						end else begin
						open_gate = 1'b0;
						end
					next_state = STATE_1;
					end 
					end
//----------------------------------------------------------------------------------------------------------------------------
					if(start == 1'b1 &&  dir == 1'b0 && (in_ff_1 == 1'b0 || (pen_down == 1'b1 && f_0_out == 1'b0))) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_1;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_0;
						end
					end 
					
					if(start == 1'b1 &&  dir == 1'b1 && (in_ff_1 == 1'b0 || (pen_up == 1'b1 && f_1_out == 1'b0))) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_1;
						end else begin
						open_gate = 1'b0;
						next_state = STATE_2;
						end
					end 
//---------------------------------------------------------------------------------------------------------------------------
					if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0)begin				
						if(out_ff_1 == 1'b1 || in_ff_1 == 1'b1 || open_gate == 1'b1)begin
						open_gate = 1'b1;
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						end else begin
						reset_f_1 = 1'b1;
						reset_f_0 = 1'b1;
						reset_in_1 = 1'b1;
						open_gate = 1'b0;
						end 
						end 
						next_state = STATE_1;
						end 
					end 
					end
//------------------------------------------------------------------------------------SECOND FLOOR-----------------------------------------------
   STATE_2 : begin
   if(sen_2 == 1'b1)begin
			level = 2;
			reset_f_0 = 1'b0;
			reset_f_1 = 1'b0;
			reset_t_0 = 1'b0;
			reset_t_1 = 1'b0;
			
			reset_s_1 = 1'b0;
			reset_s_0 = 1'b0;
			reset_in_2 = 1'b0;
			reset_in_1 = 1'b0;
			reset_in_3 = 1'b0;
			
			if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1  || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_0 == 1'b1 || out_ff_1 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
				if (dir == 1'b1) begin
					if (in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
						pen_up = 1'b1;
						start = 1'b1;
					end else begin 
						pen_up = 1'b0;
						dir = 1'b0;
						next_state = STATE_2;
					end
				end else if(in_ff_0 == 1'b1 || out_ff_0 == 1'b1 || in_ff_1 == 1'b1 || out_ff_1 == 1'b1  ) begin
				pen_down = 1'b1;
				start = 1'b1;
					end else begin 
						dir = 1'b1;
						pen_down = 1'b0;
						next_state = STATE_2;	
				end
			end else begin 
				pen_down = 1'b0;
				pen_up = 1'b0;
			end
			
//-------------------------------------------------------------------------------------------------------------------------------------------------------			
			if(start == 1'b1 && dir == 1'b1 && (in_ff_2 == 1'b1 || (out_ff_2 == 1'b1 && s_1_out == 1'b1) || open_gate == 1'b1) ) begin
			reset_in_2 = 1'b1;
			reset_s_1 = 1'b1;
			open_gate = 1'b1;
				if(pen_up == 1'b1) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_2;
					end else begin
						open_gate = 1'b0;
						next_state = STATE_3;
					end
					end
				if(pen_up == 1'b0) begin
				if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
					end else begin
						start = 1'b0;
						open_gate = 1'b0;
					end
					next_state = STATE_2;
				end
			end

			
			if(start == 1'b1 && dir == 1'b1 && in_ff_2 == 1'b0 && (out_ff_2 == 1'b1 && s_0_out == 1'b1)) begin
			if(pen_up == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_2;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_3;
				end
			end else begin 
			reset_s_0 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_2;
			end
			end
			
//-------------------------------------------------------------------------------------------------------------------------------------------	
			if(start == 1'b1 && dir == 1'b0 && (in_ff_2 == 1'b1 || (out_ff_2 == 1'b1 && s_0_out == 1'b1) || open_gate == 1'b1) ) begin
				reset_in_2 = 1'b1;
				reset_s_0 = 1'b1;
				open_gate = 1'b1;
				if(pen_down == 1'b1) begin
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_2;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_1;
				end
				end else begin 
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				start = 1'b0;
				end
				next_state = STATE_2;
				end
			end
			
			if(start == 1'b1 && dir == 1'b0 && in_ff_2 == 1'b0 && (out_ff_2 == 1'b1 && s_1_out == 1'b1)) begin
			if(pen_down == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_2;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_1;
				end
			end else begin 
			reset_s_1 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_2;
			end
			end
//----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b1 &&  dir == 1'b0 && (in_ff_2 == 1'b0 || (pen_down == 1'b1 && s_0_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_2;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_1;
				end
			end
			
			if(start == 1'b1 &&  dir == 1'b1 && (in_ff_2 == 1'b0 || (pen_up == 1'b1 && s_1_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_2;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_3;
				end
			end
//---------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0)begin				
				if(out_ff_2 == 1'b1 || in_ff_2 == 1'b1 || open_gate == 1'b1)begin
				open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				reset_s_1 = 1'b1;
				reset_s_0 = 1'b1;
				reset_in_2 = 1'b1;
				open_gate = 1'b0;
				end
				end
				next_state = STATE_2;
				end
			
			end		
			end
//---------------------------------------------------------------------------------THIRD FLOOR-------------------------------------------------
	STATE_3 : begin
	if(sen_3 == 1'b1)begin
			level = 3;
			reset_s_0 = 1'b0;
			reset_s_1 = 1'b0;
			reset_c_0 = 1'b0;
			reset_c_1 = 1'b0;
			
			reset_t_1 = 1'b0;
			reset_t_0 = 1'b0;
			reset_in_3 = 1'b0;
			reset_in_2 = 1'b0;
			reset_in_4 = 1'b0;

			if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1 || in_ff_2 == 1'b1 ||  in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_0 == 1'b1 || out_ff_1 == 1'b1 || out_ff_2 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
				
				if (dir == 1'b1) begin
					if (in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
						pen_up = 1'b1;
						start = 1'b1;
					end
					else begin 
						pen_up = 1'b0;
						dir = 1'b0;
						next_state = STATE_3;
					end
				end
				else if(in_ff_0 == 1'b1 || out_ff_0 == 1'b1 || in_ff_1 == 1'b1 || out_ff_1 == 1'b1 || in_ff_2 == 1'b1 || out_ff_2 == 1'b1 ) begin
				pen_down = 1'b1;
				start = 1'b1;
				ready_3 = 1'b1;
					end 
					else begin 
						dir = 1'b1;
						pen_down = 1'b0;
						next_state = STATE_3;		
				end
			end
			else begin 
				pen_down = 1'b0;
				pen_up = 1'b0;
				
			end
//-------------------------------------------------------------------------------------------------------------------------------------------------------			
			if(start == 1'b1 && dir == 1'b1 && (in_ff_3 == 1'b1 || (out_ff_3 == 1'b1 && t_1_out == 1'b1) || open_gate == 1'b1)  ) begin
			reset_in_3 = 1'b1;
			reset_t_1 = 1'b1;
			open_gate = 1'b1;
			//start = 1'b0;
				if(pen_up == 1'b1) begin
				
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_3;
					end
					else begin
						open_gate = 1'b0;
						//start = 1'b0;
						next_state = STATE_4;
					end
					end else begin
				if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
					end
					else begin
						start = 1'b0;
						open_gate = 1'b0;
					end
					next_state = STATE_3;
				end
			end

			
			if(start == 1'b1 && dir == 1'b1 && in_ff_3 == 1'b0 && (out_ff_3 == 1'b1 && t_0_out == 1'b1) ) begin
			if(pen_up == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_3;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_4;
				end
			end else begin 
			reset_t_0 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_3;
			end
			end
			
//-------------------------------------------------------------------------------------------------------------------------------------------	
			if(start == 1'b1 && dir == 1'b0 && (in_ff_3 == 1'b1 || (out_ff_3 == 1'b1 && t_0_out == 1'b1) || open_gate == 1'b1)  ) begin
				reset_in_3 = 1'b1;
				reset_t_0 = 1'b1;
				open_gate = 1'b1;
				if(pen_down == 1'b1) begin
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_3;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_2;
				end
				end else begin 
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				start = 1'b0;
				end
				next_state = STATE_3;
				end
			end
			
			if(start == 1'b1 && dir == 1'b0 && in_ff_3 == 1'b0 && (out_ff_3 == 1'b1 && t_1_out == 1'b1) ) begin
			if(pen_down == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_3;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_2;
				end
			end else begin 
			reset_t_1 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_3;
			end
			end
//----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b1 &&  dir == 1'b0 && (in_ff_3 == 1'b0 || (pen_down == 1'b1 && t_0_out == 1'b0)) ) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_3;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_2;
				end
			end
			
			if(start == 1'b1 &&  dir == 1'b1 && (in_ff_3 == 1'b0 || (pen_up == 1'b1 && t_1_out == 1'b0)) ) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_3;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_4;
				end
			end
//---------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0 )begin				
				if(out_ff_3 == 1'b1 || in_ff_3 == 1'b1 || open_gate == 1'b1)begin
				open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				reset_t_1 = 1'b1;
				reset_t_0 = 1'b1;
				reset_in_3 = 1'b1;
				open_gate = 1'b0;
				end
				end
				next_state = STATE_3;
				end

	end
	end
//---------------------------------------------------------------------------------------FOURTH FLOOR--------------------------------------------
STATE_4 : begin
	if(sen_4 == 1'b1) begin
			level = 4;
			reset_t_0 = 1'b0;
			reset_t_1 = 1'b0;
			reset_p_0 = 1'b0;
			reset_p_1 = 1'b0;
			
			reset_c_1 = 1'b0;
			reset_c_0 = 1'b0;
			reset_in_4 = 1'b0;
			reset_in_3 = 1'b0;
			reset_in_5 = 1'b0;
			
			if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1  || in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_0 == 1'b1 || out_ff_1 == 1'b1 || out_ff_3 == 1'b1 || out_ff_2 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
				if (dir == 1'b1) begin
					if (in_ff_5 == 1'b1 || in_ff_6 == 1'b1 || out_ff_5 == 1'b1 || out_ff_6 == 1'b1) begin
						pen_up = 1'b1;
						start = 1'b1;
					end else begin 
						pen_up = 1'b0;
						dir = 1'b0;
						next_state = STATE_4;		
					end
				end else if(in_ff_0 == 1'b1 || out_ff_0 == 1'b1 || in_ff_1 == 1'b1 || out_ff_1 == 1'b1 || in_ff_2 == 1'b1 || out_ff_2 == 1'b1 || in_ff_3 == 1'b1 || out_ff_3 == 1'b1  ) begin
				pen_down = 1'b1;
				start = 1'b1;				
					end else begin 
						dir = 1'b1;
						pen_down = 1'b0;
						next_state = STATE_4;					
				end
			end else begin 
				pen_down = 1'b0;
				pen_up = 1'b0;
			end
			
//-------------------------------------------------------------------------------------------------------------------------------------------------------			
			if(start == 1'b1 && dir == 1'b1 && (in_ff_4 == 1'b1 || (out_ff_4 == 1'b1 && c_1_out == 1'b1) || open_gate == 1'b1) ) begin
			reset_in_4 = 1'b1;
			reset_c_1 = 1'b1;
			open_gate = 1'b1;
				if(pen_up == 1'b1) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_4;
					end else begin
						open_gate = 1'b0;
						next_state = STATE_5;
					end
					end
				if(pen_up == 1'b0) begin
				if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
					end else begin
						start = 1'b0;
						open_gate = 1'b0;
					end
					next_state = STATE_4;
				end
			end

			
			if(start == 1'b1 && dir == 1'b1 && in_ff_4 == 1'b0 && (out_ff_4 == 1'b1 && c_0_out == 1'b1)) begin
			if(pen_up == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_4;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_5;
				end
			end else begin 
			reset_c_0 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_4;
			end
			end
			
//-------------------------------------------------------------------------------------------------------------------------------------------	
			if(start == 1'b1 && dir == 1'b0 && (in_ff_4 == 1'b1 || (out_ff_4 == 1'b1 && c_0_out == 1'b1) || open_gate == 1'b1) ) begin
				reset_in_4 = 1'b1;
				reset_c_0 = 1'b1;
				open_gate = 1'b1;
				if(pen_down == 1'b1) begin
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_4;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_3;
				end
				end else begin 
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				start = 1'b0;
				end
				next_state = STATE_4;
				end
			end
			
			if(start == 1'b1 && dir == 1'b0 && in_ff_4 == 1'b0 && (out_ff_4 == 1'b1 && c_1_out == 1'b1)) begin
			if(pen_down == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_4;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_3;
				end
			end else begin 
			reset_c_1 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_4;
			end
			end
//----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b1 &&  dir == 1'b0 && (in_ff_4 == 1'b0 || (pen_down == 1'b1 && c_0_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_4;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_3;
				end
			
			end
			
			if(start == 1'b1 &&  dir == 1'b1 && (in_ff_4 == 1'b0 || (pen_up == 1'b1 && c_1_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_4;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_5;
				end
		
			end
//---------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0)begin				
				if(out_ff_4 == 1'b1 || in_ff_4 == 1'b1 || open_gate == 1'b1)begin
				open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				reset_c_1 = 1'b1;
				reset_c_0 = 1'b1;
				reset_in_4 = 1'b1;
				open_gate = 1'b0;
				end
				end
				next_state = STATE_4;
				end
		end	
		end
//--------------------------------------------------------------------------------------------FIFTH FLOOR----------------------------------------			
STATE_5 : begin
	 if(sen_5 == 1'b1)begin
			level = 5;
			reset_c_0 = 1'b0;
			reset_c_1 = 1'b0;
			reset_top_0 = 1'b0;
			
			reset_p_1 = 1'b0;
			reset_p_0 = 1'b0;
			reset_in_5 = 1'b0;
			reset_in_4 = 1'b0;
			reset_in_6 = 1'b0;
			
			if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1  || in_ff_6 == 1'b1 || out_ff_0 == 1'b1 || out_ff_1 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_2 == 1'b1 || out_ff_6 == 1'b1) begin
				if (dir == 1'b1) begin
					if (in_ff_6 == 1'b1 || out_ff_6 == 1'b1) begin
						pen_up = 1'b1;
						start = 1'b1;			
					end else begin 
						pen_up = 1'b0;
						dir = 1'b0;
						next_state = STATE_5;
					end
				end else if(in_ff_0 == 1'b1 || out_ff_0 == 1'b1 || in_ff_1 == 1'b1 || out_ff_1 == 1'b1 || in_ff_2 == 1'b1 || out_ff_2 == 1'b1 || in_ff_3 == 1'b1 || out_ff_3 == 1'b1 || in_ff_4 == 1'b1 || out_ff_4 == 1'b1  ) begin
				pen_down = 1'b1;
				start = 1'b1;				
					end else begin 
						dir = 1'b1;
						pen_down = 1'b0;
						next_state = STATE_5;					
				end
			end else begin 
				pen_down = 1'b0;
				pen_up = 1'b0;
			end		
//-------------------------------------------------------------------------------------------------------------------------------------------------------			
			if(start == 1'b1 && dir == 1'b1 && (in_ff_5 == 1'b1 || (out_ff_5 == 1'b1 && p_1_out == 1'b1) || open_gate == 1'b1) ) begin
			reset_in_5 = 1'b1;
			reset_p_1 = 1'b1;
			open_gate = 1'b1;
				if(pen_up == 1'b1) begin
					if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
						next_state = STATE_5;
					end else begin
						open_gate = 1'b0;
						next_state = STATE_6;
					end
					end
				if(pen_up == 1'b0) begin
				if(gate_sen == 1'b1)begin
						open_gate = 1'b1;
					end else begin
						start = 1'b0;
						open_gate = 1'b0;
					end
					next_state = STATE_5;
				end
			end
			
			if(start == 1'b1 && dir == 1'b1 && in_ff_5 == 1'b0 && (out_ff_5 == 1'b1 && p_0_out == 1'b1)) begin
			if(pen_up == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_5;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_6;
				end
			end else begin 
			reset_p_0 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_5;
			end
			end		
//-------------------------------------------------------------------------------------------------------------------------------------------	
			if(start == 1'b1 && dir == 1'b0 && (in_ff_5 == 1'b1 || (out_ff_5 == 1'b1 && p_0_out == 1'b1) || open_gate == 1'b1) ) begin
				reset_in_5 = 1'b1;
				reset_p_0 = 1'b1;
				open_gate = 1'b1;
				if(pen_down == 1'b1) begin
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_5;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_4;
				end
				end else begin 
				if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				start = 1'b0;
				end
				next_state = STATE_5;
				end
			end
			
			if(start == 1'b1 && dir == 1'b0 && in_ff_5 == 1'b0 && (out_ff_5 == 1'b1 && p_1_out == 1'b1)) begin
			if(pen_down == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_5;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_4;
				end
			end else begin 
			reset_p_1 = 1'b1;
			open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				end
			next_state = STATE_5;
			end
			end
//----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b1 &&  dir == 1'b0 && (in_ff_5 == 1'b0 || (pen_down == 1'b1 && p_0_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_5;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_4;
				end		
			end
			
			if(start == 1'b1 &&  dir == 1'b1 && (in_ff_5 == 1'b0 || (pen_up == 1'b1 && p_1_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_5;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_6;
				end
			end
//---------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0)begin				
				if(out_ff_5 == 1'b1 || in_ff_5 == 1'b1 || open_gate == 1'b1)begin
				open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				reset_p_1 = 1'b1;
				reset_p_0 = 1'b1;
				reset_in_5 = 1'b1;
				open_gate = 1'b0;
				end
				end
				next_state = STATE_5;
				end
	 end 
end	 
//---------------------------------------------------------------------------------SIXTH FLOOR---------------------------------------------
STATE_6 : begin
	 if(sen_6 == 1'b1) begin
			level = 6;
			reset_top_0 = 1'b0;			
			reset_p_1 = 1'b0;
			reset_p_0 = 1'b0;
			reset_in_6 = 1'b0;
			reset_in_5 = 1'b0;
			
			if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1  || out_ff_1 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 || out_ff_0 == 1'b1) begin
				if (dir == 1'b0) begin
					if (in_ff_0 == 1'b1 || in_ff_1 == 1'b1 || in_ff_2 == 1'b1 || in_ff_3 == 1'b1 || in_ff_4 == 1'b1 || in_ff_5 == 1'b1 || out_ff_0 == 1'b1 || out_ff_1 == 1'b1 || out_ff_2 == 1'b1 || out_ff_3 == 1'b1 || out_ff_4 == 1'b1 || out_ff_5 == 1'b1 ) begin
						pen_down = 1'b1;
						start = 1'b1;			
					end else begin 
						pen_up = 1'b0;
						dir = 1'b0;
						next_state = STATE_6;
					end
				end else begin
						dir = 1'b0;
						pen_up = 1'b0;
						next_state = STATE_6;
				end
			end else begin 
				pen_down = 1'b0;
				pen_up = 1'b0;
			end
						
			if(start == 1'b1 && dir == 1'b1 && (in_ff_6 == 1'b1 || (out_ff_6 == 1'b1 && top_0_out == 1'b1) || open_gate == 1'b1) ) begin
			reset_in_6 = 1'b1;
			reset_top_0 = 1'b1;
			open_gate = 1'b1;
			if(pen_down == 1'b1) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_6;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_5;
				end
			end else if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				open_gate = 1'b0;
				start = 1'b0;
				end
			next_state = STATE_6;
			end	
//----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b1 &&  dir == 1'b0 && (in_ff_6 == 1'b0 || (pen_down == 1'b1 && top_0_out == 1'b0))) begin
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				next_state = STATE_6;
				end else begin
				open_gate = 1'b0;
				next_state = STATE_5;
				end
			end
//-----------------------------------------------------------------------------------------------------------------------------
			if(start == 1'b0 &&  pen_up == 1'b0 && pen_down == 1'b0)begin				
				if(out_ff_6 == 1'b1 || in_ff_6 == 1'b1 || open_gate == 1'b1)begin
				open_gate = 1'b1;
			if(gate_sen == 1'b1)begin
				open_gate = 1'b1;
				end else begin
				reset_top_0 = 1'b1;
				reset_in_6 = 1'b1;
				open_gate = 1'b0;
				end
				end
				next_state = STATE_6;
				end
			end
			end
endcase		

end

always @ (posedge clk)
begin

case (next_state)
	 STATE_init : begin
	
	cur_state = STATE_init;
end
	 STATE_0 : begin
	
	cur_state = STATE_0;
end	
	 STATE_1 : begin
	
	cur_state = STATE_1;
end	
	 STATE_2 : begin
	
	cur_state = STATE_2;
end	
	 STATE_3 : begin
	
	cur_state = STATE_3;
end	
	 STATE_4 : begin
	
	cur_state = STATE_4;
end
	 STATE_5 : begin
	
	cur_state = STATE_5;
end 
	 STATE_6 : begin
	
	cur_state = STATE_6;
end
endcase
end 

 call_reg call_g1(g_1,g_1_out,clk_1,reset_g_1);
 call_reg call_f0(f_0,f_0_out,clk_1,reset_f_0);
 call_reg  call_f1(f_1,f_1_out,clk_1,reset_f_1);
 call_reg  call_s0(s_0,s_0_out,clk_1,reset_s_0);
 call_reg  call_s1(s_1,s_1_out,clk_1,reset_s_1);
 call_reg  call_t0(t_0,t_0_out,clk_1,reset_t_0);
 call_reg  call_t1(t_1,t_1_out,clk_1,reset_t_1);
 call_reg  call_c0(c_0,c_0_out,clk_1,reset_c_0);
 call_reg  call_c1(c_1,c_1_out,clk_1,reset_c_1);
 call_reg  call_p0(p_0,p_0_out,clk_1,reset_p_0);
 call_reg  call_p1(p_1,p_1_out,clk_1,reset_p_1);
 call_reg  call_top0(top_0,top_0_out,clk_1,reset_top_0);

 call_reg  in_reg_1(in_0,in_ff_0,clk_1,reset_in_0);
 call_reg  in_reg_2(in_1,in_ff_1,clk_1,reset_in_1);
 call_reg  in_reg_3(in_2,in_ff_2,clk_1,reset_in_2);
 call_reg  in_reg_4(in_3,in_ff_3,clk_1,reset_in_3);
 call_reg  in_reg_5(in_4,in_ff_4,clk_1,reset_in_4);
 call_reg  in_reg_6(in_5,in_ff_5,clk_1,reset_in_5);
 call_reg  in_reg_7(in_6,in_ff_6,clk_1,reset_in_6);

 out_reg  out_reg_1(1'b0,g_1_out,clk_2,out_ff_0);
 out_reg  out_reg_2(f_0_out,f_1_out,clk_2,out_ff_1);
 out_reg  out_reg_3(s_0_out,s_1_out,clk_2,out_ff_2);
 out_reg  out_reg_4(t_0_out,t_1_out,clk_2,out_ff_3);
 out_reg  out_reg_5(c_0_out,c_1_out,clk_2,out_ff_4);
 out_reg  out_reg_6(p_0_out,p_1_out,clk_2,out_ff_5);
 out_reg  out_reg_7(top_0_out,1'b0,clk_2,out_ff_6);

endmodule

module call_reg (data_in,data_out,clk,reset);
input data_in,clk,reset;
output data_out;
reg data_out;
assign or_out = data_in | data_out;
always @ (posedge clk)
begin
if(reset == 1'b1) begin
data_out <= 1'b0;
end else begin
data_out <= or_out;
end
end
endmodule

module out_reg(data_in_0,data_in_1,clk,data_out);
input data_in_0, data_in_1,clk;
output data_out;
reg data_out;
wire or_out;
assign or_out = data_in_0 | data_in_1;
always @ (posedge clk)
begin
data_out <= or_out;
end
endmodule

