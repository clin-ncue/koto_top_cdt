/* 
   Top CDT Design
   C. Lin, 2018.04.22
*/

module exdata_cnt
(
  clk               , // system clock
  
  // inputs
  in                , 
  live              ,
  
  // register
  cnt
              
);

input wire         clk;

// inputs
input wire         in;
input wire         live;

// output
output reg [31 :0] cnt;

// variables 
reg                pre_live;

////////////////////////////////////////////
always @(posedge clk)
begin

   if( pre_live == 1'b0 && live == 1'b1 )
      cnt = 0;
      
   if( in == 1'b1 )
      cnt = cnt + 1;

   pre_live = live;
 
end

endmodule