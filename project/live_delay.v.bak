/* 
   Spill start delay
   C. Lin, 2021.10.31
*/

module live_delay
( 
   clk               , // system clock
   in_start          ,
   out_start         ,
   user_delay 
);

input  wire         clk;
input  wire         in_start;
input  wire [7 :0]  user_delay;
output reg          out_start;

reg                 pre_in;
reg                 en_counter;

reg        [31 :0]  cnt;

always @(posedge clk)
begin

   out_start = 1'b0;

   if( pre_in == 1'b0 && in_start == 1'b1 )
      begin
         en_counter = 1'b1;
      end
      
   if( en_counter )
      begin
         cnt = cnt + 1;
      end

   if( cnt[30:23] == (user_delay+1) ) 
      begin
         out_start = 1'b1;
         cnt = 0;
         en_counter = 1'b0;
      end
   
   pre_in = in_start;
    
end

endmodule