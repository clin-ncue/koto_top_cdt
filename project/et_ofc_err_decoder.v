/* 
   Top CDT CDT Design
   C. Lin
*/

module et_ofc_err_decoder
///
(
// input 
   clk               , // system clock
   in_live           ,
   got_tlk_err       ,
   got_dc_err        ,
   tlk_err_bus       ,
   dc_err_bus        ,
     
// output
   is_tlk_err        ,
   is_dc_err     
   
);

input  wire         clk;
input  wire         in_live;
input  wire         got_tlk_err;
input  wire         got_dc_err;
input  wire [17:0]  tlk_err_bus;
input  wire [19:0]  dc_err_bus;


output reg          is_tlk_err;
output reg          is_dc_err;

reg                 tlk_done;
reg                 dc_done;       

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         is_tlk_err = 1'b0;
         is_dc_err = 1'b0;
         
         tlk_done = 1'b0;
         dc_done = 1'b0;
      end
  
   if( got_tlk_err == 1'b1 && tlk_done == 1'b0 )
      begin
         if( tlk_err_bus == 0 )
            is_tlk_err = 1'b0;
         else
            is_tlk_err = 1'b1;
         
         tlk_done = 1'b1;
      end

   if( got_dc_err == 1'b1 && dc_done == 1'b0 )
      begin
         if( dc_err_bus == 20'b0000_0000_0000_0000_0011 )
            is_dc_err = 1'b0;
         else
            is_dc_err = 1'b1;
         
         dc_done = 1'b1;
      end
   
end

endmodule