module ex3 (clk,reset,fiber0,fiber1,fiber2,fiber3, 
f0ch00,f0ch01,f0ch02,//f0ch03,f0ch04,f0ch05,f0ch06,f0ch07,f0ch08,f0ch09,f0ch10,f0ch11,f0ch12,f0ch13,f0ch14,f0ch15,
//f1ch00,f1ch01,f1ch02,f1ch03,f1ch04,f1ch05,f1ch06,f1ch07,f1ch08,f1ch09,f1ch10,f1ch11,f1ch12,f1ch13,f1ch14,f1ch15,
//f2ch00,f2ch01,f2ch02,f2ch03,f2ch04,f2ch05,f2ch06,f2ch07,f2ch08,f2ch09,f2ch10,f2ch11,f2ch12,f2ch13,f2ch14,f2ch15,
//f3ch00,f3ch01,f3ch02,f3ch03,f3ch04,f3ch05,f3ch06,f3ch07,f3ch08,f3ch09,f3ch10,f3ch11,f3ch12,f3ch13,f3ch14,f3ch15,
array_out1, array_out2
);

parameter mapsize = 38;
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
/*
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
*/

reg [mapsize:0] array [mapsize:0];
output reg [mapsize:0] array_out1;
output reg [mapsize:0] array_out2;
reg f0_done = 0;
reg f1_done = 0;
reg f2_done = 0;
reg f3_done = 0;
reg all_done = 0;

reg [5:0] irow = 0;

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

/*
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
*/

always @(posedge clk)
begin
	// initilization
	integer i, j, ich;
	
	if(reset==1) 
		begin
			f0_done = 0;
			f1_done = 0;
			f2_done = 0;
			f3_done = 0;
			all_done = 0;
			irow = 62;
			for(i=0;i<=mapsize;i=i+1)
				for(j=0;j<=mapsize;j=j+1)
					array[i][j] = 0;
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
		
			
	array[0] = 100;	
	array[1] = 101;	
	array[2] = 102;	
	array[3] = 103;	
	array[4] = 104;	
	array[5] = 105;	
	array[6] = 106;	
	array[7] = 107;	
	array[8] = 108;	
	array[9] = 109;	
	array[10] = 110;	
	array[11] = 111;	
	array[12] = 112;	
	array[13] = 113;	
	array[14] = 114;	
	array[15] = 115;	
	array[16] = 116;	
	array[17] = 117;	
	array[18] = 118;
	array[19] = 119;
	array[20] = 120;	
	array[21] = 121;	
	array[22] = 122;	
	array[23] = 123;	
	array[24] = 124;	
	array[25] = 125;	
	array[26] = 126;	
	array[27] = 127;	
	array[28] = 128;
	array[29] = 129;			
	array[30] = 130;	
	array[31] = 131;	
	array[32] = 132;	
	array[33] = 133;	
	array[34] = 134;	
	array[35] = 135;	
	array[36] = 136;	
	array[37] = 137;	
	array[38] = 138;	
					
	// fill the table
	if(all_done==1)
	begin
		if(irow>=0&&irow<=37)
		begin
			array_out1 = array[irow];
			array_out2 = array[irow+1];
		end
		else if(irow==63)
		begin
			array_out1 = 39'b101010101010101010101010101010101010101;
			array_out2 = 39'b101010101010101010101010101010101010101;
		end
		else if(irow==38) 
		begin
			f0_done = 0;
			f1_done = 0;
			f2_done = 0;
			f3_done = 0;
			array_out1 = 39'b010101010101010101010101010101010101010;
			array_out2 = 39'b010101010101010101010101010101010101010;
		end
		irow = irow + 1;
	end	
	else if(all_done==0)
	begin		
		array_out1 = 0;
		array_out2 = 0;
		for(ich=0;ich<16;ich=ich+1)
		begin
		for(i=2;i<=mapsize-1;i=i+1)
		begin
		for(j=2;j<=mapsize-1;j=j+1)
		begin
			// f0
			if(x0[ich]==i&&y0[ich]==j&&dv0[ich]==2'b01)
				begin
				array[i][j] = array[i][j] || c0[ich];
				end
			else 
				begin
				array[i][j] = array[i][j];
				end
			// f1	
			if(x1[ich]==i&&y1[ich]==j&&dv1[ich]==2'b01)
				begin
				array[i][j] = array[i][j] || c1[ich];
				end
			else 
				begin
				array[i][j] = array[i][j];
				end	
			// f2	
			if(x2[ich]==i&&y2[ich]==j&&dv2[ich]==2'b01)
				begin
				array[i][j] = array[i][j] || c2[ich];
				end
			else 
				begin
				array[i][j] = array[i][j];
				end	
			// f3	
			if(x3[ich]==i&&y3[ich]==j&&dv3[ich]==2'b01)
				begin
				array[i][j] = array[i][j] || c3[ich];
				end
			else 
				begin
				array[i][j] = array[i][j];
				end	
		end // end of j
		end // end of i
		end // end of ich
	end	// end of else if		
			
end // of always

endmodule
