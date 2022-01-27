/* 
   Top CDT Design
   C. Lin
*/

module lv2_rej
(
// input 
  clk               , // system clock
  
  // inputs
  in_live           ,
  lv2_buffer_full   ,
  lv1a_req          ,
  
  // output
  lv2_rej_cnt        
   
);

input wire         clk;

// inputs
input wire         in_live;
input wire         lv2_buffer_full;
input wire         lv1a_req;

// output
output reg [31 :0] lv2_rej_cnt;

// var
reg                pre_live;

////////////////////////////////////////////
always @(posedge clk)
begin
 
// keep resetting during live off
   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
         lv2_rej_cnt = 0;
      end

   if( lv1a_req == 1'b1 && lv2_buffer_full == 1'b1 )
      lv2_rej_cnt = lv2_rej_cnt + 1;
   
   pre_live = in_live;
      
end

endmodule