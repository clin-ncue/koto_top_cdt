/*
    live_generator
    
    2025.03.28 revised.
    - Introduce tena line: this line is deasserted nearly 0.067 sec earlier than LIVE.
      The motivation is to avoid any near LIVE-edge event that may cause the confusion of downstream modules. 
*/
module live_generator
( 
   clk               , // system clock
   in_start          ,
   out_live          ,
   out_tena          ,
   user_length 
);

input  wire         clk;
input  wire         in_start;
input  wire [7 :0]  user_length;
output reg          out_live;
output reg          out_tena;

reg        [31 :0]  cnt = 32'hFFFF_FFFF;

always @(posedge clk)
begin

   if( cnt[30:23] < user_length ) begin
      out_live <= 1'b1;
      out_tena <= 1'b1;
      cnt <= cnt + 1;
   end
   else if( cnt[30:23]==user_length ) begin
       out_live <= 1'b1;
       out_tena <= 1'b0;
       cnt <= cnt + 1;
   end
   else begin
       out_live <= 1'b0;
       out_tena <= 1'b0;
   end
  
   if( in_start == 1'b1 ) begin
       cnt <= 0;
   end
    
end

endmodule