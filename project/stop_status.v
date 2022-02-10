/* 
   stop status
   C. Lin, chiehlin@uchicago.edu
*/

module stop_status
(
// input 
  clk               , // system clock
  live_rising       ,
  
  // inputs
  get               , 
   
  // output
  q                       
              
);

input wire         clk;
input wire         live_rising;

// inputs
input wire         get;

// output
output reg         q = 1'b0;

////////////////////////////////////////////
always @(posedge clk) begin

   if( live_rising == 1'b1 ) begin
      q <= 1'b0;
   end

   if( get ==1'b1 ) begin
      q <= ~q;
   end
		
end

endmodule