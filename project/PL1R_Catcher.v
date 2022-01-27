module PL1R_Catcher(clk,rst,DigIn,PL1R_got);

input wire clk;
input wire rst;
input wire DigIn;
output reg PL1R_got;


reg [3:0] counter;
reg srst = 1'b0;

always @( posedge clk )
begin

	if(rst || srst)
	begin
		counter = 0;
		PL1R_got = 1'b0;
		srst = 1'b0;
	end
	
	if(DigIn==1'b1)
	begin
		counter = counter + 1'b1;
	end
	else
	begin
		PL1R_got = (counter>=7)? 1'b1:1'b0;
		srst = (PL1R_got)? 1'b1:1'b0;
		counter = 4'b0000;
	end

end

endmodule