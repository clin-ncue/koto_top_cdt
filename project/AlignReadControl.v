module AlignReadControl(clk,rst,tag0,tag1,tag2,mask,raddr,rena,clear,switch);

input wire clk;
input wire rst;
input wire tag0;
input wire tag1;
input wire tag2;
input wire mask;

output reg [2:0] rena = 3'b000; 
output reg [4:0] raddr; 
output reg clear;
output reg [2:0] switch;

reg tag_and = 1'b0;
reg tag_and_previous = 1'b0;

reg [5:0] control = 0;
reg send = 1'b0;

always @(posedge clk)
begin

	if(rst || clear )
	begin
		raddr = 5'b11111;
		rena = 0;
		clear = 0;
		control = 0;
		switch = 0;
		send = 0;
	end
	
	tag_and_previous = tag_and;
	tag_and = (mask==0)? tag0 & tag1 & tag2 : tag0 & tag1;
	send = (tag_and&&~tag_and_previous)? 1:send;

	
	if(send)
	begin

		if(control == 0)
		begin
			rena = 3'b000;
			switch = 4;
			raddr = 0;
		end
		else if(control>=1&&control<=16)
		begin
			rena = 3'b001;
			raddr = raddr + 1'b1;
			switch = 1;
		end
		else if(control>=17&&control<=32)
		begin
			raddr = (control==17)? 0:raddr;
			rena = 3'b010;
			raddr = raddr + 1'b1;
			switch = 2;
		end	
		else if(control>=33&&control<=48)
		begin
			if(mask==0)
			begin
				raddr = (control==33)? 0:raddr;
				rena = 3'b100;
				raddr = raddr + 1'b1;
				switch = 3;
			end
			else
			begin
				rena = 3'b000;
				switch = 6;
			end
		end		
		else if(control==49)
		begin
			rena = 3'b000;
			switch = 5;
			clear = 1'b1;
		end

		control = control + 1'b1;

	/*
		raddr = raddr + 1'b1;
		rena = (raddr==19)? 0:rena;
		clear = (raddr==19)? 1:clear;
	*/	
	end
end

endmodule