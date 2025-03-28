module Input_Counter(clk,rst,live,trig,input_rate);

input wire clk;
input wire live;
input wire rst;
input wire trig;

output reg [31:0] input_rate;

reg [3:0] live_reg;
reg ena = 1'b0;

always @(posedge clk)
begin

	live_reg = live_reg << 1;
	live_reg[0] = live;
	
	if(rst)
	begin
		input_rate = 32'b0;
	end
	
	if(live_reg[3]==1'b0&&live_reg[2]==1'b0&&live_reg[1]==1'b1&&live_reg[0]==1'b1)
	begin
		input_rate = 32'b0;
	end
	
//	ena = (live_reg[3]==1'b0&&live_reg[2]==1'b0&&live_reg[1]==1'b1&&live_reg[0]==1'b1)? 1'b1:ena;
//	ena = (live_reg[3]==1'b1&&live_reg[2]==1'b1&&live_reg[1]==1'b0&&live_reg[0]==1'b0)? 1'b0:ena;
	
	if(live)
	begin
		input_rate = (trig==1'b1)? input_rate + 1'b1 : input_rate; 
	end
	
end

endmodule