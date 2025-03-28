/* 
   Top CDT Design
   C. Lin, 2018.05.19
*/

module lv1_delay 
(
  clk               , // system clock
  
  // inputs
  lv1               , 
  live              ,
  ena_delta         ,
  
  // register
  delay
              
);

input wire         clk;

// inputs
input wire         lv1;
input wire         live;
input wire         ena_delta;

// output
output reg  [9 :0] delay;

// variables
reg         [9 :0] cnt; 
reg                pre_live;
reg                is_first_lv1;

////////////////////////////////////////////
always @(posedge clk)
begin

   if( live == 1'b0 )
      begin
         is_first_lv1 = 1'b0;
         cnt = 0;
      end

   if( pre_live == 1'b0 && live == 1'b1 )
      delay = 0;
     
   if( is_first_lv1 == 1'b0 && lv1 == 1'b1 )
      begin
         delay = cnt;
         is_first_lv1 = 1'b1;
      end
   
   if( ena_delta == 1'b1 && cnt < 1022 && is_first_lv1 == 1'b0 )
      cnt = cnt + 1;

   pre_live = live;
 
end

endmodule