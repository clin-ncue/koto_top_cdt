module GenPreTrigger(clk,rst,ene,ntrig,gap,mode,trigger,counter);

input wire clk;
input wire rst;
input wire ene;
input wire [15:0] ntrig;
input wire [15:0] gap;
input wire [2:0] mode;

output reg trigger;

//reg [7:0] gap_reg;
output reg [15:0] counter;
reg [15:0] ntrig_reg;
reg [511:0] pipeline;
reg send_pre = 1'b0;
reg send_L1 = 1'b0;
reg [3:0] count_pre = 4'b0;
reg [3:0] count_L1 = 4'b0;

always @( posedge clk)
begin

//	gap_reg = gap - 1'b1;

	if(rst)
	begin
		ntrig_reg = 16'b0;
		counter = 16'b0;
		pipeline = 512'b0;
	end

	pipeline = pipeline << 1;
	pipeline[0] = 1'b0;
	
	if( ene && ntrig_reg < ntrig )
	begin
		if(counter==gap)
		begin
			pipeline[0] = 1'b1;
			ntrig_reg = ntrig_reg + 1'b1;
			counter = 16'b0;
		end
		else 
		begin
			ntrig_reg = ntrig_reg;
		end
		counter = counter + 1'b1;
	end


	send_pre = (pipeline[5]==1'b1)? 1'b1:send_pre;
	send_L1 = (pipeline[330]==1'b1)? 1'b1:send_L1;


	if(send_pre)
	begin
		if(mode==0) // preL1
		begin
			if(count_pre==1) 	  trigger = 1'b1;
			else if(count_pre==2) trigger = 1'b1;
			else if(count_pre==3) trigger = 1'b1;
			else if(count_pre==4) trigger = 1'b0;
			else if(count_pre==5)
			begin
				count_pre = 4'b0;
				trigger = 1'b0;
				send_pre = 1'b0;
			end
		end
		else if(mode==1) // L1
		begin
			if(count_pre==1) 	  trigger = 1'b1;
			else if(count_pre==2) trigger = 1'b0;
			else if(count_pre==3) trigger = 1'b0;
			else if(count_pre==4) trigger = 1'b0;
			else if(count_pre==5)
			begin
				count_pre = 4'b0;
				trigger = 1'b0;
				send_pre = 1'b0;
			end
		end	
		else if(mode==2) // L1 w PS
		begin
			if(count_pre==1) 	  trigger = 1'b1;
			else if(count_pre==2) trigger = 1'b1;
			else if(count_pre==3) trigger = 1'b0;
			else if(count_pre==4) trigger = 1'b0;
			else if(count_pre==5)
			begin
				count_pre = 4'b0;
				trigger = 1'b0;
				send_pre = 1'b0;
			end
		end	
		else if(mode==3) // align
		begin
			if(count_pre==1) 	  trigger = 1'b1;
			else if(count_pre==2) trigger = 1'b0;
			else if(count_pre==3) trigger = 1'b1;
			else if(count_pre==4) trigger = 1'b0;
			else if(count_pre==5)
			begin
				count_pre = 4'b0;
				trigger = 1'b0;
				send_pre = 1'b0;
			end
		end		
		else if(mode==4) // Reset
		begin
			if(count_pre==1) 	  trigger = 1'b1;
			else if(count_pre==2) trigger = 1'b1;
			else if(count_pre==3) trigger = 1'b1;
			else if(count_pre==4) trigger = 1'b1;
			else if(count_pre==5)
			begin
				count_pre = 4'b0;
				trigger = 1'b0;
				send_pre = 1'b0;
			end
		end							
		
		count_pre = count_pre + 1'b1;
	end	
	
	
/*
	if(send_pre)
	begin
		if(count_pre>=1 && count_pre<=7 )
		begin
			trigger = 1'b1;
		end
		else if(count_pre==8)
		begin
			count_pre = 4'b0;
			trigger = 1'b0;
			send_pre = 1'b0;
		end
		
		count_pre = count_pre + 1'b1;
	end

	if(send_L1)
	begin
		if(count_L1>=1 && count_L1<=3 )
		begin
			trigger = 1'b1;
		end
		else if(count_L1==4)
		begin
			count_L1 = 4'b0;
			trigger = 1'b0;
			send_L1 = 1'b0;
		end
		
		count_L1 = count_L1 + 1'b1;
	end	
*/	
end

endmodule
