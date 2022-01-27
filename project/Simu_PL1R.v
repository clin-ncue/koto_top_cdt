module Simu_PL1R(clk,rst,ena,btw_PL1_PL1,trigger);

input wire clk;
input wire rst;
input wire ena;
input wire [15:0] btw_PL1_PL1;

output reg trigger;

reg [15:0] PL1_PL1;


reg self_rst = 0;
reg send_pl1 = 0;
reg [15:0] count = 0; 

always @(posedge clk)
begin
	
	if(rst || self_rst)
	begin
		PL1_PL1 = 0;
		count = 0;
		self_rst = 0;
		send_pl1 = 0;
	end
	
	if(ena)
	begin
		send_pl1 = (PL1_PL1==btw_PL1_PL1)? 1:send_pl1;
		
		if(send_pl1)
		begin	    
			if(count>=1&&count<=9)
			begin
				trigger = 1'b1;
			end 
			else if(count>=10)
			begin
				trigger = 1'b0;
				self_rst = 1;
			end
			else 
			begin
				trigger = 1'b0;
			end
			count = count+1'b1;
		end 
		else 
		begin
			trigger = 1'b0;
		end
		
		PL1_PL1 = PL1_PL1 + 1'b1;

	end 
	else 
		trigger = 1'b0;

end

endmodule