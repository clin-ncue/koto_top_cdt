module Alignment(clk,reset,mask,in0,in1,in2,inputID,out0,out1,out2,debug,crateID0,crateID1,crateID2);

parameter buffersize = 64;

input wire clk;
input wire reset;
input wire mask;

input wire [15:0] in0;
input wire [15:0] in1;
input wire [15:0] in2;
input wire [4:0] inputID;

output reg [15:0] out0;
output reg [15:0] out1;
output reg [15:0] out2;
output reg [5:0] debug;

reg [buffersize-1:0] p0;
reg [buffersize-1:0] p1;
reg [buffersize-1:0] p2;
reg [buffersize-1:0] p_or;

reg tag0 = 0;
reg tag1 = 0;
reg tag2 = 0;
reg tag_or = 0;

reg [15:0] buf0 [buffersize-1:0];
reg [15:0] buf1 [buffersize-1:0];
reg [15:0] buf2 [buffersize-1:0];

reg self_reset = 0;
reg [4:0] isend;

output reg [4:0] crateID0;
output reg [4:0] crateID1;
output reg [4:0] crateID2;

integer i;

always @(posedge clk)
begin

	
	if(reset)
	begin
		debug = 0;
	end

	if(reset == 1 || self_reset == 1) 
	begin

		tag0 = 0;
		tag1 = 0;
		tag2 = 0;
		tag_or = 0;
		p0 = 0;
		p1 = 0;
		p2 = 0;
		p_or = 0;
		self_reset = 0;
		isend = 0;
		out0 = 999;
		out1 = 999;
		out2 = 999;
	end

	
	for(i=buffersize-2;i>=0;i=i-1)
	begin
		buf0[i+1] = buf0[i];
		buf1[i+1] = buf1[i];
		buf2[i+1] = buf2[i];
	end
	
	buf0[0] = in0;
	buf1[0] = in1;
	buf2[0] = (mask==0)?in2:in1;

	if(buf0[0]==16'b1010101010101010)
	begin
		p0 = 0; 
		tag0 = 1;
	end
	
	if(buf1[0]==16'b1010101010101010)
	begin
		p1 = 0; 
		tag1 = 1;
	end	
	
	if(buf2[0]==16'b1010101010101010)
	begin
		p2 = 0; 
		tag2 = 1;
	end	
	
	// debugging
    tag_or = tag0 || tag1 || tag2;

    if(tag_or)
    begin
		p_or = p_or+1;
	end
	
	if(p_or==buffersize-1)
	begin
		debug[0] = (tag0==1)? debug[0]:1'b1;
		debug[1] = (tag1==1)? debug[1]:1'b1;
		debug[2] = (tag2==1)? debug[2]:1'b1;
		debug[2] = (mask==0)? debug[2]:1'b0;
	end
	// end of debugging
		
	if(tag0==1&&tag1==1&&tag2==1)
	begin
		if(isend==0)
		begin
			out0 = buf0[p0];
			out1 = buf1[p1];
			out2 = buf2[p2];
		end	
		else if(isend>=1&&isend<=16)
		begin
			out0 = buf0[p0];
			out1 = buf1[p1];		
			out2 = (mask==0)?buf2[p2]:16'b0;
		end	
		else if(isend==17)
		begin
			out0 = buf0[p0];
			out1 = buf1[p1];
			out2 = buf2[p2];		
		end
		else if(isend==18)
		begin
			crateID0[4:0] = buf0[p0][4:0];
			crateID1[4:0] = buf1[p1][4:0];
			crateID2[4:0] = buf2[p2][4:0];
			/*
			out0[15:5] = 11'b0;
			out1[15:5] = 11'b0;
			out2[15:5] = 11'b0;
			out0[4:0] = crateID0[4:0];
			out1[4:0] = crateID1[4:0];
			out2[4:0] = crateID2[4:0];
			*/
			debug[3] = (crateID0==(inputID+2'b00))? debug[3]:1;
			debug[4] = (crateID1==(inputID+2'b01))? debug[4]:1;
			debug[5] = (crateID2==(inputID+2'b10))? debug[5]:1;
			debug[5] = (mask==0)? debug[5]:0;
//			out0 = 999;
//			out1 = 999;
//			out2 = 999;
			out0 = buf0[p0];
			out1 = buf1[p1];
			out2 = buf2[p2];			
		end
		else if(isend==19)
		begin
			crateID0 = 0;
			crateID1 = 0;
			crateID2 = 0;
			out0 = 999;
			out1 = 999;
			out2 = 999;						
			self_reset = 1;
		end
		//if(out0==16'b0101010101010101 || out1==16'b0101010101010101 || out2==16'b0101010101010101 )
		//begin
		//	self_reset = 1;
		//end
		isend = isend + 1'b1;
	end
	else 
	begin
		p0 = p0+1;
		p1 = p1+1;
		p2 = p2+1;
		out0 = 999;
		out1 = 999;
		out2 = 999;
	end

	
end
endmodule

