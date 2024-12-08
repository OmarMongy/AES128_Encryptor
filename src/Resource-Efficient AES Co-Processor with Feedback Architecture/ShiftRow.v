`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf AbdElmongy
// 
// Create Date: 11/28/2024 11:55:08 PM
// Design Name: 
// Module Name: ShiftRow
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
module ShiftRow
#(parameter WIDTH = 128)
(
input      [WIDTH-1:0] data_i,
output     [WIDTH-1:0] data_o
);
// Declare individual bytes
wire [7:0] data_i_15 = data_i[127:120];
wire [7:0] data_i_14 = data_i[119:112];
wire [7:0] data_i_13 = data_i[111:104];
wire [7:0] data_i_12 = data_i[103:96];
wire [7:0] data_i_11 = data_i[95:88];
wire [7:0] data_i_10 = data_i[87:80];
wire [7:0] data_i_9  = data_i[79:72];
wire [7:0] data_i_8  = data_i[71:64];
wire [7:0] data_i_7  = data_i[63:56];
wire [7:0] data_i_6  = data_i[55:48];
wire [7:0] data_i_5  = data_i[47:40];
wire [7:0] data_i_4  = data_i[39:32];
wire [7:0] data_i_3  = data_i[31:24];
wire [7:0] data_i_2  = data_i[23:16];
wire [7:0] data_i_1  = data_i[15:8];
wire [7:0] data_i_0  = data_i[7:0];

wire [31:0] word_1, word_2, word_3, word_4;
 
assign word_1 = {data_i_15, data_i_10, data_i_5, data_i_0};
assign word_2 = {data_i_11, data_i_6, data_i_1, data_i_12};
assign word_3 = {data_i_7, data_i_2, data_i_13, data_i_8};
assign word_4 = {data_i_3, data_i_14, data_i_9, data_i_4};

assign data_o = {word_1, word_2, word_3, word_4};      
endmodule



