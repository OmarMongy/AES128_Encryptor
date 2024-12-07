`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 11/29/2024 12:17:56 AM
// Design Name: 
// Module Name: ShiftRow_tb
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
module tb_ShiftRow;

  // Parameters
  parameter WIDTH = 128;

  // Testbench signals
  reg  [WIDTH-1:0] data_i;
  wire [WIDTH-1:0] data_o;

  // Instantiate the module under test (MUT)
  ShiftRow #(WIDTH) uut (
    .data_i(data_i),
    .data_o(data_o)
  );

  // Testbench logic
  initial begin
    // Test case 1
    data_i = 128'h52502f2885a45ed7_e311c807f6cf6a94;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // Test case 2
    data_i = 128'he14fd29be8fbfbba_35c89653976cae7c;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // Test case 3
    data_i = 128'ha163a8fc784f29df_10e83d234cd503fe;
    #10;
    $display("Input: %h, Output: %h", data_i, data_o);

    // End simulation
    $finish;
  end

endmodule
