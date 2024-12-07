`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 12:18:00 AM
// Design Name: 
// Module Name: KeyExpansionFunction
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
input                  key_valid_i,
input      [WIDTH-1:0] key_ciph_i,

output reg [WIDTH-1:0] key_o_1,
output reg [WIDTH-1:0] key_o_2,
output reg [WIDTH-1:0] key_o_3,
output reg [WIDTH-1:0] key_o_4,
output reg [WIDTH-1:0] key_o_5,
output reg [WIDTH-1:0] key_o_6,
output reg [WIDTH-1:0] key_o_7,
output reg [WIDTH-1:0] key_o_8,
output reg [WIDTH-1:0] key_o_9,
output reg [WIDTH-1:0] key_o_10
);
wire [WIDTH-1:0] key [0:10];
reg  [WIDTH-1:0] temp;
wire [(WIDTH/4)-1:0] rcon [0:10];

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
assign  key[0]  = temp;
always@(*)
    begin
        if(key_valid_i)
        temp  = key_ciph_i;
        else
        temp  = temp;
    end    
always@(posedge clk_i, negedge rst_n_i) 
    begin
        if(!rst_n_i)
            begin
            key_o_1  = 128'd0;
            key_o_2  = 128'd0;
            key_o_3  = 128'd0;
            key_o_4  = 128'd0;
            key_o_5  = 128'd0;
            key_o_6  = 128'd0;
            key_o_7  = 128'd0;
            key_o_8  = 128'd0;
            key_o_9  = 128'd0;
            key_o_10 = 128'd0;
            end
        else
            begin    
            key_o_1  = key[1];
            key_o_2  = key[2];
            key_o_3  = key[3];
            key_o_4  = key[4];
            key_o_5  = key[5];
            key_o_6  = key[6];
            key_o_7  = key[7];
            key_o_8  = key[8];
            key_o_9  = key[9];
            key_o_10 = key[10];
            end
    end
    
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




