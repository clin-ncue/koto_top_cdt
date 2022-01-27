/* 
   Top CDT Design
   C. Lin, 2018.04.22
*/

module pipe_input
(
  clk               , // system clock
  
  // inputs
  in                , 
  in_live           ,
  
  // register
  user_delay        ,
 
  // output
  out               ,
              
);

input wire         clk;

// inputs
input wire         in;
input wire         in_live;
input wire [7  :0] user_delay;

// output
output reg         out;

// variables 
reg        [255:0] pipeline;

////////////////////////////////////////////
always @(posedge clk)
begin

   if( in_live == 1'b0 )
      pipeline = 0;

   pipeline = pipeline << 1;
   pipeline[0] = in;

   out = pipeline[user_delay];

end

endmodule