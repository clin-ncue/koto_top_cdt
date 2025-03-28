module LVDS_RX_Debug(
	clk,
	rst,
	in,
	err_cnt
);

input wire clk;
input wire rst;
input wire in;

output reg [15:0] err_cnt = 16'hFFFF;

reg sena = 1'b0;
reg [17:0] pipeline = 18'b111111111111111111;

reg [15:0] value0;
reg [15:0] value1;
reg [1:0] ctrl = 2'b00;

always @(posedge clk)
begin

	if(rst)
	begin
		sena = 1'b0;
		pipeline = 18'b111111111111111111;
		ctrl = 2'b00;
		err_cnt = 16'hFFFF;
	end

	pipeline = pipeline >> 1;
	pipeline[17] = in;

	if(sena==1'b0 && pipeline==18'b000000000000000000)
	begin
		sena = 1'b1;
	end
	else
		sena = sena;
	
	if(sena)
	begin
		if(pipeline[1:0]==2'b11)
		begin
			value1 = value0;
			value0 = pipeline[17:2];
			pipeline[17:0] = 18'b000000000000000000;
			ctrl = (ctrl<2'b11)? ctrl + 1'b1 : ctrl;
			err_cnt = (ctrl==2'b10)? 16'h0000 : err_cnt;
			err_cnt = (ctrl==2'b11 && (value0-value1)!=1'b1 && err_cnt < 16'hFFFD)? err_cnt + 1'b1 : err_cnt;
		end	
	end

end

endmodule
