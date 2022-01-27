module trigger_delay(clk,in,delay,out);

input wire clk;

input wire in;
input wire [7:0] delay;
output reg out;

reg [255:0] pipeline = 256'b0;



always @(posedge clk)
begin
	
	pipeline = pipeline << 1;
	pipeline[0] = in;
	out = pipeline[delay];
	
end

endmodule