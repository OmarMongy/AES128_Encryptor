`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 09:39:59 PM
// Design Name: 
// Module Name: tb_SoC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_SoC();

reg clk, reset_n;

top_SoC uut(
.global_clk(clk),
.global_rst_n(reset_n)
);
  initial begin
        clk = 0;
        forever #1 clk = ~clk; // 100 MHz clock
    end
  initial begin
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        #500;
        $stop;
    end
    
endmodule
