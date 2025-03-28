/* 
   Top CDT Design
   demux_bus1_16_design.
   
   2025.03.28
   
*/

module demux_bus256_1to16
(
// input 
  clk               , // system clock
  
  en                ,
  sw                ,
  reg0              ,
  reg1              ,
  reg2              ,
  reg3              ,
  reg4              ,
  reg5              ,
  reg6              ,
  reg7              ,    
  
// output
  out_00            ,
  out_01            ,
  out_02            ,
  out_03            ,
  out_04            ,
  out_05            ,
  out_06            ,
  out_07            ,
  out_08            ,
  out_09            ,
  out_10            ,
  out_11            ,
  out_12            ,
  out_13            ,
  out_14            ,
  out_15            ,
);

// input
input wire          clk;

input wire          en;
input wire  [3  :0] sw;

input wire  [31 :0] reg0;
input wire  [31 :0] reg1;
input wire  [31 :0] reg2;
input wire  [31 :0] reg3;
input wire  [31 :0] reg4;
input wire  [31 :0] reg5;
input wire  [31 :0] reg6;
input wire  [31 :0] reg7;

// output
output reg  [255:0] out_00;
output reg  [255:0] out_01;
output reg  [255:0] out_02;
output reg  [255:0] out_03;
output reg  [255:0] out_04;
output reg  [255:0] out_05;
output reg  [255:0] out_06;
output reg  [255:0] out_07;
output reg  [255:0] out_08;
output reg  [255:0] out_09;
output reg  [255:0] out_10;
output reg  [255:0] out_11;
output reg  [255:0] out_12;
output reg  [255:0] out_13;
output reg  [255:0] out_14;
output reg  [255:0] out_15;

////////////////////////////////////////////
always @(posedge clk)
begin

   case ( sw )
            0 : out_00 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_00;
            1 : out_01 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_01;
            2 : out_02 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_02;
            3 : out_03 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_03;
            4 : out_04 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_04;
            5 : out_05 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_05;
            6 : out_06 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_06;
            7 : out_07 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_07;
            8 : out_08 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_08;
            9 : out_09 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_09;
            10: out_10 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_10;
            11: out_11 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_11;
            12: out_12 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_12;
            13: out_13 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_13;
            14: out_14 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_14;
            15: out_15 <= (en) ? {reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0} : out_15;      
            default: ;
  endcase
  
end

endmodule
