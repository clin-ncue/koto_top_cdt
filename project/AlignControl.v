module AlignControl(clk,rst,in,out,waddr,wena,tag);

input wire clk;
input wire rst;
input wire [15:0] in;

output reg [15:0] out;
output reg wena;
output reg [4:0] waddr;
output reg tag;

reg [15:0] in_reg;

always @(posedge clk)
begin

	if(rst)
	begin
		wena = 0;
		out = 0;
		waddr = 6'b111111;
		tag = 0;
	end

	in_reg = in;
	
	wena = (in_reg == 16'b1010101010101010)? 1'b1:wena;
	
	if(wena)
	begin
		waddr = waddr + 1'b1;
		out = in_reg;
		wena = (waddr==17)? 0:wena;
		tag = (waddr==0)? 1:tag;
	end


end

endmodule