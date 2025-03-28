/* 
   Top CDT Design
   et_peak_sensing block
   C. Lin, 2018.03.27, ver 2
*/

module et_peak_sensing
(
// input 
  clk               , // system clock
  
  // input
  in_et             , // 16-bits et
   
  // control reg
  et_thre           , // 16-bits et thre
    
  // output
  out_et            , // 17-bits et

);

input  wire         clk;

input  wire [15 :0] in_et;
input  wire [15 :0] et_thre;

output reg  [16 :0] out_et;

// vars
reg        [15 :0] et_raw_tmp0;
reg        [15 :0] et_raw_tmp1;
reg        [15 :0] et_raw_tmp2;

reg                pre_is_et;
reg                out_is_et;

always @(posedge clk)
begin
 
   et_raw_tmp2 = et_raw_tmp1;
   et_raw_tmp1 = et_raw_tmp0;
   et_raw_tmp0 = in_et;
  
   out_is_et = pre_is_et;
  
   if(    et_raw_tmp1 >  et_raw_tmp0 
       && et_raw_tmp1 >  et_raw_tmp2 
       && et_raw_tmp1 > et_thre 
     )
      pre_is_et = 1;
   else
      pre_is_et = 0;
   
     
  out_et = { out_is_et , et_raw_tmp2 };
      
end

endmodule