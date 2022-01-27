/* 
   Top CDT Design
   C. Lin, 2018.05.14
      
*/

module tag_wrem
(
// input 
  clk               , // system clock
  
  rst               ,
  fiber             , 
  start_evt         ,
 
// output   
  raw_wena          ,
  raw_waddr         ,
  data                 
           
);

input wire         clk;

// inputs
input wire         rst;
input wire [15 :0] fiber;
input wire [15 :0] start_evt;

// output
output reg         raw_wena;
output reg [11 :0] raw_waddr;
output reg [255:0] data;

reg                ena;
reg        [3  :0] cnt;
reg        [11 :0] icycle;
reg                done;

reg        [15 :0] evt_cnt;
reg        [3  :0] iword;
reg        [11 :0] ievt;

always @(posedge clk)
begin
 
   if( rst )
      begin
         raw_wena = 0;
         raw_waddr = 0;
         data = 0;
         iword = 15;
         ena = 1'b0;
         done = 1'b0;
         ievt = 0;
      end

   raw_wena = 1'b0;
   
    
   if( fiber == 16'b1110_1110_1110_1110 && iword > 7 )
      begin
         iword = 0;
         evt_cnt = evt_cnt + 1;
      end

   if( evt_cnt == start_evt + 1 )
      ena = 1'b1;
  
   if( ena == 1'b1 && done == 1'b0 )
      begin
         case( iword )
            0 :
               begin
               data[15:0] = fiber;
               end
            1 :
               begin
               data[31:16] = fiber;
               end
            2 :
               begin
               data[47:32] = fiber;
               end
            3:
               begin
               data[63:48] = fiber;
               end
            4 :
               begin
               data[79:64] = fiber;
               end
            5:
               begin
               data[95:80] = fiber;
               end
            6 :
               begin
               data[111:96] = fiber;
               end
            7 :
               begin
               data[127:112] = fiber;
               end
            default :
               begin
               data[255:128] = 0;
               end
         endcase

         if( iword == 8 )
            begin
               raw_wena = 1'b1;
               if( ievt < 2047 )
                  ievt = ievt + 1;
               else
                  done = 1'b1;
            end
         else
            begin
               raw_wena = 1'b0;
            end
        

      end
      
      
      if( iword < 8 )
         iword = iword + 1;

end

endmodule