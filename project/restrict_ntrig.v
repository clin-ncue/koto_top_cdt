/* 
   Top CDT Design
   C. Lin
*/

module restrict_ntrig
(
// input 
  clk               ,
  rst               ,
  
  // inputs
  user_ena          ,
  early_lv1         ,
  ntrig             ,
 
  // output 
  ena_lv1
  
);

input wire         clk;

// inputs
input wire         rst;
input wire         user_ena;
input wire         early_lv1;
input wire [9  :0] ntrig;

// output
output reg         ena_lv1;

// var
reg        [9  :0] cnt;


////////////////////////////////////////////
always @(posedge clk)
begin
 
   if( rst == 1'b1 )
      begin
         cnt = 0;
      end

   if( user_ena == 1'b0 )
      ena_lv1 = 1'b1;
   else if( user_ena == 1'b1 && early_lv1 == 1'b1 )
      cnt = cnt + 1;
   
   if( user_ena == 1'b1 && cnt > ntrig )
      ena_lv1 = 1'b0;
      
end

endmodule