/* 
   Fanout CDT Design
   C. Lin, 2018.04.11
*/

module clus_ofc_err
#( parameter LENGTH_ERR = 18  // w/o headers
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
   out_tlk_err_bus   ,        
   
);

input  wire         clk;
input  wire         in_live;
input  wire         in_err;
input  wire         bypass;

output reg          got_tlk_err_bus;
output reg  [17: 0] out_tlk_err_bus;

reg                 got_signal;
reg         [2  :0] pipeline;
reg                 is_tlk_header;
reg         [4  :0] tlk_cnt;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         got_tlk_err_bus = 1'b0;
         out_tlk_err_bus = 0;
       
         tlk_cnt = 0;
         pipeline = 0;
         is_tlk_header = 1'b0;

      end
   else
      begin
        
         //////
         /// check the pipeline content in the pervious clock
         
         if( bypass==1'b1 )
            got_tlk_err_bus = 1'b1;
         else if( pipeline == 3'b100 && is_tlk_header == 1'b0 )
            is_tlk_header = 1'b1;
         
         ///////
         // pipeline movement            

         pipeline = pipeline << 1;
         pipeline[0] = in_err;

         /// tlk
         if( is_tlk_header == 1'b1)
            begin
               if( tlk_cnt < LENGTH_ERR )
                  begin
                     out_tlk_err_bus[tlk_cnt] = in_err;
                     tlk_cnt = tlk_cnt + 1;
                  end
               else if( tlk_cnt == LENGTH_ERR )
                  got_tlk_err_bus = 1'b1;
            end
      
         
      /////
        
      end
end

endmodule