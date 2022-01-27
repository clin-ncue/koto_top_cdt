module csi_addr( clk,addr,header,fiber,fiber_out,xy00,xy01,xy02,xy03,xy04,xy05,xy06,xy07,xy08,xy09,xy0A,xy0B,xy0C,xy0D,xy0E,xy0F);

    input wire clk;
    input wire [24:0] fiber;
    input wire [255:0] addr;
    input wire [1:0] header;
    
    output reg [24:0]  fiber_out;
    output reg [15:00] xy00;
    output reg [15:00] xy01;
    output reg [15:00] xy02;
    output reg [15:00] xy03;
    output reg [15:00] xy04;
    output reg [15:00] xy05;
    output reg [15:00] xy06;
    output reg [15:00] xy07;
    output reg [15:00] xy08;
    output reg [15:00] xy09;
    output reg [15:00] xy0A;
    output reg [15:00] xy0B;
    output reg [15:00] xy0C;
    output reg [15:00] xy0D;
    output reg [15:00] xy0E;
    output reg [15:00] xy0F;
    
    parameter Bit = 5; 
 /*   
    assign fiber_out[24:0] = fiber[24:0];
	assign xy00[5:0] = addr[Bit+0:0]; 		assign xy00[Bit+6:6] = addr[Bit+8:8];
	assign xy01[5:0] = addr[Bit+16:16]; 	assign xy01[Bit+6:6] = addr[Bit+24:24];	
	assign xy02[5:0] = addr[Bit+32:32]; 	assign xy02[Bit+6:6] = addr[Bit+40:40];
	assign xy03[5:0] = addr[Bit+48:48]; 	assign xy03[Bit+6:6] = addr[Bit+56:56];
	assign xy04[5:0] = addr[Bit+64:64]; 	assign xy04[Bit+6:6] = addr[Bit+72:72];
	assign xy05[5:0] = addr[Bit+80:80]; 	assign xy05[Bit+6:6] = addr[Bit+88:88];
	assign xy06[5:0] = addr[Bit+96:96]; 	assign xy06[Bit+6:6] = addr[Bit+104:104];
	assign xy07[5:0] = addr[Bit+112:112]; 	assign xy07[Bit+6:6] = addr[Bit+120:120];
	assign xy08[5:0] = addr[Bit+128:128]; 	assign xy08[Bit+6:6] = addr[Bit+136:136];
	assign xy09[5:0] = addr[Bit+144:144]; 	assign xy09[Bit+6:6] = addr[Bit+152:152];
	assign xy0A[5:0] = addr[Bit+160:160]; 	assign xy0A[Bit+6:6] = addr[Bit+168:168];
	assign xy0B[5:0] = addr[Bit+176:176]; 	assign xy0B[Bit+6:6] = addr[Bit+184:184];
	assign xy0C[5:0] = addr[Bit+192:192]; 	assign xy0C[Bit+6:6] = addr[Bit+200:200];
	assign xy0D[5:0] = addr[Bit+208:208]; 	assign xy0D[Bit+6:6] = addr[Bit+216:216];
	assign xy0E[5:0] = addr[Bit+224:224]; 	assign xy0E[Bit+6:6] = addr[Bit+232:232];
	assign xy0F[5:0] = addr[Bit+240:240]; 	assign xy0F[Bit+6:6] = addr[Bit+248:248];
	
	assign xy00[12] = fiber[0];
	assign xy01[12] = fiber[1];
	assign xy02[12] = fiber[2];
	assign xy03[12] = fiber[3];
	assign xy04[12] = fiber[4];
	assign xy05[12] = fiber[5];
	assign xy06[12] = fiber[6];
	assign xy07[12] = fiber[7];
	assign xy08[12] = fiber[8];
	assign xy09[12] = fiber[9];
	assign xy0A[12] = fiber[10];
	assign xy0B[12] = fiber[11];
	assign xy0C[12] = fiber[12];
	assign xy0D[12] = fiber[13];
	assign xy0E[12] = fiber[14];
	assign xy0F[12] = fiber[15];
	
	assign xy00[13] = fiber[24];
	assign xy01[13] = fiber[24];
	assign xy02[13] = fiber[24];
	assign xy03[13] = fiber[24];
	assign xy04[13] = fiber[24];
	assign xy05[13] = fiber[24];
	assign xy06[13] = fiber[24];
	assign xy07[13] = fiber[24];
	assign xy08[13] = fiber[24];
	assign xy09[13] = fiber[24];
	assign xy0A[13] = fiber[24];
	assign xy0B[13] = fiber[24];
	assign xy0C[13] = fiber[24];
	assign xy0D[13] = fiber[24];
	assign xy0E[13] = fiber[24];
	assign xy0F[13] = fiber[24];
	
	
	assign xy00[14] = 1'b0;
	assign xy01[14] = 1'b0;
	assign xy02[14] = 1'b0;
	assign xy03[14] = 1'b0;
	assign xy04[14] = 1'b0;
	assign xy05[14] = 1'b0;
	assign xy06[14] = 1'b0;
	assign xy07[14] = 1'b0;
	assign xy08[14] = 1'b0;
	assign xy09[14] = 1'b0;
	assign xy0A[14] = 1'b0;
	assign xy0B[14] = 1'b0;
	assign xy0C[14] = 1'b0;
	assign xy0D[14] = 1'b0;
	assign xy0E[14] = 1'b0;
	assign xy0F[14] = 1'b0;
*/

always @(posedge clk)
begin

    fiber_out[24:0] <= fiber[24:0];
	xy00[5:0] <= addr[Bit+0:0]; 		xy00[Bit+6:6] <= addr[Bit+8:8];
	xy01[5:0] <= addr[Bit+16:16]; 		xy01[Bit+6:6] <= addr[Bit+24:24];
	xy02[5:0] <= addr[Bit+32:32]; 		xy02[Bit+6:6] <= addr[Bit+40:40];
	xy03[5:0] <= addr[Bit+48:48]; 		xy03[Bit+6:6] <= addr[Bit+56:56];
	xy04[5:0] <= addr[Bit+64:64]; 		xy04[Bit+6:6] <= addr[Bit+72:72];
	xy05[5:0] <= addr[Bit+80:80]; 		xy05[Bit+6:6] <= addr[Bit+88:88];
	xy06[5:0] <= addr[Bit+96:96]; 		xy06[Bit+6:6] <= addr[Bit+104:104];
	xy07[5:0] <= addr[Bit+112:112]; 	xy07[Bit+6:6] <= addr[Bit+120:120];
	xy08[5:0] <= addr[Bit+128:128]; 	xy08[Bit+6:6] <= addr[Bit+136:136];
	xy09[5:0] <= addr[Bit+144:144]; 	xy09[Bit+6:6] <= addr[Bit+152:152];
	xy0A[5:0] <= addr[Bit+160:160]; 	xy0A[Bit+6:6] <= addr[Bit+168:168];
	xy0B[5:0] <= addr[Bit+176:176]; 	xy0B[Bit+6:6] <= addr[Bit+184:184];
	xy0C[5:0] <= addr[Bit+192:192]; 	xy0C[Bit+6:6] <= addr[Bit+200:200];
	xy0D[5:0] <= addr[Bit+208:208]; 	xy0D[Bit+6:6] <= addr[Bit+216:216];
	xy0E[5:0] <= addr[Bit+224:224]; 	xy0E[Bit+6:6] <= addr[Bit+232:232];
	xy0F[5:0] <= addr[Bit+240:240]; 	xy0F[Bit+6:6] <= addr[Bit+248:248];

	xy00[12] <= fiber[0];
	xy01[12] <= fiber[1];
	xy02[12] <= fiber[2];
	xy03[12] <= fiber[3];
	xy04[12] <= fiber[4];
	xy05[12] <= fiber[5];
	xy06[12] <= fiber[6];
	xy07[12] <= fiber[7];
	xy08[12] <= fiber[8];
	xy09[12] <= fiber[9];
	xy0A[12] <= fiber[10];
	xy0B[12] <= fiber[11];
	xy0C[12] <= fiber[12];
	xy0D[12] <= fiber[13];
	xy0E[12] <= fiber[14];
	xy0F[12] <= fiber[15];

	xy00[13] <= fiber[24];
	xy01[13] <= fiber[24];
	xy02[13] <= fiber[24];
	xy03[13] <= fiber[24];
	xy04[13] <= fiber[24];
	xy05[13] <= fiber[24];
	xy06[13] <= fiber[24];
	xy07[13] <= fiber[24];
	xy08[13] <= fiber[24];
	xy09[13] <= fiber[24];
	xy0A[13] <= fiber[24];
	xy0B[13] <= fiber[24];
	xy0C[13] <= fiber[24];
	xy0D[13] <= fiber[24];
	xy0E[13] <= fiber[24];
	xy0F[13] <= fiber[24];


	xy00[14] <= 1'b0;
	xy01[14] <= 1'b0;
	xy02[14] <= 1'b0;
	xy03[14] <= 1'b0;
	xy04[14] <= 1'b0;
	xy05[14] <= 1'b0;
	xy06[14] <= 1'b0;
	xy07[14] <= 1'b0;
	xy08[14] <= 1'b0;
	xy09[14] <= 1'b0;
	xy0A[14] <= 1'b0;
	xy0B[14] <= 1'b0;
	xy0C[14] <= 1'b0;
	xy0D[14] <= 1'b0;
	xy0E[14] <= 1'b0;
	xy0F[14] <= 1'b0;
end


/*
	assign xy00[14:13] = header[1:0];
	assign xy01[14:13] = header[1:0];
	assign xy02[14:13] = header[1:0];
	assign xy03[14:13] = header[1:0];
	assign xy04[14:13] = header[1:0];
	assign xy05[14:13] = header[1:0];
	assign xy06[14:13] = header[1:0];
	assign xy07[14:13] = header[1:0];
	assign xy08[14:13] = header[1:0];
	assign xy09[14:13] = header[1:0];
	assign xy10[14:13] = header[1:0];
	assign xy11[14:13] = header[1:0];
	assign xy12[14:13] = header[1:0];
	assign xy13[14:13] = header[1:0];
	assign xy14[14:13] = header[1:0];
	assign xy15[14:13] = header[1:0];
/*	
	
//	assign xy00[5:0] = addr[:16]; assign xy00[11:6] = addr[13:8];
/*
    always @( posedge clk ) begin

    end
*/
endmodule