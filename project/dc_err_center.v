/* 
   Top CDT CDT Design
   C. Lin
*/

module dc_err_center
///
(
// input 
   clk                  , // system clock
   in_live              ,
   got_et_dc_err        , 
   got_et_ofc_dc_err    ,
   got_veto_err         ,
   
   is_et_dc_err         ,
   is_et_ofc_dc_err     ,
   is_veto_err          ,  
     
// output
   is_dc_err        
   
);

input  wire         clk;
input  wire         in_live;
input  wire         got_et_dc_err;
input  wire         got_et_ofc_dc_err;
input  wire         got_veto_err;

input  wire         is_et_dc_err;
input  wire         is_et_ofc_dc_err;
input  wire         is_veto_err;

output reg          is_dc_err;
    
reg         [2  :0] status;
reg         [2  :0] result;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         is_dc_err = 1'b1;
         status = 3'b000;   
         result = 3'b000;
      end
  
   if( got_et_dc_err == 1'b1 )
      begin
         if( is_et_dc_err == 1'b1 )
            result[0] = 1'b1;
         else
            result[0] = 1'b0;
            
         status[0] = 1'b1;
      end
 
    if( got_et_ofc_dc_err == 1'b1 )
      begin
         if( is_et_ofc_dc_err == 1'b1 )
            result[1] = 1'b1;
         else
            result[1] = 1'b0;
            
         status[1] = 1'b1;
      end     
      
   if( got_veto_err == 1'b1 )
      begin
         if( is_veto_err == 1'b1 )
            result[2] = 1'b1;
         else
            result[2] = 1'b0;
            
         status[2] = 1'b1;
      end     
       
    if( status == 3'b111 )
       begin
          if( result == 3'b000 )
             is_dc_err = 1'b0;
          else
             is_dc_err = 1'b1;
       end

end

endmodule