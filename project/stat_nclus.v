/* 
   Top CDT Design 
*/

module stat_nclus
// other variables
(
// input 
  clk               , // system clock
  
  in_live           ,
  in_int_scaled     ,
  in_nclus          ,
  lv1b_req          , 
   
  // output
  clus0_cnt         ,
  clus1_cnt         ,
  clus2_cnt         ,
  clus3_cnt         ,
  clus4_cnt         ,
  clus5_cnt         ,
  clus6_cnt         ,
  clus7_cnt         ,
  clus8_cnt         ,
  clusN_cnt         
                       
);

input wire         clk;

// inputs
input wire         in_live;
input wire [3  :0] in_nclus;
input wire         lv1b_req;
input wire [7  :0] in_int_scaled;

// output
output reg [15:0]  clus0_cnt;
output reg [15:0]  clus1_cnt;
output reg [15:0]  clus2_cnt;
output reg [15:0]  clus3_cnt;
output reg [15:0]  clus4_cnt;
output reg [15:0]  clus5_cnt;
output reg [15:0]  clus6_cnt;
output reg [15:0]  clus7_cnt;
output reg [15:0]  clus8_cnt;
output reg [15:0]  clusN_cnt;

reg pre_live;

always @(posedge clk)
begin
 
// reset counter and pipeline if requested
   if( in_live==1'b1 && pre_live == 1'b0 )
      begin
         clus0_cnt  = 0;
         clus1_cnt  = 0;
         clus2_cnt  = 0;
         clus3_cnt  = 0;
         clus4_cnt  = 0;
         clus5_cnt  = 0;
         clus6_cnt  = 0;
         clus7_cnt  = 0;
         clus8_cnt  = 0;
         clusN_cnt  = 0;
      end

   if( lv1b_req == 1'b1 && in_int_scaled > 0 )
      begin
         case( in_nclus )
            0: clus0_cnt = clus0_cnt + 1;
            1: clus1_cnt = clus1_cnt + 1;
            2: clus2_cnt = clus2_cnt + 1;
            3: clus3_cnt = clus3_cnt + 1;
            4: clus4_cnt = clus4_cnt + 1;
            5: clus5_cnt = clus5_cnt + 1;
            6: clus6_cnt = clus6_cnt + 1;
            7: clus7_cnt = clus7_cnt + 1;
            8: clus8_cnt = clus8_cnt + 1;
            default: clusN_cnt = clusN_cnt + 1;         
         endcase
      end
     
   pre_live = in_live;
      
end

endmodule