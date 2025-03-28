module Packing_CDT2(clk,reset,in0,in1,in2,crateID,out);

parameter buffsize = 64;

input wire clk;
input wire reset;

input wire [15:0] in0;
input wire [15:0] in1;
input wire [15:0] in2;
input wire [4:0] crateID;

output reg [15:0] out;

reg tag = 0;

reg [5:0] count;

reg [15:0] buff1 [buffsize-1:0];
reg [15:0] buff2 [buffsize-1:0];

parameter delay1 = 16;
parameter delay2 = 32;

integer i = 0;
	
always @(posedge clk)
begin

	if(reset==1)
	begin
		tag = 0;
	end
	
	for( i = buffsize-2; i >= 0; i=i-1 )
	begin
		buff1[i+1] = buff1[i];
		buff2[i+1] = buff2[i];
	end
	buff1[0] = in1;
	buff2[0] = in2;

	if(buff1[0]==16'b1010101010101010)
	begin
		count = 0;
		tag = 1;
	end
	
	if(tag==1)
	begin
		if(count >=0 && count <=16)
		begin
			out = in0;
		end
		else if(count>=17 && count <= 32)
		begin
			out = buff1[delay1];
		end
		else if(count >= 33 && count <=48 )
		begin
			out = buff2[delay2];
		end
		else if(count == 49)
		begin
			out = 16'b0101010101010101;
		end
		else if(count == 50)
		begin
			out[15:5] = 11'b0;
			out[4:0] = crateID[4:0];
		end
		else //if(count==50)
		begin
			out = 999;
			tag = 0;
		end
	
	end 
	else 
	begin
		out = 999;
	end	
	count = count+1'b1;
end

endmodule