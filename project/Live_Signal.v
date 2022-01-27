module Live_Signal(clk,live);

input wire clk;
output reg live;

reg [21:0] counter = 22'b0;

always @(posedge clk)
begin
	
	if(counter==0)
	begin
		live = 1'b0;
	end
	else
	begin
		live = 1'b1;
	end
	
	counter = counter + 1'b1;
	
end

endmodule
