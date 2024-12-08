`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 12/08/2024 06:30:17 PM
// Design Name: 
// Module Name: AES128
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
module AES128
#(parameter WIDTH = 128)
(
input                  clk_i,
input                  rst_n_i,
input                  start,
input  [WIDTH-1:0]     plaintext_i,
input  [WIDTH-1:0]     key_i,

output                 data_ready_o, 
output                 busy_o,
output                 valid_o,
output reg [WIDTH-1:0] ciphertext_o
);

wire [WIDTH-1:0] round_key;
wire             data_valid;
wire [WIDTH-1:0] data_o_final;
wire [WIDTH-1:0] data_o_sb;
wire [WIDTH-1:0] data_o_sr;
wire [WIDTH-1:0] data_int;
wire [WIDTH-1:0] data_feedback;
wire [WIDTH-1:0] key [0:10];

assign key[0] = key_i;

AES_Round_Orchestrator CTRL(
    .clk_i(clk_i),
    .rst_n_i(rst_n_i),
    .start(start),
    .data_i(plaintext_i),
    .data_feedback_i(data_feedback),
    .key_i(key[0]),
    .key_1_i(key[1]),.key_2_i(key[2]),.key_3_i(key[3]),.key_4_i(key[4]),.key_5_i(key[5]),
    .key_6_i(key[6]),.key_7_i(key[7]),.key_8_i(key[8]),.key_9_i(key[9]),.key_10_i(key[10]),
    .data_o(data_int),
    .key_o(round_key),
    .data_valid_o(data_valid),
    .busy_o(busy_o),
    .valid_o(valid_o),
    .done_o(data_ready_o),
    .data_final_o(data_o_final)
);

KeyExpansionFunction_v2 #(WIDTH) KEF (
  .clk_i(clk_i),
  .rst_n_i(rst_n_i),
  .key_ciph_i(key[0]),
  .key_o_1(key[1]),.key_o_2(key[2]),.key_o_3(key[3]),.key_o_4(key[4]),.key_o_5(key[5]),
  .key_o_6(key[6]),.key_o_7(key[7]),.key_o_8(key[8]),.key_o_9(key[9]),.key_o_10(key[10])   
);

RoundFunction RF (
.clk_i(clk_i),
.rst_n_i(rst_n_i),
.data_valid_i(data_valid),
.data_i(data_int),
.key_i(round_key),
.data_o(data_feedback)
);

ByteSub BS(.data_i(data_o_final), .data_o(data_o_sb));
ShiftRow SR(.data_i(data_o_sb), .data_o(data_o_sr));

always@(posedge clk_i, negedge rst_n_i)
begin
    if(!rst_n_i)
        ciphertext_o <= 128'd0;
    else     
        ciphertext_o <= (data_o_sr ^ key[10]) & {128{data_ready_o}};
end
endmodule
