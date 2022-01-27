/* 
   Top CDT CDT Design
   C. Lin
*/

module veto_err_decoder
///
(
// input 
   clk               , // system clock
   in_live           ,
   got_veto_err        ,
   veto_err_bus        ,
     
// output
   is_veto_err     
   
);

input  wire         clk;
input  wire         in_live;
input  wire         got_veto_err;
input  wire [231:0] veto_err_bus;

output reg          is_veto_err;

reg                 veto_done;       

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         is_veto_err = 1'b0;
         
         veto_done = 1'b0;
      end

   if( got_veto_err == 1'b1 && veto_done == 1'b0 )
      begin
         if( veto_err_bus == 0 )
            is_veto_err = 1'b0;
         else
            is_veto_err = 1'b1;
         
         veto_done = 1'b1;
      end
   
end

endmodule