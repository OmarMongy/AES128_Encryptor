`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 09:23:31 PM
// Design Name: 
// Module Name: tb_AES_Enc
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


module tb_AES128_Encryptor();
  // Parameters
  parameter WIDTH = 128;
  
  // Testbench signals
  reg              clk_i;
  reg              rst_n_i;
  
  reg  [WIDTH-1:0] plaintext_i;
  reg  [WIDTH-1:0] key_i;

  reg                  key_valid_i;
  reg                  data_valid_i;
  wire                 data_ready_o;
  wire                 busy_o;
  wire     [WIDTH-1:0] ciphertext_o;
  

  // Instantiate the module under test (UUT)
  AES128_Encryptor #(WIDTH) uut (
    .clk_i(clk_i),
    .rst_n_i(rst_n_i),
    .data_valid_i(data_valid_i),
    .key_valid_i(key_valid_i),
    .plaintext_i(plaintext_i),
    .key_i(key_i),
    .data_ready_o(data_ready_o),
    .busy_o(busy_o),
    .ciphertext_o(ciphertext_o)   
  );
  initial
      begin
          forever #5 clk_i = ~ clk_i;
      end
    // Testbench logic
  initial begin
  clk_i = 1'b0;
  rst_n_i = 1'b0;
  data_valid_i = 1'b0;
  key_valid_i  = 1'b0;
  plaintext_i = 128'h0;
  key_i = 128'h0;
  #10;
  rst_n_i = 1'b1;
  // Test case Cipher Key = 2b 7e 15 16 28 ae d2 a6 ab f7 15 88 09 cf 4f 3c
  #10;
  key_valid_i  = 1'b1;
  key_i       = 128'h2b7e151628aed2a6abf7158809cf4f3c;
  #20;
  data_valid_i  = 1'b1;
  // Test case Input Data = 32 43 f6 a8 88 5a 30 8d 31 31 98 a2 e0 37 07 34
  plaintext_i = 128'h3243f6a8885a308d313198a2e0370734;
  #30;
  data_valid_i = 1'b0;
  key_valid_i  = 1'b0;
  #300;
  // End simulation
  $stop;
  end
  endmodule
