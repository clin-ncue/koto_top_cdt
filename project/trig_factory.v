/* 
   Top CDT Design
   C. Lin
*/

module trig_factory
(
// input 
   clk               , // system clock
   rst               ,
   user_ena          ,
   user_trig_ptn     ,
   user_gap          ,
   user_ntrig        ,
     
// output
   trig              
);   

input  wire         clk;
input  wire         rst;

input  wire         user_ena;
input  wire [2  :0] user_trig_ptn;
input  wire [11 :0] user_gap;
input  wire [15 :0] user_ntrig;

output reg          trig;

reg         [15 :0] trig_cnt;
reg         [12 :0] gap_cnt;
reg         [1  :0] iheader;

always @(posedge clk)
begin

   if( rst )
      begin
         trig_cnt = 0;
         gap_cnt = 0;
         iheader = 0;
      end

   if( user_ena == 1'b1 && trig_cnt < user_ntrig )
      begin
         
      trig = 1'b0;
         
         if( gap_cnt < user_gap )
            begin
               gap_cnt = gap_cnt + 1;
               iheader = 0;
            end
         else 
            begin
               case( iheader )
                  0 : trig = 1'b1;
                  1 : trig = user_trig_ptn[2];
                  2 : trig = user_trig_ptn[1];
                  3 : trig = user_trig_ptn[0];
                  default : trig = 1'b0;
               endcase 
               
               if( iheader == 3 )
                  begin
                     gap_cnt = 0;
                     trig_cnt = trig_cnt + 1;
                  end
               else
                  iheader = iheader + 1;
               
            end
         
      end
      else
		trig = 1'b0;
  
end

endmodule