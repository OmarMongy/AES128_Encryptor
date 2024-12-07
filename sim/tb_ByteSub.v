`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 11/30/2024 03:00:39 PM
// Design Name: 
// Module Name: tb_ByteSub
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


module tb_ByteSub();

  // Parameters
  parameter WIDTH = 128;

  // Testbench signals
  reg  [WIDTH-1:0] data_i;
  wire [WIDTH-1:0] data_o;

  // Instantiate the module under test (MUT)
  ByteSub #(WIDTH) uut (
    .data_i(data_i),
    .data_o(data_o)
  );

  // Testbench logic
  initial begin
    // Test case 1
    data_i = 128'hea125a0004455000_0000000000000000;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // Test case 2
    data_i = 128'hffeeddccbbaa9988_7766554433221100;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // Test case 3
    data_i = 128'hdeadbeefcafebabe_f00df00dfacecafe;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // End simulation
    $finish;
  end
endmodule
