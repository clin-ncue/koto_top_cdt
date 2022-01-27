/* 
   Top CDT Design
   C. Lin, 2018.04.22
*/

module redge_filter
(
  clk               , // system clock
  
  // inputs
  in                , 
  
  // register
  out
              
);

input wire         clk;

// inputs
input wire         in;

// output
output reg         out;

// variables 
reg                pre_in;

////////////////////////////////////////////
always @(posedge clk)
begin

   if( pre_in == 1'b0 && in == 1'b1 )
      out = 1'b1;
   else 
      out = 1'b0;

   pre_in = in;
 
end

endmodule