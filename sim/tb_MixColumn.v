`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 12/02/2024 09:43:38 PM
// Design Name: 
// Module Name: tb_MixColumn
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


module tb_MixColumn();

      // Parameters
      parameter WIDTH = 128;
    
      // Testbench signals
      reg  [WIDTH-1:0] data_i_tb;
      wire [WIDTH-1:0] data_o_tb;
    
      // Instantiate the module under test (UUT)
      MixColumn #(WIDTH) uut (
        .data_i(data_i_tb),
        .data_o(data_o_tb)
      );
    
      // Testbench logic
      initial begin
        // Test case 
        data_i_tb     = 128'ha14f3df3_78e803fc_10d5a8df_4c632923;
        #100;
        // End simulation
        $stop;
      end    
endmodule
