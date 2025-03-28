/* 
   Top CDT Design
   C. Lin
*/

module stat_lv1a_raw
(
// input 
  clk               , // system clock
  
  // inputs
  in_live           ,
  in_lv1a_raw       , 
  in_ext            , 
  in_delta          ,
  
  // output
  nlv1a_raw         
   
);

input wire         clk;

// inputs
input wire         in_live;
input wire [15 :0] in_lv1a_raw;
input wire [3  :0] in_ext;
input wire         in_delta;

// output
output reg [31 :0] nlv1a_raw;

// var
reg                pre_live;

////////////////////////////////////////////
always @(posedge clk)
begin
 
// keep resetting during live off
   if( pre_live == 1'b0 && in_live == 1'b1 ) begin
      nlv1a_raw = 0;
   end

   if( in_lv1a_raw > 0 || in_ext > 0 || in_delta > 0 )
      nlv1a_raw = nlv1a_raw + 1;
   
   pre_live = in_live;
      
end

endmodule