/* 
   Top CDT Design
   C. Lin
*/

module stat_delta
(
// input 
  clk               , // system clock
  
  // inputs
  in_live           ,
  in_et             , 
  in_veto           , 
  delta_et_thre     ,
  delta_veto_ptn    ,
  
  // output
  ndelta            , 
  et_raw            ,
  veto_raw                   
   
);

input wire         clk;

// inputs
input wire [16 :0] in_et;
input wire         in_live;
input wire [15 :0] in_veto;

// reg
input wire [15 :0] delta_et_thre;
input wire [15 :0] delta_veto_ptn;

// output
output reg [15 :0] ndelta;
output reg [15 :0] et_raw;
output reg [15 :0] veto_raw;

reg                pre_live;

reg        [16 :0] et_raw_tmp0;
reg        [16 :0] et_raw_tmp1;
reg        [16 :0] et_raw_tmp2;

reg        [15 :0] veto_raw_tmp0;
reg        [15 :0] veto_raw_tmp1;
reg        [15 :0] veto_raw_tmp2;

////////////////////////////////////////////
always @(posedge clk)
begin
 
   if( in_live == 1'b0 )
      begin
         et_raw_tmp0 = 0;
         et_raw_tmp1 = 0;
         et_raw_tmp2 = 0;
         
         veto_raw_tmp0 = 0;
         veto_raw_tmp1 = 0;
         veto_raw_tmp2 = 0;
      end

   et_raw_tmp2 = et_raw_tmp1;
   et_raw_tmp1 = et_raw_tmp0;
   et_raw_tmp0 = in_et;
   
   veto_raw_tmp2 = veto_raw_tmp1;
   veto_raw_tmp1 = veto_raw_tmp0;
   veto_raw_tmp0 = in_veto;  
 
   if( pre_live == 1'b0 && in_live == 1'b1 )
      begin
         ndelta = 0;
         et_raw = 0;
         veto_raw = 0;
      end

   if(    et_raw_tmp2 == 17'b0_0000_0000_0000_0000
       && et_raw_tmp1[0] == 1'b1
       && et_raw_tmp1[15:0] > delta_et_thre
       && et_raw_tmp0 == 17'b0_0000_0000_0000
       && veto_raw_tmp2 == 16'b0000_0000_0000_0000
       && veto_raw_tmp1 == delta_veto_ptn
       && veto_raw_tmp0 == 16'b0000_0000_0000_0000
     )
      begin
         ndelta = ndelta + 1;
         et_raw = et_raw_tmp1[15:0];
         veto_raw = veto_raw_tmp1[15:0];
      end 
      
   pre_live = in_live;
      
end

endmodule