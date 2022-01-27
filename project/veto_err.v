/* 
   Fanout CDT Design
   C. Lin, 2018.04.11
*/

module veto_err
#( parameter LENGTH_ERR = 232  // w/o headers
  )
///
(
// input 
   clk               , // system clock
   in_live           ,
   in_err            ,
     
// output
   got_veto_err_bus   ,
   out_veto_err_bus   ,        
   
);

input  wire         clk;
input  wire         in_live;
input  wire         in_err;

output reg          got_veto_err_bus;
output reg  [231:0] out_veto_err_bus;

reg                 got_signal;
reg         [2  :0] pipeline;

reg                 is_veto_header;
reg         [7  :0] veto_cnt;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin   
         got_veto_err_bus = 1'b0;
         out_veto_err_bus = 0;
         veto_cnt = 0;
         
         pipeline = 0;
         is_veto_header = 1'b0;

      end
   else
      begin
        
         //////
         /// check the pipeline content in the pervious clock
         
         if( pipeline == 3'b101 && is_veto_header == 1'b0 )
            is_veto_header = 1'b1;
         
         ///////
         // pipeline movement            

         pipeline = pipeline << 1;
         pipeline[0] = in_err;
         
         /// dc
         if( is_veto_header == 1'b1)
            begin
               if( veto_cnt < LENGTH_ERR )
                  begin
                     out_veto_err_bus[veto_cnt] = in_err;
                     veto_cnt = veto_cnt + 1;
                  end
               else if( veto_cnt == LENGTH_ERR )
                  got_veto_err_bus = 1'b1;
            end
         
      /////
        
      end
end

endmodule