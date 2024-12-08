`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 12/01/2024 01:18:05 AM
// Design Name: 
// Module Name: AES_Enc
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
module AES128_Encryptor
#(parameter WIDTH = 128)
(
input              clk_i,
input              rst_n_i,

input  [WIDTH-1:0] plaintext_i,
input  [WIDTH-1:0] key_i,

input                  data_valid_i,
input                  key_valid_i,

output                 data_ready_o, 
output                 busy_o, 
output reg [WIDTH-1:0] ciphertext_o
);

AES_Controller AC(
    .clk(clk_i),
    .rst_n(rst_n_i),
    .data_valid(data_valid_i),
    .data_ready(data_ready_o),
    .busy(busy_o)
);

KeyExpansionFunction #(WIDTH) KEF (
  .clk_i(clk_i),
  .rst_n_i(rst_n_i),
  .key_valid_i(key_valid_i),
  .key_ciph_i(key[0]),
  .key_o_1(key[1]),
  .key_o_2(key[2]),
  .key_o_3(key[3]),
  .key_o_4(key[4]),
  .key_o_5(key[5]),
  .key_o_6(key[6]),
  .key_o_7(key[7]),
  .key_o_8(key[8]),
  .key_o_9(key[9]),
  .key_o_10(key[10])   
);
wire [WIDTH-1:0] data_o_final;
wire [WIDTH-1:0] data_o_sb;
wire [WIDTH-1:0] data_o_sr;
wire [WIDTH-1:0] data[0:9];
wire [WIDTH-1:0] key [0:10];

assign data[0] = (plaintext_i ^ key_i);
assign data_o_final = data[9];
assign key[0]   = key_i;

genvar i;

generate
    for (i = 1; i < 10; i = i + 1) begin : stage
        RoundFunction RF (
            .clk_i(clk_i),
            .rst_n_i(rst_n_i),
            .data_valid_i(data_valid_i),
            .data_i(data[i-1]),
            .key_i(key[i]),
            .data_o(data[i])
        );
    end
endgenerate


ByteSub BS(.data_i(data_o_final), .data_o(data_o_sb));

ShiftRow SR(.data_i(data_o_sb), .data_o(data_o_sr));

always@(posedge clk_i)
begin
    if(!rst_n_i)
        ciphertext_o = 128'd0;
    else     
        ciphertext_o = (data_o_sr ^ key[10]) & {128{data_ready_o}};
end
endmodule
