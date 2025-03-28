/* 
   Top CDT Design 
*/

module stat_veto
// other variables
(
// input 
  clk               , // system clock
  
  in_live           ,
  in_veto           ,
     
  // output
  veto_cnt                    
     
);

input wire         clk;

// inputs
input wire         in_live;
input wire         in_veto;

// output
output reg [31:0]  veto_cnt;

reg pre_live;
reg pre_veto;

always @(posedge clk)
begin
 
// reset counter and pipeline if requested
   if( in_live==1'b1 && pre_live == 1'b0 )
      begin
         veto_cnt  = 0;
      end

   if( pre_veto == 1'b0 && in_veto == 1'b1 )
      veto_cnt= veto_cnt + 1;
     
   pre_live = in_live;
   pre_veto = in_veto;
      
end

endmodule