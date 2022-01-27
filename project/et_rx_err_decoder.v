/* 
   Top CDT Design
   rx_err_decoder
   C. Lin, 2018.04.10
*/

module et_rx_err_decoder
#( parameter LENGTH_ET_TLK_ERR = 232 , // (20+1) X 11 + 1
   parameter LENGTH_ET_DC_ERR = 232 
  )
///
(
// input 
   clk               , // system clock
   in_live           ,
   in_err            ,
   spillno           ,
     
// output
   waddr             ,
   wena              ,
   wdata             ,
   out_tlk_err       ,
   out_dc_err        ,
   out_mem_switch    
   
);

input  wire         clk;
input  wire         in_err;
input  wire         in_live;
input  wire [9  :0] spillno;

output reg  [9  :0] waddr;
output reg          wena;
output reg  [231:0] wdata;
output reg          out_tlk_err;
output reg          out_dc_err;
output reg          out_mem_switch;


reg         [2  :0] pipeline;
reg         [231:0] tlk_err_data; // TLK err data
reg         [231:0] dc_err_data;  // Daisy Chain err data
reg         [9  :0] tlk_err_cnt;  // TLK err counter
reg         [9  :0] dc_err_cnt;   // Daisy Chain error counter

reg                 got_tlk_err;
reg                 got_dc_err;

always @(posedge clk)
begin

   if( in_live == 1'b0 )
      begin
         pipeline = 0;
         tlk_err_cnt = 511;
         dc_err_cnt = 511;
         tlk_err_data = 0;
         dc_err_data = 0;
         got_tlk_err = 1'b0;
         got_dc_err = 1'b0;
      end

   wena = 1'b0;
   waddr = spillno;
   out_tlk_err = 1'b1;
   out_dc_err = 1'b1;
   out_mem_switch = 1'b0;

   

   pipeline = pipeline << 1;
   pipeline[0] = in_err;
   
   if( tlk_err_cnt < LENGTH_ET_TLK_ERR )
      begin
         tlk_err_data[tlk_err_cnt] = in_err;
         tlk_err_cnt = tlk_err_cnt + 1;
         if( in_err == 1'b1 )
            got_tlk_err = 1'b1;
      end
  
   if( tlk_err_cnt == LENGTH_ET_TLK_ERR )
      begin
         wena = 1'b1;
         wdata = tlk_err_data;
         out_mem_switch = 1'b0;
         if( got_tlk_err == 1'b0 )
            out_tlk_err = 1'b0;
      end
  
   if( dc_err_cnt < LENGTH_ET_DC_ERR )
      begin
         dc_err_data[dc_err_cnt] = in_err;
         dc_err_cnt = dc_err_cnt + 1;
         if( in_err == 1'b1 )
            got_dc_err = 1'b1;
      end
  
   if( dc_err_cnt == LENGTH_ET_DC_ERR )
      begin
         wena = 1'b1;
         wdata = dc_err_data;
         out_mem_switch = 1'b1;
         if( got_dc_err == 1'b0 )
            out_dc_err = 1'b0;
      end
    
   if( tlk_err_cnt == 511 || dc_err_cnt == 511 )
      begin
         case( pipeline )
            // TLK 
            3'b100 :
               tlk_err_cnt = 0;
            // DC
            3'b101 :
               dc_err_cnt = 0;  
      endcase
   end
   
end

endmodule