module Register_file(
      input clk, reset_n,
      input [4:0] A1, A2,            // Read ports 1 and 2 address
      input [4:0] A3,                // Write address
      input [31:0] WD3,              // Write data
      input WE3,                     // Write enable for port 3
      output reg [31:0] RD1, RD2     // Read data 1 and 2
      );

      reg [31:0] RF [0:31];   // Array to hold registers
      integer i ; 
   
      always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
              for(i=0; i < 2**5 - 1 ; i = i + 1)
                    RF[i] <= 32'd0 ;   
        end
        
        else if (WE3) 
          RF[A3] <= WD3;            // Write operation on rising edge of clock
      end
      
      always @(*) begin
          RD1 = RF[A1];         // Read date
          RD2 = RF[A2];
      end

endmodule
