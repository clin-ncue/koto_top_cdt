/* 
   Top CDT Design
   mem_control
   C. Lin, 2018.03.29
*/

module sim_trig
(
// input 
  clk               , // system clock
  
// control reg
  ena_trig          , // start sending trigger
 
// output
  out_rena          , // 1  bit
  out_raddr           // 16 bits 

);

input  wire         clk;

input  wire         ena_trig;

output reg          out_rena;
output reg  [11 :0] out_raddr;

reg                 pre_ena_trig;

always @(posedge clk)
begin

   out_rena = 1'b0;
  
   if(ena_trig)
      begin
         out_rena = 1'b1;
         if( pre_ena_trig == 0 )
            out_raddr = 0;
         else
            begin     
               out_raddr = out_raddr + 1;  
            end
                
      end
     
   pre_ena_trig = ena_trig;
      
end

endmodule