module mapping_block (
clk         , // Clock Input
reset	,
fiber,
data_in        , // Data bi-directional
data_out         // Data bi-directional
); 


//--------------Input Ports----------------------- 
input clk;
input [15:0] data_in;
input reset;
input [24:0] fiber;
output reg [38:0] data_out;
reg [38:0] mem [38:0];
reg done = 0;
reg start = 0;
reg [5:0] irow;
//--------------Code Starts Here------------------ 
wire [5:0] x;
wire [5:0] y;
wire [5:0] addr;
wire c;
wire [14:13] dv;
wire [15:0] tag;


assign x = data_in[5:0];
assign y = data_in[11:6];
assign c = data_in[12];
assign dv[14:13] = data_in[14:13];
assign tag[15:0] = fiber[15:0];

assign addr[5:0] = irow[5:0];

integer i;
 
always @ (posedge clk)
begin : MEM_WRITE

	if(reset==1)
	begin
		start = 0;
		done = 0;
		irow = 61;
		data_out = 999;
		for(i=0;i<=38;i=i+1)
		begin
			mem[i] = 39'b0;
		end
	end

	// start 
	if( tag[15:0] == 16'b1010101010101010 ) 
	begin
		start = 1;
	end

	if( start ==1 && done == 0 && c == 1'b1 && dv == 2'b01 ) 
	begin
		mem[x][y] = 1'b1;
	end
	
	// end
	if( tag[15:0] == 16'b0101010101010101 )
	begin
		start = 0;
		done = 1;
		irow = 61;
	end
	
//end	
//endmodule
//always @ (posedge clk)
//begin : MEM_READ

	if (done == 1) 
	begin
		if(irow==63)
		begin
			data_out = 39'b101010101010101010101010101010101010101;
		end
		else if(irow>=0&&irow<=38)
		begin
			data_out = mem[irow];
		end
		else if(irow == 39 )
		begin
			data_out = 39'b010101010101010101010101010101010101010;	
		end
		else if(irow == 40 ) 
		begin
			data_out = 999;
			done = 0;
			irow = 61;
			for(i=0;i<=38;i=i+1)
			begin
				mem[i] = 39'b0;
			end
		end
		irow = irow + 1'b1;
	end
end
endmodule // End of Module ram_sp_sr_sw
