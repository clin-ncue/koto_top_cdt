module Simu_Trigger(clk,rst,PL1R_got,latency,ena,trigger);

input wire clk;
input wire rst;
input wire PL1R_got;
input wire [15:0] latency;
input wire ena;
output reg trigger;

reg [15:0] count = 0;
reg self_rst;
reg count_ena;

always @(posedge clk)
begin

	if(rst || self_rst)
	begin
		count = 0;
		count_ena = 0;
		self_rst = 0;
	end

	if(ena)
	begin
		count_ena = (PL1R_got==1)? 1:count_ena;

		if(count_ena)
		begin
		
			trigger = (count==latency)? 1'b1:1'b0;
			self_rst = (count==latency)? 1'b1:1'b0;
		
			count = count + 1'b1;
		end
		else 
		begin
		trigger = 1'b0;
		end
	end
	else 
	begin
		trigger = 1'b0;
	end

end


endmodule