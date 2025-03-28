module fiber_debug(clk,rst,ena,neq_one,debug);

input wire clk;
input wire rst;
input wire ena;
input wire neq_one;

output reg debug;

always @(posedge clk)
begin

	if(rst) 
	begin
		debug = 0;
	end

	if(ena)
	begin
		debug = (neq_one==1)?1:debug;

	end

end

endmodule