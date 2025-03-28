module debug_cabling(clk,rst,ena,ExpID,id0,id1,id2,id3,id_out0,id_out1,id_out2,id_out3,debug);

input wire clk;
input wire rst;
input wire ena;

input wire [4:0] ExpID;

input wire [4:0] id0;
input wire [4:0] id1;
input wire [4:0] id2;
input wire [4:0] id3;

output reg [4:0] id_out0;
output reg [4:0] id_out1;
output reg [4:0] id_out2;
output reg [4:0] id_out3;

output reg [3:0] debug;


always @(posedge clk)
begin
	
	if(rst)
	begin
		debug = 4'b0000;
		id_out0 = 5'b11111;
		id_out1 = 5'b11111;
		id_out2 = 5'b11111;
		id_out3 = 5'b11111;
	end
	
	if(ena)
	begin
		id_out0 = id0;
		id_out1 = id1;
		id_out2 = id2;
		id_out3 = id3;
		
		debug[0] = ( id0 != (ExpID + 2'b00))? 1:debug[0];
		debug[1] = ( id1 != (ExpID + 2'b01))? 1:debug[1];
		debug[2] = ( id2 != (ExpID + 2'b10))? 1:debug[2];
		debug[3] = ( id3 != (ExpID + 2'b11))? 1:debug[3];
	end
	

end

endmodule 
