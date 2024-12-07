`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 02:05:08 PM
// Design Name: 
// Module Name: AES_Controller
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
module AES_Controller (
    input  wire clk,             // Clock signal
    input  wire rst_n,           // Active-low reset
    input  wire data_valid,      // Input data valid signal
    output reg  data_ready,       // Output data ready signal
    output reg  busy
);

    reg [4:0] cycle_counter;    // 5-bit counter to count clock cycles
    reg processing;             // Indicates processing is ongoing

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycle_counter <= 0;
            data_ready <= 0;
            processing <= 0;
            busy <=0;
        end else begin
            if (data_valid && !processing) begin
                // Start processing on a valid input
                processing <= 1;
                data_ready <= 0;
                busy <=1;
            end else if (processing) begin
                if (cycle_counter == 21) begin
                    // Assert `data_ready` after 10 clock cycles
                    data_ready <= 1;
                    processing <= 0; // Stop processing
                    cycle_counter <= cycle_counter; // Reset counter for next input
                    busy <=0;
                end else begin
                    // Increment counter while processing
                    cycle_counter <= cycle_counter + 1;
                end
            end else begin
                // Default state when not processing
                data_ready <= data_ready;
                busy <= busy;
            end
        end
    end
endmodule
