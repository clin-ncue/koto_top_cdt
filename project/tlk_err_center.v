/* 
   Top CDT CDT Design
   C. Lin
   
   2019.11.19
   v29: Add veto error bits in TLK checks.
*/

module tlk_err_center
///
(
// input 
   clk                  , // system clock
   in_live              ,
   got_et_tlk_err       ,
   got_veto_tlk_err     , 
   got_et_ofc_tlk_err   ,
   got_clus_ofc_tlk_err ,
   got_olrx_err         ,
   
   is_et_tlk_err        ,
   is_veto_tlk_err      ,
   is_et_ofc_tlk_err    ,
   is_clus_ofc_tlk_err  ,
   olrx_err_bus         ,
     
// output
   is_tlk_err           ,
   olrx_status          
);

input  wire         clk;
input  wire         in_live;
input  wire         got_et_tlk_err;
input  wire         got_veto_tlk_err;
input  wire         got_et_ofc_tlk_err;
input  wire         got_clus_ofc_tlk_err;
input  wire [3  :0] got_olrx_err;

input  wire         is_et_tlk_err;
input  wire         is_veto_tlk_err;
input  wire         is_et_ofc_tlk_err;
input  wire         is_clus_ofc_tlk_err;
input  wire [3  :0] olrx_err_bus; 

output reg          is_tlk_err;
    
reg         [4  :0] status;
reg         [4  :0] result;
output reg  [3  :0] olrx_status;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         is_tlk_err = 1'b1;
         status = 5'b0_0000;   
         result = 5'b0_0000;
         olrx_status = 4'b0000;
      end
  
   if( got_et_tlk_err == 1'b1 )
      begin
         if( is_et_tlk_err == 1'b1 )
            result[0] = 1'b1;
         else
            result[0] = 1'b0;
            
         status[0] = 1'b1;
      end
 
    if( got_et_ofc_tlk_err == 1'b1 )
      begin
         if( is_et_ofc_tlk_err == 1'b1 )
            result[1] = 1'b1;
         else
            result[1] = 1'b0;
            
         status[1] = 1'b1;
      end     
      
   if( got_clus_ofc_tlk_err == 1'b1 )
      begin
         if( is_clus_ofc_tlk_err == 1'b1 )
            result[2] = 1'b1;
         else
            result[2] = 1'b0;
            
         status[2] = 1'b1;
      end     
  
    olrx_status = olrx_status | got_olrx_err;
    if( olrx_status == 4'b1111 )
       begin
          if( olrx_err_bus == 4'b0000 )
             result[3] = 1'b0;
          else
             result[3] = 1'b1;
             
          status[3] = 1'b1;
       end
   
   /// further add in v29 ///    
   if( got_veto_tlk_err == 1'b1 )
      begin
         if( is_veto_tlk_err == 1'b1 )
            result[4] = 1'b1;
         else
            result[4] = 1'b0;
            
         status[4] = 1'b1;
      end
       
    if( status == 5'b1_1111 )
       begin
          if( result == 5'b0_0000 )
             is_tlk_err = 1'b0;
          else
             is_tlk_err = 1'b1;
       end

end

endmodule