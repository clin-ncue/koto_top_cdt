
module start_generator
( 
   clk               , // system clock
   out_start         ,
   user_period
);

input  wire         clk;
input  wire [7 :0]  user_period;
output reg          out_start;

reg                 pre_in;
reg                 en_counter;

reg        [31 :0]  cnt = 0;

always @(posedge clk)
begin

   cnt = cnt + 1;

   if( cnt[30:23] == user_period )
      begin
         out_start = 1'b1;
         cnt = 0;
      end
   else
      begin
         out_start = 1'b0;
      end
    
end

endmodule