module csi_mapping (clk,reset,fiber0,fiber1,fiber2,fiber3, 
f0ch00,f0ch01,f0ch02,f0ch03,f0ch04,f0ch05,f0ch06,f0ch07,f0ch08,f0ch09,f0ch10,f0ch11,f0ch12,f0ch13,f0ch14,f0ch15,
f1ch00,f1ch01,f1ch02,f1ch03,f1ch04,f1ch05,f1ch06,f1ch07,f1ch08,f1ch09,f1ch10,f1ch11,f1ch12,f1ch13,f1ch14,f1ch15,
f2ch00,f2ch01,f2ch02,f2ch03,f2ch04,f2ch05,f2ch06,f2ch07,f2ch08,f2ch09,f2ch10,f2ch11,f2ch12,f2ch13,f2ch14,f2ch15,
f3ch00,f3ch01,f3ch02,f3ch03,f3ch04,f3ch05,f3ch06,f3ch07,f3ch08,f3ch09,f3ch10,f3ch11,f3ch12,f3ch13,f3ch14,f3ch15,
array_out0, array_out1, array_out2, array_out3,
array_row00,array_row01,array_row02,array_row03,array_row04,array_row05,array_row06,array_row07,array_row08,array_row09,
array_row10,array_row11,array_row12,array_row13,array_row14,array_row15,array_row16,array_row17,array_row18,array_row19,
array_row20,array_row21,array_row22,array_row23,array_row24,array_row25,array_row26,array_row27,array_row28,array_row29,
array_row30,array_row31,array_row32,array_row33,array_row34,array_row35,array_row36,array_row37,array_row38,array_tag
);


parameter mapsize = 38;
parameter nch = 16;

//parameter mapsize = 5;

input wire clk;
input wire reset;

input wire [24:0] fiber0;
input wire [24:0] fiber1;
input wire [24:0] fiber2;
input wire [24:0] fiber3;

input wire [15:0] f0ch00; 
input wire [15:0] f0ch01;
input wire [15:0] f0ch02;
input wire [15:0] f0ch03;
input wire [15:0] f0ch04;
input wire [15:0] f0ch05;
input wire [15:0] f0ch06;
input wire [15:0] f0ch07;
input wire [15:0] f0ch08;
input wire [15:0] f0ch09;
input wire [15:0] f0ch10;
input wire [15:0] f0ch11;
input wire [15:0] f0ch12;
input wire [15:0] f0ch13;
input wire [15:0] f0ch14;
input wire [15:0] f0ch15;

input wire [15:0] f1ch00; 
input wire [15:0] f1ch01;
input wire [15:0] f1ch02;
input wire [15:0] f1ch03;
input wire [15:0] f1ch04;
input wire [15:0] f1ch05;
input wire [15:0] f1ch06;
input wire [15:0] f1ch07;
input wire [15:0] f1ch08;
input wire [15:0] f1ch09;
input wire [15:0] f1ch10;
input wire [15:0] f1ch11;
input wire [15:0] f1ch12;
input wire [15:0] f1ch13;
input wire [15:0] f1ch14;
input wire [15:0] f1ch15;

input wire [15:0] f2ch00; 
input wire [15:0] f2ch01;
input wire [15:0] f2ch02;
input wire [15:0] f2ch03;
input wire [15:0] f2ch04;
input wire [15:0] f2ch05;
input wire [15:0] f2ch06;
input wire [15:0] f2ch07;
input wire [15:0] f2ch08;
input wire [15:0] f2ch09;
input wire [15:0] f2ch10;
input wire [15:0] f2ch11;
input wire [15:0] f2ch12;
input wire [15:0] f2ch13;
input wire [15:0] f2ch14;
input wire [15:0] f2ch15;

input wire [15:0] f3ch00; 
input wire [15:0] f3ch01;
input wire [15:0] f3ch02;
input wire [15:0] f3ch03;
input wire [15:0] f3ch04;
input wire [15:0] f3ch05;
input wire [15:0] f3ch06;
input wire [15:0] f3ch07;
input wire [15:0] f3ch08;
input wire [15:0] f3ch09;
input wire [15:0] f3ch10;
input wire [15:0] f3ch11;
input wire [15:0] f3ch12;
input wire [15:0] f3ch13;
input wire [15:0] f3ch14;
input wire [15:0] f3ch15;


reg [mapsize:0] array0 [mapsize:0];// [15:0];
reg [mapsize:0] array1 [mapsize:0];// [15:0];
reg [mapsize:0] array2 [mapsize:0];// [15:0];
reg [mapsize:0] array3 [mapsize:0];// [15:0];
//reg [mapsize:0] array_sum  [mapsize:0];



output reg [mapsize:0] array_out0;
output reg [mapsize:0] array_out1;
output reg [mapsize:0] array_out2;
output reg [mapsize:0] array_out3;

output reg [mapsize:0] array_row00;
output reg [mapsize:0] array_row01;
output reg [mapsize:0] array_row02;
output reg [mapsize:0] array_row03;
output reg [mapsize:0] array_row04;
output reg [mapsize:0] array_row05;
output reg [mapsize:0] array_row06;
output reg [mapsize:0] array_row07;
output reg [mapsize:0] array_row08;
output reg [mapsize:0] array_row09;
output reg [mapsize:0] array_row10;
output reg [mapsize:0] array_row11;
output reg [mapsize:0] array_row12;
output reg [mapsize:0] array_row13;
output reg [mapsize:0] array_row14;
output reg [mapsize:0] array_row15;
output reg [mapsize:0] array_row16;
output reg [mapsize:0] array_row17;
output reg [mapsize:0] array_row18;
output reg [mapsize:0] array_row19;
output reg [mapsize:0] array_row20;
output reg [mapsize:0] array_row21;
output reg [mapsize:0] array_row22;
output reg [mapsize:0] array_row23;
output reg [mapsize:0] array_row24;
output reg [mapsize:0] array_row25;
output reg [mapsize:0] array_row26;
output reg [mapsize:0] array_row27;
output reg [mapsize:0] array_row28;
output reg [mapsize:0] array_row29;
output reg [mapsize:0] array_row30;
output reg [mapsize:0] array_row31;
output reg [mapsize:0] array_row32;
output reg [mapsize:0] array_row33;
output reg [mapsize:0] array_row34;
output reg [mapsize:0] array_row35;
output reg [mapsize:0] array_row36;
output reg [mapsize:0] array_row37;
output reg [mapsize:0] array_row38;

output reg [mapsize:0] array_tag;

reg f0_done = 0;
reg f1_done = 0;
reg f2_done = 0;
reg f3_done = 0;
reg all_done = 0;

reg [5:0] irow = 0;
reg self_reset = 0;
wire [5:0] test;

wire [5:0] 	x0 [15:0];
wire [5:0] 	y0 [15:0];
wire [15:0] c0;
wire [1:0] 	dv0 [15:0];

wire [5:0] 	x1 [15:0];
wire [5:0] 	y1 [15:0];
wire [15:0] c1;
wire [1:0] 	dv1 [15:0];

wire [5:0] 	x2 [15:0];
wire [5:0] 	y2 [15:0];
wire [15:0] c2;
wire [1:0] 	dv2 [15:0];

wire [5:0] 	x3 [15:0];
wire [5:0] 	y3 [15:0];
wire [15:0] c3;
wire [1:0] 	dv3 [15:0];

assign test[5:0] = irow[5:0];

assign x0[0] 	= f0ch00[5:0];		
assign y0[0] 	= f0ch00[11:6];
assign c0[0] 	= f0ch00[12];
assign dv0[0] 	= f0ch00[14:13];
assign x0[1] 	= f0ch01[5:0];		
assign y0[1] 	= f0ch01[11:6];
assign c0[1] 	= f0ch01[12];
assign dv0[1] 	= f0ch01[14:13];
assign x0[2] 	= f0ch02[5:0];		
assign y0[2] 	= f0ch02[11:6];
assign c0[2] 	= f0ch02[12];
assign dv0[2] 	= f0ch02[14:13];	
assign x0[3] 	= f0ch03[5:0];		
assign y0[3] 	= f0ch03[11:6];
assign c0[3] 	= f0ch03[12];
assign dv0[3] 	= f0ch03[14:13];	
assign x0[4] 	= f0ch04[5:0];		
assign y0[4] 	= f0ch04[11:6];
assign c0[4] 	= f0ch04[12];
assign dv0[4] 	= f0ch04[14:13];	
assign x0[5] 	= f0ch05[5:0];		
assign y0[5] 	= f0ch05[11:6];
assign c0[5] 	= f0ch05[12];
assign dv0[5] 	= f0ch05[14:13];	
assign x0[6] 	= f0ch06[5:0];		
assign y0[6] 	= f0ch06[11:6];
assign c0[6] 	= f0ch06[12];
assign dv0[6] 	= f0ch06[14:13];	
assign x0[7] 	= f0ch07[5:0];		
assign y0[7] 	= f0ch07[11:6];
assign c0[7] 	= f0ch07[12];
assign dv0[7] 	= f0ch07[14:13];	
assign x0[8] 	= f0ch08[5:0];		
assign y0[8] 	= f0ch08[11:6];
assign c0[8] 	= f0ch08[12];
assign dv0[8] 	= f0ch08[14:13];	
assign x0[9] 	= f0ch09[5:0];		
assign y0[9] 	= f0ch09[11:6];
assign c0[9] 	= f0ch09[12];
assign dv0[9] 	= f0ch09[14:13];	
assign x0[10] 	= f0ch10[5:0];		
assign y0[10] 	= f0ch10[11:6];
assign c0[10] 	= f0ch10[12];
assign dv0[10] 	= f0ch10[14:13];	
assign x0[11] 	= f0ch11[5:0];		
assign y0[11] 	= f0ch11[11:6];
assign c0[11] 	= f0ch11[12];
assign dv0[11] 	= f0ch11[14:13];	
assign x0[12] 	= f0ch12[5:0];		
assign y0[12] 	= f0ch12[11:6];
assign c0[12] 	= f0ch12[12];
assign dv0[12] 	= f0ch12[14:13];	
assign x0[13] 	= f0ch13[5:0];		
assign y0[13] 	= f0ch13[11:6];
assign c0[13] 	= f0ch13[12];
assign dv0[13] 	= f0ch13[14:13];	
assign x0[14] 	= f0ch14[5:0];		
assign y0[14] 	= f0ch14[11:6];
assign c0[14] 	= f0ch14[12];
assign dv0[14] 	= f0ch14[14:13];	
assign x0[15] 	= f0ch15[5:0];		
assign y0[15] 	= f0ch15[11:6];
assign c0[15] 	= f0ch15[12];
assign dv0[15] 	= f0ch15[14:13];	

assign x1[0] 	= f1ch00[5:0];
assign y1[0] 	= f1ch00[11:6];
assign c1[0] 	= f1ch00[12];
assign dv1[0] 	= f1ch00[14:13];
assign x1[1] 	= f1ch01[5:0];
assign y1[1] 	= f1ch01[11:6];
assign c1[1] 	= f1ch01[12];
assign dv1[1] 	= f1ch01[14:13];
assign x1[2] 	= f1ch02[5:0];
assign y1[2] 	= f1ch02[11:6];
assign c1[2] 	= f1ch02[12];
assign dv1[2] 	= f1ch02[14:13];
assign x1[3] 	= f1ch03[5:0];
assign y1[3] 	= f1ch03[11:6];
assign c1[3] 	= f1ch03[12];
assign dv1[3] 	= f1ch03[14:13];
assign x1[4] 	= f1ch04[5:0];
assign y1[4] 	= f1ch04[11:6];
assign c1[4] 	= f1ch04[12];
assign dv1[4] 	= f1ch04[14:13];
assign x1[5] 	= f1ch05[5:0];
assign y1[5] 	= f1ch05[11:6];
assign c1[5] 	= f1ch05[12];
assign dv1[5] 	= f1ch05[14:13];
assign x1[6] 	= f1ch06[5:0];
assign y1[6] 	= f1ch06[11:6];
assign c1[6] 	= f1ch06[12];
assign dv1[6] 	= f1ch06[14:13];
assign x1[7] 	= f1ch07[5:0];
assign y1[7] 	= f1ch07[11:6];
assign c1[7] 	= f1ch07[12];
assign dv1[7] 	= f1ch07[14:13];
assign x1[8] 	= f1ch08[5:0];
assign y1[8] 	= f1ch08[11:6];
assign c1[8] 	= f1ch08[12];
assign dv1[8] 	= f1ch08[14:13];
assign x1[9] 	= f1ch09[5:0];
assign y1[9] 	= f1ch09[11:6];
assign c1[9] 	= f1ch09[12];
assign dv1[9] 	= f1ch09[14:13];
assign x1[10] 	= f1ch10[5:0];
assign y1[10] 	= f1ch10[11:6];
assign c1[10] 	= f1ch10[12];
assign dv1[10] 	= f1ch10[14:13];
assign x1[11] 	= f1ch11[5:0];
assign y1[11] 	= f1ch11[11:6];
assign c1[11] 	= f1ch11[12];
assign dv1[11] 	= f1ch11[14:13];
assign x1[12] 	= f1ch12[5:0];
assign y1[12] 	= f1ch12[11:6];
assign c1[12] 	= f1ch12[12];
assign dv1[12] 	= f1ch12[14:13];
assign x1[13] 	= f1ch13[5:0];
assign y1[13] 	= f1ch13[11:6];
assign c1[13] 	= f1ch13[12];
assign dv1[13] 	= f1ch13[14:13];
assign x1[14] 	= f1ch14[5:0];
assign y1[14] 	= f1ch14[11:6];
assign c1[14] 	= f1ch14[12];
assign dv1[14] 	= f1ch14[14:13];
assign x1[15] 	= f1ch15[5:0];
assign y1[15] 	= f1ch15[11:6];
assign c1[15] 	= f1ch15[12];
assign dv1[15] 	= f1ch15[14:13];

assign x2[0] 	= f2ch00[5:0];
assign y2[0] 	= f2ch00[11:6];
assign c2[0] 	= f2ch00[12];
assign dv2[0] 	= f2ch00[14:13];
assign x2[1] 	= f2ch01[5:0];
assign y2[1] 	= f2ch01[11:6];
assign c2[1] 	= f2ch01[12];
assign dv2[1] 	= f2ch01[14:13];
assign x2[2] 	= f2ch02[5:0];
assign y2[2] 	= f2ch02[11:6];
assign c2[2] 	= f2ch02[12];
assign dv2[2] 	= f2ch02[14:13];
assign x2[3] 	= f2ch03[5:0];
assign y2[3] 	= f2ch03[11:6];
assign c2[3] 	= f2ch03[12];
assign dv2[3] 	= f2ch03[14:13];
assign x2[4] 	= f2ch04[5:0];
assign y2[4] 	= f2ch04[11:6];
assign c2[4] 	= f2ch04[12];
assign dv2[4] 	= f2ch04[14:13];
assign x2[5] 	= f2ch05[5:0];
assign y2[5] 	= f2ch05[11:6];
assign c2[5] 	= f2ch05[12];
assign dv2[5] 	= f2ch05[14:13];
assign x2[6] 	= f2ch06[5:0];
assign y2[6] 	= f2ch06[11:6];
assign c2[6] 	= f2ch06[12];
assign dv2[6] 	= f2ch06[14:13];
assign x2[7] 	= f2ch07[5:0];
assign y2[7] 	= f2ch07[11:6];
assign c2[7] 	= f2ch07[12];
assign dv2[7] 	= f2ch07[14:13];
assign x2[8] 	= f2ch08[5:0];
assign y2[8] 	= f2ch08[11:6];
assign c2[8] 	= f2ch08[12];
assign dv2[8] 	= f2ch08[14:13];
assign x2[9] 	= f2ch09[5:0];
assign y2[9] 	= f2ch09[11:6];
assign c2[9] 	= f2ch09[12];
assign dv2[9] 	= f2ch09[14:13];
assign x2[10] 	= f2ch10[5:0];
assign y2[10] 	= f2ch10[11:6];
assign c2[10] 	= f2ch10[12];
assign dv2[10] 	= f2ch10[14:13];
assign x2[11] 	= f2ch11[5:0];
assign y2[11] 	= f2ch11[11:6];
assign c2[11] 	= f2ch11[12];
assign dv2[11] 	= f2ch11[14:13];
assign x2[12] 	= f2ch12[5:0];
assign y2[12] 	= f2ch12[11:6];
assign c2[12] 	= f2ch12[12];
assign dv2[12] 	= f2ch12[14:13];
assign x2[13] 	= f2ch13[5:0];
assign y2[13] 	= f2ch13[11:6];
assign c2[13] 	= f2ch13[12];
assign dv2[13] 	= f2ch13[14:13];
assign x2[14] 	= f2ch14[5:0];
assign y2[14] 	= f2ch14[11:6];
assign c2[14] 	= f2ch14[12];
assign dv2[14] 	= f2ch14[14:13];
assign x2[15] 	= f2ch15[5:0];
assign y2[15] 	= f2ch15[11:6];
assign c2[15] 	= f2ch15[12];
assign dv2[15] 	= f2ch15[14:13];

assign x3[0] 	= f3ch00[5:0];
assign y3[0] 	= f3ch00[11:6];
assign c3[0] 	= f3ch00[12];
assign dv3[0] 	= f3ch00[14:13];
assign x3[1] 	= f3ch01[5:0];
assign y3[1] 	= f3ch01[11:6];
assign c3[1] 	= f3ch01[12];
assign dv3[1] 	= f3ch01[14:13];
assign x3[2] 	= f3ch02[5:0];
assign y3[2] 	= f3ch02[11:6];
assign c3[2] 	= f3ch02[12];
assign dv3[2] 	= f3ch02[14:13];
assign x3[3] 	= f3ch03[5:0];
assign y3[3] 	= f3ch03[11:6];
assign c3[3] 	= f3ch03[12];
assign dv3[3] 	= f3ch03[14:13];
assign x3[4] 	= f3ch04[5:0];
assign y3[4] 	= f3ch04[11:6];
assign c3[4] 	= f3ch04[12];
assign dv3[4] 	= f3ch04[14:13];
assign x3[5] 	= f3ch05[5:0];
assign y3[5] 	= f3ch05[11:6];
assign c3[5] 	= f3ch05[12];
assign dv3[5] 	= f3ch05[14:13];
assign x3[6] 	= f3ch06[5:0];
assign y3[6] 	= f3ch06[11:6];
assign c3[6] 	= f3ch06[12];
assign dv3[6] 	= f3ch06[14:13];
assign x3[7] 	= f3ch07[5:0];
assign y3[7] 	= f3ch07[11:6];
assign c3[7] 	= f3ch07[12];
assign dv3[7] 	= f3ch07[14:13];
assign x3[8] 	= f3ch08[5:0];
assign y3[8] 	= f3ch08[11:6];
assign c3[8] 	= f3ch08[12];
assign dv3[8] 	= f3ch08[14:13];
assign x3[9] 	= f3ch09[5:0];
assign y3[9] 	= f3ch09[11:6];
assign c3[9] 	= f3ch09[12];
assign dv3[9] 	= f3ch09[14:13];
assign x3[10] 	= f3ch10[5:0];
assign y3[10] 	= f3ch10[11:6];
assign c3[10] 	= f3ch10[12];
assign dv3[10] 	= f3ch10[14:13];
assign x3[11] 	= f3ch11[5:0];
assign y3[11] 	= f3ch11[11:6];
assign c3[11] 	= f3ch11[12];
assign dv3[11] 	= f3ch11[14:13];
assign x3[12] 	= f3ch12[5:0];
assign y3[12] 	= f3ch12[11:6];
assign c3[12] 	= f3ch12[12];
assign dv3[12] 	= f3ch12[14:13];
assign x3[13] 	= f3ch13[5:0];
assign y3[13] 	= f3ch13[11:6];
assign c3[13] 	= f3ch13[12];
assign dv3[13] 	= f3ch13[14:13];
assign x3[14] 	= f3ch14[5:0];
assign y3[14] 	= f3ch14[11:6];
assign c3[14] 	= f3ch14[12];
assign dv3[14] 	= f3ch14[14:13];
assign x3[15] 	= f3ch15[5:0];
assign y3[15] 	= f3ch15[11:6];
assign c3[15] 	= f3ch15[12];
assign dv3[15] 	= f3ch15[14:13];


always @(posedge clk)
begin
	
	// initilization
	integer i, j, ich, ifiber;
	
	if(reset==1 || self_reset==1) 
		begin

			f0_done = 0;
			f1_done = 0;
			f2_done = 0;
			f3_done = 0;
			all_done = 0;
			array_row00 = 999;
			array_row01 = 999;
			array_row02 = 999;
			array_row03 = 999;
			array_row04 = 999;
			array_row05 = 999;
			array_row06 = 999;
			array_row07 = 999;
			array_row08 = 999;
			array_row09 = 999;
			array_row10 = 999;
			array_row11 = 999;
			array_row12 = 999;
			array_row13 = 999;
			array_row14 = 999;
			array_row15 = 999;
			array_row16 = 999;
			array_row17 = 999;
			array_row18 = 999;
			array_row19 = 999;
			array_row20 = 999;
			array_row21 = 999;
			array_row22 = 999;
			array_row23 = 999;
			array_row24 = 999;
			array_row25 = 999;
			array_row26 = 999;
			array_row27 = 999;
			array_row28 = 999;
			array_row29 = 999;
			array_row30 = 999;
			array_row31 = 999;
			array_row32 = 999;
			array_row33 = 999;
			array_row34 = 999;
			array_row35 = 999;
			array_row36 = 999;
			array_row37 = 999;
			array_row38 = 999;			
			irow = 61;	
			self_reset = 0;
			for(i=0;i<=mapsize;i=i+1)
				begin
				for(j=0;j<=mapsize;j=j+1)
					begin
					array0[i][j] = 0;
					array1[i][j] = 0;
					array2[i][j] = 0;
					array3[i][j] = 0;
					end
				end	
					//for(ich=0;ich<=15;ich=ich+1)
						//array[i][ich][j] = 0;
		end
				
	// end tag
	if(fiber0[15:0]==16'b0101010101010101) 
		begin
			f0_done = 1'b1;
		end
	if(fiber1[15:0]==16'b0101010101010101) 
		begin
			f1_done = 1'b1;
		end
	if(fiber2[15:0]==16'b0101010101010101) 
		begin
			f2_done = 1'b1;
		end
	if(fiber3[15:0]==16'b0101010101010101) 
		begin
			f3_done = 1'b1;
		end		

	all_done = f0_done && f1_done && f2_done && f3_done;	
							
	// fill the table
	if(all_done==1)
	begin
//		if(irow>10) 
//		begin
//		array_out0 = array0[raddr];
//		end
		/*
		if(irow==63)
		begin
			array_out0 = 39'b101010101010101010101010101010101010101;
			array_out1 = 39'b101010101010101010101010101010101010101;
			array_out2 = 39'b101010101010101010101010101010101010101;
			array_out3 = 39'b101010101010101010101010101010101010101;		
		end		
					
//			array_out0 = array0[irow];
//			array_out1 = array1[irow];
//			array_out2 = array2[irow];
//			array_out3 = array3[irow];
			array_out0 = array0[0];
			array_out1 = array1[1];
			array_out2 = array2[2];
			array_out3 = array3[3];		
		*/	
			if(irow==63)
			begin
				array_out0 = 39'b101010101010101010101010101010101010101;	
			end		
/*			
			else if(irow==0&&irow<=38) 
			begin
				array_out0 = array0[test];
			end
			else if(irow==39) 
			begin
				array_out0 = 39'b010101010101010101010101010101010101010;
			end
*/
		else if(irow==0)
		begin
			array_out0 = array0[0];
		end
		else if(irow==1)
		begin
			array_out0 = array0[1];
		end
		else if(irow==2)
		begin
			array_out0 = array0[2];
		end
		else if(irow==3)
		begin
			array_out0 = array0[3];
		end
		else if(irow==4)
		begin
			array_out0 = array0[4];
		end
		else if(irow==5)
		begin
			array_out0 = array0[5];
		end
		else if(irow==6)
		begin
			array_out0 = array0[6];
		end
		else if(irow==7)
		begin
			array_out0 = array0[7];
		end
		else if(irow==8)
		begin
			array_out0 = array0[8];
		end
		else if(irow==9)
		begin
			array_out0 = array0[9];
		end
		else if(irow==10)
		begin
			array_out0 = array0[10];
		end
		else if(irow==11)
		begin
			array_out0 = array0[11];
		end
		else if(irow==12)
		begin
			array_out0 = array0[12];
		end
		else if(irow==13)
		begin
			array_out0 = array0[13];
		end
		else if(irow==14)
		begin
			array_out0 = array0[14];
		end
		else if(irow==15)
		begin
			array_out0 = array0[15];
		end
		else if(irow==16)
		begin
			array_out0 = array0[16];
		end
		else if(irow==17)
		begin
			array_out0 = array0[17];
		end
		else if(irow==18)
		begin
			array_out0 = array0[18];
		end
		else if(irow==19)
		begin
			array_out0 = array0[19];
		end
		else if(irow==20)
		begin
			array_out0 = array0[20];
		end
		else if(irow==21)
		begin
			array_out0 = array0[21];
		end
		else if(irow==22)
		begin
			array_out0 = array0[22];
		end
		else if(irow==23)
		begin
			array_out0 = array0[23];
		end
		else if(irow==24)
		begin
			array_out0 = array0[24];
		end
		else if(irow==25)
		begin
			array_out0 = array0[25];
		end
		else if(irow==26)
		begin
			array_out0 = array0[26];
		end
		else if(irow==27)
		begin
			array_out0 = array0[27];
		end
		else if(irow==28)
		begin
			array_out0 = array0[28];
		end
		else if(irow==29)
		begin
			array_out0 = array0[29];
		end
		else if(irow==30)
		begin
			array_out0 = array0[30];
		end
		else if(irow==31)
		begin
			array_out0 = array0[31];
		end
		else if(irow==32)
		begin
			array_out0 = array0[32];
		end
		else if(irow==33)
		begin
			array_out0 = array0[33];
		end
		else if(irow==34)
		begin
			array_out0 = array0[34];
		end
		else if(irow==35)
		begin
			array_out0 = array0[35];
		end
		else if(irow==36)
		begin
			array_out0 = array0[36];
		end
		else if(irow==37)
		begin
			array_out0 = array0[37];
		end
		else if(irow==38)
		begin
			array_out0 = array0[38];
		end				
			else if(irow==39) 
			begin
				f0_done = 0;
				f1_done = 0;
				f2_done = 0;
				f3_done = 0;	
				array_out0 = 39'b010101010101010101010101010101010101010;		
			end
			
			/*
			array_row00 = array0[0];
			array_row01 = array0[1];
			array_row02 = array0[2];
			array_row03 = array0[3];
			array_row04 = array0[4];
			array_row05 = array0[5];
			array_row06 = array0[6];
			array_row07 = array0[7];
			array_row08 = array0[8];
			array_row09 = array0[9];
			array_row10 = array0[10];
			array_row11 = array0[11];
			array_row12 = array0[12];
			array_row13 = array0[13];
			array_row14 = array0[14];
			array_row15 = array0[15];
			array_row16 = array0[16];
			array_row17 = array0[17];
			array_row18 = array0[18];
			array_row19 = array0[19];
			array_row20 = array0[20];
			array_row21 = array0[21];
			array_row22 = array0[22];
			array_row23 = array0[23];
			array_row24 = array0[24];
			array_row25 = array0[25];
			array_row26 = array0[26];
			array_row27 = array0[27];
			array_row28 = array0[28];
			array_row29 = array0[29];
			array_row30 = array0[30];
			array_row31 = array0[31];
			array_row32 = array0[32];
			array_row33 = array0[33];
			array_row34 = array0[34];
			array_row35 = array0[35];
			array_row36 = array0[36];
			array_row37 = array0[37];
			array_row38 = array0[38];
			self_reset = 1;
			*/
			
		/*	
				
//			array_out0 = array0[irow];// ||  array1[irow] || array2[irow] || array3[irow];

//		end
		else if(irow==39) 
		begin

			array_out0 = 39'b010101010101010101010101010101010101010;
			array_out1 = 39'b010101010101010101010101010101010101010;
			array_out2 = 39'b010101010101010101010101010101010101010;
			array_out3 = 39'b010101010101010101010101010101010101010;
		end	
		else if(irow==40) 
		begin
			f0_done = 0;
			f1_done = 0;
			f2_done = 0;
			f3_done = 0;	
			array_out0 = 0;
			array_out1 = 0;
			array_out2 = 0;
			array_out3 = 0;				
		end
		else 
		begin
		end
		*/
		irow = irow + 1'b1;
		
	end	
	else if(all_done==0)
	begin		
		for(ich=0;ich<1;ich=ich+1)
		begin
			if(dv0[ich]==2'b01 && c0[ich]==1'b1)
			begin
				array0[x0[ich]][y0[ich]] = 1'b1;
			end
			if(dv1[ich]==2'b01 && c1[ich]==1'b1)
			begin
				array0[x1[ich]][y1[ich]] = 1'b1;
			end
			if(dv2[ich]==2'b01 && c2[ich]==1'b1)
			begin
				array0[x2[ich]][y2[ich]] = 1'b1;
			end
			if(dv3[ich]==2'b01 && c3[ich]==1'b1)
			begin
				array0[x3[ich]][y3[ich]] = 1'b1;
			end	
		end // end of ich
	end	// end of else if			
end // of always

endmodule


