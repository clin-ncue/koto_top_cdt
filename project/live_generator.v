module live_generator
( 
   clk               , // system clock
   in_start          ,
   out_live          ,
   user_length 
);

input  wire         clk;
input  wire         in_start;
input  wire [7 :0]  user_length;
output reg          out_live;

reg                 pre_in;
reg                 en_counter;

reg        [31 :0]  cnt = 32'hFFFF_FFFF;

always @(posedge clk)
begin

   if( in_start == 1'b1 )
      begin
         cnt = 0;
      end

   if( cnt[30:23] < user_length )
      begin
         out_live = 1'b1;
         cnt = cnt + 1;
      end
   else
      begin
         out_live = 1'b0;
      end
    
end

endmodule