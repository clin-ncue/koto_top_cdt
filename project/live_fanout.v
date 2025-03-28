/* 
   Top CDT Design
   C. Lin, 2018.04.06
*/

module live_fanout
(
// input 
   clk               , // system clock  
   in_live           , // input live
   live_disabled     , 
  
// control reg           
   test_mode         , // test mode
 
// output
   ena_live_fanout   
   
);

input  wire         clk;

input  wire         in_live;
input  wire         test_mode;
input  wire         live_disabled;

output reg          ena_live_fanout;

reg                 pre_test_mode;
reg                 pre_live;
reg                 get_first_live;

reg                 is_pass_first_live;

always @(posedge clk)
begin

   if( test_mode == 1'b1 )
      begin
         is_pass_first_live = 1'b0;
         get_first_live = 1'b0;
      end

   if( test_mode == 1'b0 && pre_test_mode == 1'b1 )
      begin
         if( in_live == 1'b1 )
            get_first_live = 1'b1;
         else
            get_first_live = 1'b0;         
      end
     
   if( pre_live == 1'b1 && in_live == 1'b0 && get_first_live == 1'b1 )
      is_pass_first_live = 1'b1;
      
   if( test_mode == 1'b0 && in_live == 1'b1 && get_first_live == 1'b0 )
      get_first_live = 1'b1;
      
   if( is_pass_first_live == 1'b1 )
      ena_live_fanout = 1'b1;
   else
      ena_live_fanout = 1'b0;

   if( live_disabled )
      ena_live_fanout = 1'b0;

   pre_live = in_live;
   pre_test_mode = test_mode;
   
end

endmodule