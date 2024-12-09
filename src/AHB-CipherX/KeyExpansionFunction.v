`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 12/08/2024 06:53:39 PM
// Design Name: 
// Module Name: KeyExpansionFunction_v2
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
module KeyExpansionFunction
#(parameter WIDTH = 128)
    (
    input                  clk_i,
    input                  rst_n_i,
    input      [WIDTH-1:0] key_ciph_i,
    
    output  [WIDTH-1:0] key_o_1,
    output  [WIDTH-1:0] key_o_2,
    output  [WIDTH-1:0] key_o_3,
    output  [WIDTH-1:0] key_o_4,
    output  [WIDTH-1:0] key_o_5,
    output  [WIDTH-1:0] key_o_6,
    output  [WIDTH-1:0] key_o_7,
    output  [WIDTH-1:0] key_o_8,
    output  [WIDTH-1:0] key_o_9,
    output  [WIDTH-1:0] key_o_10
    );
    wire [WIDTH-1:0] key [0:10];
    wire [(WIDTH/4)-1:0] rcon [0:9];
    
    assign  rcon[0] = 32'h01000000;
    assign  rcon[1] = 32'h02000000;
    assign  rcon[2] = 32'h04000000;
    assign  rcon[3] = 32'h08000000;
    assign  rcon[4] = 32'h10000000;
    assign  rcon[5] = 32'h20000000;
    assign  rcon[6] = 32'h40000000;
    assign  rcon[7] = 32'h80000000;
    assign  rcon[8] = 32'h1b000000;
    assign  rcon[9] = 32'h36000000;
    assign  key[0]  = key_ciph_i;  

                    
assign key_o_1  = key[1];
assign key_o_2  = key[2];
assign key_o_3  = key[3];
assign key_o_4  = key[4];
assign key_o_5  = key[5];
assign key_o_6  = key[6];
assign key_o_7  = key[7];
assign key_o_8  = key[8];
assign key_o_9  = key[9];
assign key_o_10 = key[10];
               
    genvar i;
    generate
        for (i = 0; i < 10; i = i + 1) begin : stage
            KeyExpansionRound KER (
                .clk_i(clk_i),
                .rst_n_i(rst_n_i),
                .key_i(key[i]),
                .rcon_i(rcon[i]),
                .key_o(key[i+1])
            );
        end
    endgenerate
    
    endmodule

