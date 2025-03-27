/* 
   Top CDT Design
   C. Lin, 2018.04.22
   
   2025.01.21
   - v0.06.02 extend the "user_gap" to 32 bits.
   - Remove enable funciton.
   - Update to non-blocking design.
*/

module clock_trig
(
// input 
  clk               , // system clock
  
  in_live           , // reset
  user_gap          ,
  
// output 
  out               ,
       
);

input wire         clk;

// inputs
input wire         in_live;
input wire [31 :0] user_gap;

// output
output reg         out;

reg        [31 :0] cnt;

always @(posedge clk)
begin
 
   if( in_live == 1'b0 )  begin
      cnt <= 0;
      out <= 1'b0;
   end
   
   else begin
       out <= ( cnt == 0 ) ? 1'b1 : 1'b0;
       cnt <= ( cnt < user_gap ) ? (cnt + 1) : 0;
   end  
      
end

endmodule