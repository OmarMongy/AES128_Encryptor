module PC(
    input  stall,
    input  clk,
    input  reset_n,
    input  [31:0] inp,
    output reg [31:0] out
    );       
always @(posedge clk, negedge reset_n)
begin 
 if (!reset_n)
     out <= 32'd0;
else if(stall)
     out <= out;
     else
     out <= inp;
end
endmodule
