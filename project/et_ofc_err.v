/* 
   Fanout CDT Design
   C. Lin, 2018.04.11
*/

module et_ofc_err
#( parameter LENGTH_ERR_TLK = 18  , // w/o headers
   parameter LENGTH_ERR_DC  = 20
  )
///
(
// input 
   clk               , // system clock
   in_live           ,
   in_err            ,
   bypass            ,
     
// output
   got_tlk_err_bus   ,
   got_dc_err_bus    ,
   
   out_tlk_err_bus   ,
   out_dc_err_bus    ,        
   
);

input  wire         clk;
input  wire         in_live;
input  wire         in_err;
input  wire         bypass;

output reg          got_tlk_err_bus;
output reg          got_dc_err_bus;

output reg  [17: 0] out_tlk_err_bus;
output reg  [19: 0] out_dc_err_bus;

reg                 got_signal;
reg         [2  :0] pipeline;

reg                 is_tlk_header;
reg                 is_dc_header;

reg         [4  :0] tlk_cnt;
reg         [4  :0] dc_cnt;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         got_tlk_err_bus = 1'b0;
         got_dc_err_bus = 1'b0;
         
         out_tlk_err_bus = 0;
         out_dc_err_bus = 0;
        
         tlk_cnt = 0;
         dc_cnt = 0;
         
         pipeline = 0;
         is_tlk_header = 1'b0;
         is_dc_header = 1'b0;

      end
   else
      begin
        
         //////
         /// check the pipeline content in the pervious clock
         
         if( bypass==1'b1 )
            got_tlk_err_bus = 1'b1;
         else if( pipeline == 3'b100 && is_tlk_header == 1'b0 )
            is_tlk_header = 1'b1;
            
         if( bypass==1'b1 )
            begin
               got_dc_err_bus = 1'b1;
               out_dc_err_bus = 20'b0000_0000_0000_0000_0011;
            end
         else if( pipeline == 3'b101 && is_dc_header == 1'b0 )
            is_dc_header = 1'b1;
         
         ///////
         // pipeline movement            

         pipeline = pipeline << 1;
         pipeline[0] = in_err;

         /// tlk
         if( is_tlk_header == 1'b1)
            begin
               if( tlk_cnt < LENGTH_ERR_TLK )
                  begin
                     out_tlk_err_bus[tlk_cnt] = in_err;
                     tlk_cnt = tlk_cnt + 1;
                  end
               else if( tlk_cnt == LENGTH_ERR_TLK )
                  got_tlk_err_bus = 1'b1;
            end
      
         
         /// dc
         if( is_dc_header == 1'b1)
            begin
               if( dc_cnt < LENGTH_ERR_DC )
                  begin
                     out_dc_err_bus[dc_cnt] = in_err;
                     dc_cnt = dc_cnt + 1;
                  end
               else if( dc_cnt == LENGTH_ERR_DC )
                  got_dc_err_bus = 1'b1;
            end
         
      /////
        
      end
end

endmodule