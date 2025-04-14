/* 
   Top CDT Design 
*/

module stat_nclus_rev
// other variables
(
// input 
  clk               , // system clock
  
  in_live           ,
  trig              ,
  in_nclus          , 
   
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
input wire         trig;
input wire [3 :0] in_nclus;


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
         clus0_cnt  <= 0;
         clus1_cnt  <= 0;
         clus2_cnt  <= 0;
         clus3_cnt  <= 0;
         clus4_cnt  <= 0;
         clus5_cnt  <= 0;
         clus6_cnt  <= 0;
         clus7_cnt  <= 0;
         clus8_cnt  <= 0;
         clusN_cnt  <= 0;
      end

   if( trig==1'b1 )
      begin
         case( in_nclus )
            0: clus0_cnt <= (clus0_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            1: clus1_cnt <= (clus1_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            2: clus2_cnt <= (clus2_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            3: clus3_cnt <= (clus3_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            4: clus4_cnt <= (clus4_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            5: clus5_cnt <= (clus5_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            6: clus6_cnt <= (clus6_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            7: clus7_cnt <= (clus7_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            8: clus8_cnt <= (clus8_cnt < 16'hFFFF ) ? clus0_cnt + 1 : 16'hFFFF;
            default: clusN_cnt <= (clusN_cnt < 16'hFFFF ) ? clusN_cnt + 1 : 16'hFFFF;         
         endcase
      end
     
   pre_live <= in_live;
      
end

endmodule