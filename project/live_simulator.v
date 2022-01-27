/* 
   Top CDT Design
   mem_control
   C. Lin, 2018.03.29
*/

module live_simulator
#( parameter PERIOD = 750000000 , 
   parameter LIVE_ON_PERIOD = 562500000
  )
///
(
// input 
   clk               , // system clock
  
// control reg
   ena_live_sim      , // start sending trigger
   
// output
   out_live_sim       
   
);

input  wire         clk;

input  wire         ena_live_sim;

output reg          out_live_sim;

reg                 pre_ena_live_sim;
reg        [31 :0]  cnt;

always @(posedge clk)
begin

   out_live_sim = 1'b0;

   if( ena_live_sim )
      begin
         if( pre_ena_live_sim == 0 )
            cnt = 0;
         else
            cnt = cnt + 1;
         
         if( cnt < LIVE_ON_PERIOD )
            out_live_sim = 1'b1;
            
         if( cnt == PERIOD )
            cnt = 0;
      
      end
   else
      cnt = 0;
   
   pre_ena_live_sim = ena_live_sim;
   
end

endmodule