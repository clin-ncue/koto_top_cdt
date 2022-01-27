module SLVDS_R(clk,rst,in,dv,out);

input wire clk;
input wire rst;
input wire in;
output reg dv = 1'b0;
output reg [15:0] out;

reg [19:0] pipeline = 20'b11111111111111111111;
reg [19:0] pipeline_reg;
reg send = 1'b0;
reg [1:0] control = 0;
reg start = 1'b0;

always @(posedge clk)
begin

	if(rst)
	begin
		dv = 1'b0;
		pipeline = 20'b11111111111111111111;
		pipeline_reg = 20'b0;	
		control = 0;						
		out = 16'b0;
		send = 1'b0;
		start = 1'b0;
	end

	pipeline = pipeline >> 1;
	pipeline[19] = in;
	
	start = (pipeline==20'b00000000000000000000)? 1'b1:start;
	
	if(start)
	begin
		if(pipeline[0]==1'b1&&pipeline[1]==1'b1&&~send)
		begin
			send = 1'b1;
			pipeline_reg = pipeline;
			pipeline = 20'b00000000000000000000;
			control = 2'b00;
		end
		else
		begin
			send = send;
		end
	
		if(send)
		begin
			case(control)
				2'b00:
				begin
					dv = 1'b0;
					out = 16'b1010101010101010;
				end	
				2'b01:
				begin
					dv = 1'b1;
					out = pipeline_reg[17:2];
				end
				2'b10:
				begin
					dv = 1'b0;
					out = {14'b00000000000000,pipeline_reg[19:18]};
				end
				2'b11:
				begin
					dv = 1'b0;
					out = 16'b0;
					send = 1'b0;
				end
				default: 
				begin
					dv = 1'b0;
					out = 16'b0; 	
				end	
			endcase
			control = control + 1;
		end
	end 
	else
	begin
		dv = 1'b0;
		out = 16'b0;
	end
end

endmodule