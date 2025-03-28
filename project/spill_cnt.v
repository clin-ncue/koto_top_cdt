/* 
   Top CDT Design
   C. Lin, 2018.04.06
   
   2021.11.03 updated
*/

module spill_cnt
(
// input 
   clk               , // system clock  
   in_start          , // input live
  
// control reg           
   system_rst        , 
   nspill            ,
 
// output
   spill_cnt         ,
   live_enabled        
   
);

input  wire         clk;

input  wire         in_start;
input  wire         system_rst;
input  wire [11 :0] nspill;

output reg  [11 :0] spill_cnt = 0;
output reg          live_enabled = 1'b0;

always @(posedge clk)
begin

   if( system_rst )
      spill_cnt = 0;
  
   if( spill_cnt < nspill )
      begin
         live_enabled = 1'b1;
         if( in_start )
            begin
               spill_cnt = spill_cnt + 1;
            end
      end
   else
      begin
         live_enabled = 1'b0;
      end

  
end

endmodule