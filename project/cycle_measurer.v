/*
   cycle_measurer
   C. Lin
   
   This module measures the cycle length between two consecutive START signal.
*/
module cycle_measurer
( 
   clk               , // system clock
   in_start         ,
   out_length
);

input  wire         clk;
input  wire         in_start;
output reg  [ 7 :0] out_length;

reg         [31 :0] cnt = 0;

always @(posedge clk)
begin

   if( in_start == 1'b1 )
      begin
         out_length = cnt[30:23];
         cnt = 0;
      end
   else if( cnt[30:23] == 8'hFF )
      begin
         ;
      end
   else
      begin
         cnt = cnt + 1;
      end
      
  
end

endmodule