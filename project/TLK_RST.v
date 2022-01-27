module TLK_RST(clk,ena,live,TX_ER,TX_EN);


input wire clk;
input wire ena;
input wire live;

output reg TX_ER;
output reg TX_EN;

reg [3:0] live_reg = 4'b0000;
reg start = 1'b0;
reg [15:0] control = 0;
 

always @(posedge clk)
begin

	live_reg = live_reg << 1;
	live_reg[0] = live;

	if(live_reg[3]==1'b1 && live_reg[2]==1'b1 && live_reg[1]==1'b0 && live_reg[0]==1'b0)
	begin
		start = 1'b1;
		control = 0;
	end
	
	if(ena && start)
	begin
		
		if(control==500)
		begin
			TX_EN = 1'b1;
		end	
		else if(control==60000)
		begin
			TX_EN = 1'b0;
			TX_ER = 1'b0;
			start = 1'b0;
		end
		else
		begin	
			TX_EN = TX_EN;
			TX_ER = TX_ER;
			start = start;
		end
			
		control = control + 1'b1;
	end
	else
	begin
		TX_EN = 1'b0;
		TX_ER = 1'b0;
	end

end

endmodule