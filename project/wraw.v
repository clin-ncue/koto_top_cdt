/* 
   Top CDT Design
   C. Lin, 2018.05.14
      
*/

module wraw
(
// input 
  clk               , // system clock
  
  rst               ,
  in_et             , 
  in_veto           ,
  in_veto2          ,
  align_trig        ,
  delta_trig        ,
  user_sw           ,      
 
// output   
  raw_wena          ,
  raw_waddr         ,
  et256             ,
  veto256           ,
  veto256_2         ,     
           
);

input wire         clk;

// inputs
input wire         rst;
input wire [15 :0] in_et;
input wire [15 :0] in_veto;
input wire [15 :0] in_veto2;
input wire         align_trig;
input wire         delta_trig;
input wire         user_sw;

// output
output reg         raw_wena;
output reg [9  :0] raw_waddr;
output reg [255:0] et256;
output reg [255:0] veto256;
output reg [255:0] veto256_2;

reg                ena;
reg        [3  :0] cnt;
reg                done;

always @(posedge clk)
begin
 
   if( rst )
      begin
         ena = 1'b0;
         raw_wena = 0;
         raw_waddr = 0;
         et256 = 0;
         veto256 = 0;
         veto256_2 = 0;
         cnt = 0;
         raw_waddr = 0;
         done = 1'b0;
      end

   raw_wena = 1'b0;
   
   if(    (user_sw==1'b0 && align_trig==1'b1) 
       || (user_sw==1'b1 && delta_trig==1'b1)  ) ena=1'b1;

   if( ena == 1'b1 && done == 1'b0 )
      begin
         case( cnt )
            0 :
               begin
               et256[15:0] = in_et;
               veto256[15:0] = in_veto;
               veto256_2[15:0] = in_veto2;
               end
            1 :
               begin
               et256[31:16] = in_et;
               veto256[31:16] = in_veto;
               veto256_2[31:16] = in_veto2;
               end
            2 :
               begin
               et256[47:32] = in_et;
               veto256[47:32] = in_veto;
               veto256_2[47:32] = in_veto2;
               end
            3:
               begin
               et256[63:48] = in_et;
               veto256[63:48] = in_veto;
               veto256_2[63:48] = in_veto2;
               end
            4 :
               begin
               et256[79:64] = in_et;
               veto256[79:64] = in_veto;
               veto256_2[79:64] = in_veto2;
               end
            5:
               begin
               et256[95:80] = in_et;
               veto256[95:80] = in_veto;
               veto256[95:80] = in_veto2;
               end
            6 :
               begin
               et256[111:96] = in_et;
               veto256[111:96] = in_veto;
               veto256_2[111:96] = in_veto2;
               end
            7 :
               begin
               et256[127:112] = in_et;
               veto256[127:112] = in_veto;
               veto256_2[127:112] = in_veto2;
               end
            8 :
               begin
               et256[143:128] = in_et;
               veto256[143:128] = in_veto;
               veto256_2[143:128] = in_veto2;
               end
            9 :
               begin
               et256[159:144] = in_et;
               veto256[159:144] = in_veto;
               veto256_2[159:144] = in_veto2;
               end
            10:
               begin
               et256[175:160] = in_et;
               veto256[175:160] = in_veto;
               veto256_2[175:160] = in_veto2;
               end
            11:
               begin
               et256[191:176] = in_et;
               veto256[191:176] = in_veto;
               veto256_2[191:176] = in_veto2;
               end
            12:
               begin
               et256[207:192] = in_et;
               veto256[207:192] = in_veto;
               veto256_2[207:192] = in_veto2;
               end
            13:
               begin
               et256[223:208] = in_et;
               veto256[223:208] = in_veto;
               veto256_2[223:208] = in_veto2;
               end
            14:
               begin
               et256[239:224] = in_et;
               veto256[239:224] = in_veto;
               veto256_2[239:224] = in_veto2;
               end
            15:
               begin
               et256[255:240] = in_et;
               veto256[255:240] = in_veto;
               veto256_2[255:240] = in_veto2;
               end
         endcase

         if( cnt == 15 )
            raw_wena = 1'b1;
         else
            raw_wena = 1'b0;
         
         cnt = cnt + 1;

         if( cnt==15 )
            begin
               if( raw_waddr < 1023 )
                  raw_waddr = raw_waddr + 1;
               else
                  done = 1'b1;
            end

      end

end

endmodule