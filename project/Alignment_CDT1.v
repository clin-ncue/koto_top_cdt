module Alignment_CDT1(clk,reset,in00,in01,in02,in03,in04,in05,in06,in07,in08,in09,in10,in11,in12,in13,in14,in15,mask,abandon,bypass_evtid,
out00,out01,out02,out03,out04,out05,out06,out07,out08,out09,out10,out11,out12,out13,out14,out15,out_to_CDT2);

input wire clk;
input wire reset;


input wire [15:0] in00;
input wire [15:0] in01;
input wire [15:0] in02;
input wire [15:0] in03;
input wire [15:0] in04;
input wire [15:0] in05;
input wire [15:0] in06;
input wire [15:0] in07;
input wire [15:0] in08;
input wire [15:0] in09;
input wire [15:0] in10;
input wire [15:0] in11;
input wire [15:0] in12;
input wire [15:0] in13;
input wire [15:0] in14;
input wire [15:0] in15;
input wire [15:0] mask;
input wire [7:0] abandon;
input wire bypass_evtid;

output reg [15:0] out00;
output reg [15:0] out01;
output reg [15:0] out02;
output reg [15:0] out03;
output reg [15:0] out04;
output reg [15:0] out05;
output reg [15:0] out06;
output reg [15:0] out07;
output reg [15:0] out08;
output reg [15:0] out09;
output reg [15:0] out10;
output reg [15:0] out11;
output reg [15:0] out12;
output reg [15:0] out13;
output reg [15:0] out14;
output reg [15:0] out15;
output reg [15:0] out_to_CDT2;


wire [15:0] cbit00;
wire [15:0] cbit01;
wire [15:0] cbit02;
wire [15:0] cbit03;
wire [15:0] cbit04;
wire [15:0] cbit05;
wire [15:0] cbit06;
wire [15:0] cbit07;
wire [15:0] cbit08;
wire [15:0] cbit09;
wire [15:0] cbit10;
wire [15:0] cbit11;
wire [15:0] cbit12;
wire [15:0] cbit13;
wire [15:0] cbit14;
wire [15:0] cbit15;

wire [3:0] evt00;
wire [3:0] evt01;
wire [3:0] evt02;
wire [3:0] evt03;
wire [3:0] evt04;
wire [3:0] evt05;
wire [3:0] evt06;
wire [3:0] evt07;
wire [3:0] evt08;
wire [3:0] evt09;
wire [3:0] evt10;
wire [3:0] evt11;
wire [3:0] evt12;
wire [3:0] evt13;
wire [3:0] evt14;
wire [3:0] evt15;

wire tag00;
wire tag01;
wire tag02;
wire tag03;
wire tag04;
wire tag05;
wire tag06;
wire tag07;
wire tag08;
wire tag09;
wire tag10;
wire tag11;
wire tag12;
wire tag13;
wire tag14;
wire tag15;

reg tag_and;
reg tag_or;
reg same_evt;

reg self_rst;
reg rst_buff = 0;

BUFFER _buffer00(clk,mask[0],rst_buff,in00,cbit00,evt00,tag00);
BUFFER _buffer01(clk,mask[1],rst_buff,in01,cbit01,evt01,tag01);
BUFFER _buffer02(clk,mask[2],rst_buff,in02,cbit02,evt02,tag02);
BUFFER _buffer03(clk,mask[3],rst_buff,in03,cbit03,evt03,tag03);
BUFFER _buffer04(clk,mask[4],rst_buff,in04,cbit04,evt04,tag04);
BUFFER _buffer05(clk,mask[5],rst_buff,in05,cbit05,evt05,tag05);
BUFFER _buffer06(clk,mask[6],rst_buff,in06,cbit06,evt06,tag06);
BUFFER _buffer07(clk,mask[7],rst_buff,in07,cbit07,evt07,tag07);
BUFFER _buffer08(clk,mask[8],rst_buff,in08,cbit08,evt08,tag08);
BUFFER _buffer09(clk,mask[9],rst_buff,in09,cbit09,evt09,tag09);
BUFFER _buffer10(clk,mask[10],rst_buff,in10,cbit10,evt10,tag10);
BUFFER _buffer11(clk,mask[11],rst_buff,in11,cbit11,evt11,tag11);
BUFFER _buffer12(clk,mask[12],rst_buff,in12,cbit12,evt12,tag12);
BUFFER _buffer13(clk,mask[13],rst_buff,in13,cbit13,evt13,tag13);
BUFFER _buffer14(clk,mask[14],rst_buff,in14,cbit14,evt14,tag14);
BUFFER _buffer15(clk,mask[15],rst_buff,in15,cbit15,evt15,tag15);

reg [4:0] control = 0;
reg [7:0] cnt_abandon = 8'b11111111;
reg send = 0;

always @(posedge clk)
begin

	if(reset || self_rst)
	begin
		tag_or = 0;
		tag_and = 0;
		control = 0;
		out_to_CDT2 = 0;
		rst_buff = 0;
		send = 0;
		self_rst = 0;
		cnt_abandon = 8'b11111111;
	end
		
	tag_and = 1'b1;	
	tag_and = (mask[0]==0)?  tag_and & tag00 : tag_and;
	tag_and = (mask[1]==0)?  tag_and & tag01 : tag_and;
	tag_and = (mask[2]==0)?  tag_and & tag02 : tag_and;
	tag_and = (mask[3]==0)?  tag_and & tag03 : tag_and;
	tag_and = (mask[4]==0)?  tag_and & tag04 : tag_and;
	tag_and = (mask[5]==0)?  tag_and & tag05 : tag_and;
	tag_and = (mask[6]==0)?  tag_and & tag06 : tag_and;
	tag_and = (mask[7]==0)?  tag_and & tag07 : tag_and;
	tag_and = (mask[8]==0)?  tag_and & tag08 : tag_and;
	tag_and = (mask[9]==0)?  tag_and & tag09 : tag_and;
	tag_and = (mask[10]==0)? tag_and & tag10 : tag_and;
	tag_and = (mask[11]==0)? tag_and & tag11 : tag_and;
	tag_and = (mask[12]==0)? tag_and & tag12 : tag_and;
	tag_and = (mask[13]==0)? tag_and & tag13 : tag_and;
	tag_and = (mask[14]==0)? tag_and & tag14 : tag_and;
	tag_and = (mask[15]==0)? tag_and & tag15 : tag_and;
	
	tag_or = 0;
	tag_or = (mask[0]==0)? tag_or | tag00 : tag_or; 
	tag_or = (mask[1]==0)? tag_or | tag01 : tag_or; 
	tag_or = (mask[2]==0)? tag_or | tag02 : tag_or; 
	tag_or = (mask[3]==0)? tag_or | tag03 : tag_or; 
	tag_or = (mask[4]==0)? tag_or | tag04 : tag_or; 
	tag_or = (mask[5]==0)? tag_or | tag05 : tag_or; 
	tag_or = (mask[6]==0)? tag_or | tag06 : tag_or; 
	tag_or = (mask[7]==0)? tag_or | tag07 : tag_or; 
	tag_or = (mask[8]==0)? tag_or | tag08 : tag_or; 
	tag_or = (mask[9]==0)? tag_or | tag09 : tag_or; 
	tag_or = (mask[10]==0)? tag_or | tag10 : tag_or; 
	tag_or = (mask[11]==0)? tag_or | tag11 : tag_or; 
	tag_or = (mask[12]==0)? tag_or | tag12 : tag_or; 
	tag_or = (mask[13]==0)? tag_or | tag13 : tag_or; 
	tag_or = (mask[14]==0)? tag_or | tag14 : tag_or; 
	tag_or = (mask[15]==0)? tag_or | tag15 : tag_or; 
	
	same_evt = 1'b1;
	same_evt = (mask[0]==1'b0  && mask[1]==1'b0)?  same_evt && (evt00 == evt01): same_evt;
	same_evt = (mask[1]==1'b0  && mask[2]==1'b0)?  same_evt && (evt01 == evt02): same_evt;
	same_evt = (mask[2]==1'b0  && mask[3]==1'b0)?  same_evt && (evt02 == evt03): same_evt;
	same_evt = (mask[3]==1'b0  && mask[4]==1'b0)?  same_evt && (evt03 == evt04): same_evt;
	same_evt = (mask[4]==1'b0  && mask[5]==1'b0)?  same_evt && (evt04 == evt05): same_evt;
	same_evt = (mask[5]==1'b0  && mask[6]==1'b0)?  same_evt && (evt05 == evt06): same_evt;
	same_evt = (mask[6]==1'b0  && mask[7]==1'b0)?  same_evt && (evt06 == evt07): same_evt;
	same_evt = (mask[7]==1'b0  && mask[8]==1'b0)?  same_evt && (evt07 == evt08): same_evt;
	same_evt = (mask[8]==1'b0  && mask[9]==1'b0)?  same_evt && (evt08 == evt09): same_evt;
	same_evt = (mask[9]==1'b0  && mask[10]==1'b0)? same_evt && (evt09 == evt10): same_evt;
	same_evt = (mask[10]==1'b0 && mask[11]==1'b0)? same_evt && (evt10 == evt11): same_evt;
	same_evt = (mask[11]==1'b0 && mask[12]==1'b0)? same_evt && (evt11 == evt12): same_evt;
	same_evt = (mask[12]==1'b0 && mask[13]==1'b0)? same_evt && (evt12 == evt13): same_evt;
	same_evt = (mask[13]==1'b0 && mask[14]==1'b0)? same_evt && (evt13 == evt14): same_evt;
	same_evt = (mask[14]==1'b0 && mask[15]==1'b0)? same_evt && (evt14 == evt15): same_evt;
	
	same_evt = (bypass_evtid==1'b1)? 1'b1:same_evt;

	if(tag_or==1'b1&&tag_and!=1'b1)
	begin
		cnt_abandon = cnt_abandon + 1'b1;
		if(cnt_abandon==abandon)
		begin
			rst_buff = 1'b1;
			self_rst = 1'b1;
		end
	end
	else 
	begin
		cnt_abandon = 8'b11111111;
	end
	
	
	if(tag_and==1'b1)
	begin
		if(same_evt==1'b1)	
		begin
			send = 1'b1;
		end
		else
		begin
			send = 1'b0;
			rst_buff = 1'b1;
			self_rst = 1'b1;
		end
	end
	begin
		send = send;
	end
	
	if(send)
	begin
		case(control)
			5'b00000: 
				begin
					out_to_CDT2 = 16'b1010101010101010;
					out00 = 16'b1010101010101010;
					out01 = 16'b1010101010101010;
					out02 = 16'b1010101010101010;
					out03 = 16'b1010101010101010;
					out04 = 16'b1010101010101010;
					out05 = 16'b1010101010101010;
					out06 = 16'b1010101010101010;
					out07 = 16'b1010101010101010;
					out08 = 16'b1010101010101010;
					out09 = 16'b1010101010101010;
					out10 = 16'b1010101010101010;
					out11 = 16'b1010101010101010;
					out12 = 16'b1010101010101010;
					out13 = 16'b1010101010101010;
					out14 = 16'b1010101010101010;
					out15 = 16'b1010101010101010;
				end
			5'b00001: 
				begin
					out_to_CDT2 = cbit00;
					out00 = cbit00;
					out01 = cbit01;
					out02 = cbit02;
					out03 = cbit03;
					out04 = cbit04;
					out05 = cbit05;
					out06 = cbit06;
					out07 = cbit07;
					out08 = cbit08;
					out09 = cbit09;
					out10 = cbit10;
					out11 = cbit11;
					out12 = cbit12;
					out13 = cbit13;
					out14 = cbit14;
					out15 = cbit15;
				end
			5'b00010:
				begin
					out_to_CDT2 = cbit01;
					out00[3:0] = evt00[3:0]; out00[15:4] = 12'b0;
					out01[3:0] = evt01[3:0]; out01[15:4] = 12'b0;
					out02[3:0] = evt02[3:0]; out02[15:4] = 12'b0;
					out03[3:0] = evt03[3:0]; out03[15:4] = 12'b0;
					out04[3:0] = evt04[3:0]; out04[15:4] = 12'b0;
					out05[3:0] = evt05[3:0]; out05[15:4] = 12'b0;
					out06[3:0] = evt06[3:0]; out06[15:4] = 12'b0;
					out07[3:0] = evt07[3:0]; out07[15:4] = 12'b0;
					out08[3:0] = evt08[3:0]; out08[15:4] = 12'b0;
					out09[3:0] = evt09[3:0]; out09[15:4] = 12'b0;
					out10[3:0] = evt10[3:0]; out10[15:4] = 12'b0;
					out11[3:0] = evt11[3:0]; out11[15:4] = 12'b0;
					out12[3:0] = evt12[3:0]; out12[15:4] = 12'b0;
					out13[3:0] = evt13[3:0]; out13[15:4] = 12'b0;
					out14[3:0] = evt14[3:0]; out14[15:4] = 12'b0;
					out15[3:0] = evt15[3:0]; out15[15:4] = 12'b0;	
				end	
			5'b00011: 
				begin
					out_to_CDT2 = cbit02;
					out00 = 16'b0;
					out01 = 16'b0;
					out02 = 16'b0;
					out03 = 16'b0;
					out04 = 16'b0;
					out05 = 16'b0;
					out06 = 16'b0;
					out07 = 16'b0;
					out08 = 16'b0;
					out09 = 16'b0;
					out10 = 16'b0;
					out11 = 16'b0;
					out12 = 16'b0;
					out13 = 16'b0;
					out14 = 16'b0;
					out15 = 16'b0;
				end	
			5'b00100: out_to_CDT2 = cbit03;
			5'b00101: out_to_CDT2 = cbit04;
			5'b00110: out_to_CDT2 = cbit05;
			5'b00111: out_to_CDT2 = cbit06;
			5'b01000: out_to_CDT2 = cbit07;
			5'b01001: out_to_CDT2 = cbit08;
			5'b01010: out_to_CDT2 = cbit09;
			5'b01011: out_to_CDT2 = cbit10;
			5'b01100: out_to_CDT2 = cbit11;
			5'b01101: out_to_CDT2 = cbit12;
			5'b01110: out_to_CDT2 = cbit13;
			5'b01111: out_to_CDT2 = cbit14;
			5'b10000: 
				begin
					out_to_CDT2 = cbit15;
					rst_buff = 1;
				end
			5'b10001: 
				begin
					out_to_CDT2 = 16'b0101010101010101;
					self_rst = 1;
				end
		endcase
			
		control = control + 1'b1;
	end 
	else
	begin
		out_to_CDT2 = 16'b0000000000000000;
	end
				

end

endmodule


module BUFFER(clk,mask,rst,in,cbit,evt,tag);

input wire clk;
input wire mask;
input wire rst;
input wire [15:0] in;
output reg [15:0] cbit = 0;
output reg [3:0] evt = 0;
output reg tag = 0;

reg [1:0] control;
reg ena = 0;
reg [15:0] in_reg;

always @(posedge clk)
begin
	if(rst) 
	begin
		control = 2'b00;
		cbit = 0;
		evt = 0;
		ena = 0;
		tag = 0;
	end

	in_reg = in;

	if( in_reg == 16'b1010101010101010 && ena == 0 ) 
	begin
		ena = 1;
		control = 2'b00;
	end
	
	if(ena)
	begin
		case(control)
			2'b01: cbit = in_reg;
			2'b10: 
				begin
					evt[3:0] = in_reg[3:0]; 
					tag = 1;
					ena = 0;
				end
		endcase	
		control = control + 1'b1;
	end

	evt = (mask==1'b0)? evt:4'b0;
	cbit = (mask==1'b0)? cbit:16'b0;
end

endmodule
