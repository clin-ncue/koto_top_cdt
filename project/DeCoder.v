module DeCoder( clk, reset, tag, x, y, c, dv, array, waddr, raddr, done, mem_clr );

input wire clk;
input wire reset;
input wire [15:0] tag;
input wire [5:0] x;
input wire [5:0] y;
input wire c;
input wire dv;
output reg [38:0] array;
output reg [5:0] waddr;
output reg [5:0] raddr;
output reg mem_clr = 0;
    
reg self_reset = 0;    
reg start = 0;
output reg done = 0;
reg [5:0] irow = 0;


always @( posedge clk ) 
begin

	if(reset || self_reset)
	begin
		done = 0;
		start = 0;
		irow = 0;
		self_reset = 0;
		mem_clr = 0;
	end

	// srart
	if( tag==16'b1010101010101010 )
	begin
		waddr = 0;
		raddr = 0;
		array = 39'b101010101010101010101010101010101010101;
		done  = 1'b0;
		irow = 0;
		start = 1;
	end
	
	// done
	if( tag==16'b0101010101010101 )
	begin
		waddr = 40;
		raddr = 40;
		array = 39'b010101010101010101010101010101010101010;
		done  = 1'b1;
		irow  = 0;
		start = 0;
	end
	
	if(done==0 && tag!= 16'b1010101010101010 && tag != 16'b0101010101010101 && start == 1 ) 
	begin
		if(dv==1&&c==1)
		begin
			waddr = y+6'b1;
			raddr = y+6'b1;
			array = 39'b1 << x;
		end 
		else if(dv==1 && c == 0 && start == 1)
		begin
			waddr = 44;//y+6'b1; // find out why y+6'b1 will erase memory?
			raddr = 44;//y+6'b1;
			array = 39'b0;
		end
		else 
		begin
			waddr = 44;
			raddr = 44;
			array = 0;
		end
	end
	
	if(done==1 && tag!=16'b0101010101010101)
	begin
		if(irow>=0 && irow <= 40)
		begin
			array = 0;
			waddr = irow; // clear memory
			raddr = irow;
		end
		else if(irow>=41 && irow <=42)
		begin
			array = 0;
			waddr = irow; // clear memory
			raddr = 44;
		end
		else if(irow >= 43)
		begin
			done = 0;
			mem_clr = 1;
			self_reset = 1;
		end
		irow = irow + 6'b1;
	end
	
end // of always

endmodule
