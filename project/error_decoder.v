/* 
   error_decoder
   C. Lin, chiehlin@uchicago.edu
	
	2022.01.11
	Three levels of errors:
	         |  Priority  | types
   -----------------------------------------------------				
	- ERROR  | 1st	      | pending, spill no, event no
	- STOP   | 2nd        | memory almost full
	- WARNING| 3rd        | energy word error
*/

module error_decoder
(
  // input 
  clk               , // system clock

  // inputs
  in_bus            ,
  
  // outputs
  err               ,
  stop              ,
  warning      

);


input wire         clk;

// inputs
input wire  [2 :0] in_bus;

// inputs
output reg        err;
output reg        stop;
output reg        warning;

//              
reg                lock = 1'b0;
reg         [1 :0] cnt  = 2'b11;

////////////////////////////////////////////
always @(posedge clk) begin

   // intial values
   err <= 1'b0;
   stop <= 1'b0;
   warning <= 1'b0;

   // unlock after 3 clocks (length of the error message)
   if( cnt == 2'b11 ) begin
      lock <= 1'b0;
   end 
   else begin
      cnt <= cnt + 1;
   end

   // decode
   if( lock == 1'b0 && in_bus[2] == 1'b1 ) begin
      case( in_bus[1:0] )
         2'b00  : err <= 1'b1;
         2'b10  : stop <= 1'b1;
         2'b11  : warning <= 1'b1;
         default : ;
      endcase
      
      lock <= 1'b1;
      cnt <= 0;
   end 
	
end

endmodule