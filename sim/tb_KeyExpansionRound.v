`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 12/01/2024 12:26:33 AM
// Design Name: 
// Module Name: tb_KeyExpansion
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
module tb_KeyExpansionRound();
  // Parameters
parameter WIDTH = 128;

// Testbench signals
reg  [WIDTH-1:0] key_ciph_i_tb;
wire [WIDTH-1:0] key_o_tb;

// Instantiate the module under test (MUT)
KeyExpansionRound #(WIDTH) uut (
  .key_i(key_ciph_i_tb),
  .rcon_i(32'h01000000),
  .key_o(key_o_tb)  
);
  // Testbench logic
initial begin
// Test case Cipher Key = 2b 7e 15 16 28 ae d2 a6 ab f7 15 88 09 cf 4f 3c
key_ciph_i_tb = 128'h2b7e151628aed2a6abf7158809cf4f3c;
#100;
// End simulation
$stop;
end
endmodule
