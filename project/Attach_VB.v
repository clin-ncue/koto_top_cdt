module Attach_VB(clk,rst,vb,cb,out);

input wire clk;
input wire rst;
input wire [15:0] vb;
input wire [15:0] cb;

output reg [15:0] out = 16'b0;

reg [6:0] abandon = 7'b0;
reg [6:0] control_vb = 7'b0000000;
reg [6:0] control_cb = 7'b0000000;
reg [15:0] mem_vb [15:0];

reg store_vb = 1'b0;
reg send = 1'b0;
reg vb_got = 1'b0;
reg cb_got = 1'b0;

reg srst = 1'b0;

always @(posedge clk)
begin

	if(rst || srst)
	begin
		abandon = 7'b0;
		control_cb = 7'b0000000;
		control_vb = 7'b0000000;
		store_vb = 1'b0;
		vb_got = 1'b0;
		cb_got = 1'b0;
		send = 1'b0;
		srst = 1'b0;
	end
	
	
	abandon = (vb_got)? abandon+1'b1:abandon; 
	srst = (abandon==95)? 1'b1 : srst;
	
	// VB
	if( vb[15:0] == 16'b1010101010101010 )
	begin
		store_vb = 1'b1;
		vb_got = 1'b1;
	end
	else
	begin
		store_vb = store_vb;
	end
	
	if(store_vb)
	begin
	    if(control_vb >= 1 && control_vb <= 16)
	    begin
			mem_vb[control_vb-1'b1] = vb[15:0];
	    end
	    else if(control_vb==17)
	    begin
			store_vb = 1'b0;
		end
		control_vb = (store_vb)? control_vb + 1'b1 : control_vb;
	end
	else 
	begin
		control_vb = 7'b0000000;
	end
	
	
	// CB
	//if( cb[15:0] == 16'b1010101010101010 && vb_got )
	if( cb[15:0] == 16'b1010101010101010 )
	begin
		send = 1'b1;
	end
	else
	begin
		send = send;
	end
	
	// Send 
	if(send)
	begin
		if( control_cb >= 0 && control_cb <= 49 )
		begin
			out[15:0] = cb[15:0];
		end
		else if( control_cb >= 50 && control_cb <= 65 )
		begin
			if(vb_got)
			begin
				out[15:0] = mem_vb[control_cb-50];
			end
			else
			begin
				out[15:0] = 16'b0000000000000000;
			end
		end
		else if( control_cb == 66)
		begin
			out[15:0] = 16'b0101010101010100;
		end
		else if( control_cb == 67)
		begin
			out[15:0] = 0;
			srst = 1'b1;
		end
		control_cb = control_cb + 1'b1;
	end		
	else
	begin
		control_cb = 7'b0000000;
	end
end	

endmodule
