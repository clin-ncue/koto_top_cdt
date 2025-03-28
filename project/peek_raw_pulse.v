/* 
   Top CDT Design
   C. Lin
*/

module peek_raw_pulse
(
// input 
  clk               , // system clock
  reset             ,
  
  // inputs
  in_et             , // et input     ( 17 bits )
  in_veto           , // veto input   ( 16 bits )
  flag              ,
  et_thre           ,
  
  // output
  et_raw            ,
  veto_raw          ,
  et_peak              
   
);

input wire         clk;

// inputs
input wire [16 :0] in_et;
input wire [15 :0] in_veto;
input wire [1  :0] flag;
input wire [15 :0] et_thre;
input wire         reset;

// output
output reg [15 :0] et_raw;
output reg [15 :0] veto_raw;
output reg         et_peak;

////////////////////////////////////////////
always @(posedge clk)
begin
 
   if( reset == 1'b1 )
      begin
         et_raw = 0;
         veto_raw = 0;
         et_peak = 1'b0;
      end
 
   if( flag == 2'b00 && in_et[16]==1'b1 && in_et[15:0] > et_thre )
      begin
         et_raw = in_et[15:0];
         veto_raw = in_veto[15:0];
         et_peak = in_et;
      end
      
   if( flag == 2'b01 && in_veto > 0 )
      begin
         et_raw = in_et[15:0];
         veto_raw = in_veto[15:0];
         et_peak = in_et[16];
      end
   
   if( flag == 2'b10 && in_et[16]==1'b1 && in_veto > 0 && in_et[15:0] > et_thre )
      begin
         et_raw = in_et[15:0];
         veto_raw = in_veto[15:0];
         et_peak = in_et[16];
      end
  
   if( flag == 2'b11 && (in_et[16]==1'b1 || in_veto > 0 ) )
      begin
         et_raw = in_et[15:0];
         veto_raw = in_veto[15:0];
         et_peak = in_et[16];
      end
    
end

endmodule