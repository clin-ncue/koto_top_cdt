module GenEventAddr(clk,rst,trigger,naddr,addr,rene);

input wire clk;
input wire rst;
input wire trigger;
input wire [7:0] naddr;
output reg [15:0] addr;
output reg rene;

reg [15:0] addr_reg;
reg send = 0;
reg [7:0] count;

always @(posedge clk)
begin
	if(rst)
	begin
		count = 8'b0;
		rene = 1'b0;
		addr_reg = 16'b0;
	end
	
	send = (trigger==1)?1'b1:send;
	
	if(send) 
	begin
		rene = 1'b1;
		addr = addr_reg;
		addr_reg = addr_reg + 1'b1;
		if(count==(naddr-1'b1)) 
		begin
			send = 0;
			count = 0;
		end
		count = count + 1'b1;
	end
	else
	begin
		rene = 1'b0;
		addr = 5119;
		count = 8'b0;
	end	
end

endmodule