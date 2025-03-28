/* 
   Top CDT Design
   lv1a_generator
   C. Lin, 2018.03.29
*/

module lv1a_generator
///
(
// input 
   clk               , // system clock
   in_live           , // input_live
   in_ena            , //

// control reg   
   ena_lv1a_gen      , // start sending trigger
   lv1a_gap          ,
 
// output
   out_lv1a       
   
);

input  wire         clk;

input  wire         in_live;
input  wire         in_ena;  
input  wire         ena_lv1a_gen;
input  wire [9  :0] lv1a_gap;

output reg          out_lv1a;

reg                 pre_ena_lv1a_gen;
reg         [9  :0] cnt;

always @(posedge clk)
begin

   out_lv1a = 1'b0;

   if( ena_lv1a_gen == 1 && in_live == 1 && in_ena == 1 )
      begin
         if( pre_ena_lv1a_gen == 0 )
            cnt = 0;
         else if( cnt < lv1a_gap - 1 )
            cnt = cnt + 1;
         else
            cnt = 0;
         
         
         if( cnt == 0 )
            out_lv1a = 1'b1;
            
      end
   
   pre_ena_lv1a_gen = ena_lv1a_gen;
   
end

endmodule