`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 11/30/2024 02:51:27 PM
// Design Name: 
// Module Name: tb_RoundFunction
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
module tb_RoundFunction();
  // Parameters
parameter WIDTH = 128;

// Testbench signals
reg  [WIDTH-1:0] data_i_tb;
reg  [WIDTH-1:0] key_i_tb;
wire [WIDTH-1:0] data_o_tb;

// Instantiate the module under test (MUT)
RoundFunction #(WIDTH) uut (
  .data_i(data_i_tb),
  .key_i(key_i_tb),
  .data_o(data_o_tb)
);
  // Testbench logic
initial begin
  // Test case 1
  data_i_tb = 128'hea125a0004455000_0000000000000000;
  key_i_tb  = 128'h0000000000000000_0000000000000000;
  #100;
  $display("Input: %h, Key: %h, Output: %h", data_i_tb, key_i_tb, data_o_tb);

  // Test case 2
  data_i_tb = 128'hffeeddccbbaa9988_7766554433221100;
  #100;
  $display("Input: %h, Key: %h, Output: %h", data_i_tb, key_i_tb, data_o_tb);

  // Test case 3
  data_i_tb = 128'hdeadbeefcafebabe_f00df00dfacecafe;
  #100;
  $display("Input: %h, Key: %h, Output: %h", data_i_tb, key_i_tb, data_o_tb);

  // End simulation
  $stop;
end
endmodule


