module LiveRatio(clk,live,trig_got,evt_got,rst,n_in,n_out);

input wire clk;
input wire live;
input wire trig_got;
input wire evt_got;
input wire rst;

output reg [31:0] n_in;
output reg [31:0] n_out;

reg [299:0] trig_pipeline = 300'b0;

reg [3:0] live_reg;
reg ena = 1'b0;

always @(posedge clk)
begin

	if(rst)
	begin
		n_in = 32'b0;
		n_out = 32'b0;
	end
	
	live_reg = live_reg << 1;
	live_reg[0] = live;

	trig_pipeline = trig_pipeline << 1;
	trig_pipeline[0] = trig_got;
	
	if(live_reg[3]==1'b0&&live_reg[2]==1'b0&&live_reg[1]==1'b1&&live_reg[0]==1'b1)
	begin
		n_in = 32'b0;
		n_out = 32'b0;
	end
	
//	ena = (live_reg[3]==1'b0&&live_reg[2]==1'b0&&live_reg[1]==1'b1&&live_reg[0]==1'b1)? 1'b1:ena;
//	ena = (live_reg[3]==1'b1&&live_reg[2]==1'b1&&live_reg[1]==1'b0&&live_reg[0]==1'b0)? 1'b0:ena;
	
	if(live)
	begin
		n_in = (trig_pipeline[220]==1'b1)? n_in+1'b1:n_in;
		n_out = (evt_got==1'b1)? n_out+1'b1:n_out;
	end

	

end

endmodule