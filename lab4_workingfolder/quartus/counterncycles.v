/*-------------------------
-- Author: Saurav Shandilya
-- Description: counter. Count upto a value provided using a variable "maxcount". Specifiy minumum number of bits required to represent the "maxcount" in "nbit". 
--					 counting happen at positive edge of clock.	After Maxcount is reached counter reset to 0 and restart in next clock if enable is kept high.
-- Example: If Maxcount = 10 then nbit should be 4 (as min. 4 bits are required to represent the number 10.)
-- Language: Verilog
-------------------------*/

module counterncycle
(
	clk,
	enable,
	reset,
	counterout
);

parameter 
nbit = 5,		// 5 bits are required for counter to count upto 30
maxcount = 30;	// maximum value upto which counter should count
		

input clk;
input enable;
input reset;

output [(nbit-1) : 0] counterout;

wire clk;
wire enable;
wire reset;

reg [(nbit-1) : 0] counterout;
reg [(nbit-1) : 0] tempcount;

always @ (posedge clk, posedge reset)
begin
  if (reset == 'd1) begin
    tempcount = 'd0;
  end
  
  else if (clk == 'd1) begin
		if (tempcount == maxcount) begin
			tempcount = 'd0;
		end	
		else if (enable == 'd1) begin
			tempcount = tempcount + 'd1;
		end	
  end
  counterout = tempcount;
end  

endmodule
