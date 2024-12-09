`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Omar Ashraf Abd El Mongy
// 
// Create Date: 12/08/2024 05:43:46 PM
// Design Name: 
// Module Name: AES_Round_Orchestrator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: AES round orchestrator with fixed counter and state machine logic
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module AES_Round_Orchestrator
#(parameter WIDTH = 128)
(
    input   clk_i,
    input   rst_n_i,
    input   start,

    input   [WIDTH-1:0] data_i,
    input   [WIDTH-1:0] data_feedback_i,
    input   [WIDTH-1:0] key_i,
    input   [WIDTH-1:0] key_1_i,
    input   [WIDTH-1:0] key_2_i,
    input   [WIDTH-1:0] key_3_i,
    input   [WIDTH-1:0] key_4_i,
    input   [WIDTH-1:0] key_5_i,
    input   [WIDTH-1:0] key_6_i,
    input   [WIDTH-1:0] key_7_i,
    input   [WIDTH-1:0] key_8_i,
    input   [WIDTH-1:0] key_9_i,
    input   [WIDTH-1:0] key_10_i,

    output reg [WIDTH-1:0] data_o,
    output reg [WIDTH-1:0] data_final_o,
    output reg [WIDTH-1:0] key_o,
    output reg data_valid_o,
    output reg busy_o,
    output     valid_o,
    output reg done_o
);

    // State and counter declarations
    reg [2:0] state_reg, state_next;
    reg [3:0] counter;
    reg [WIDTH-1:0] data_feedback;

    // Key array for round keys
    wire [WIDTH-1:0] key [1:10];
    assign key[1] = key_1_i;
    assign key[2] = key_2_i;
    assign key[3] = key_3_i;
    assign key[4] = key_4_i;
    assign key[5] = key_5_i;
    assign key[6] = key_6_i;
    assign key[7] = key_7_i;
    assign key[8] = key_8_i;
    assign key[9] = key_9_i;
    assign key[10] = key_10_i;
    
    //Valid and Busy Flag
    assign valid_o = ~ busy_o;
    
    // State encoding
    localparam IDLE          = 3'b000,
               START         = 3'b001,
               ROUND_PROCESS = 3'b010,
               NEXT_ROUND    = 3'b011,
               DONE          = 3'b100;

    // State register and counter
    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            state_reg <= IDLE;
            counter <= 4'b0000;
        end else begin
            state_reg <= state_next;

            // Counter logic
            if (state_reg == ROUND_PROCESS && counter < 4'd10)
                counter <= counter + 1;
            else if (state_reg == START)
                counter <= 4'b0001;              
            else if (state_reg == DONE || state_reg == IDLE)
                counter <= 4'b0000;
        end
    end

    // Next-state logic and output generation
    always @(*) begin
        // Default signal assignments
        state_next = state_reg;
        done_o = 1'b0;
        busy_o = 1'b1;
        data_feedback = data_feedback;
        data_o = data_o;
        data_valid_o = 1'b0;
        data_final_o = 128'd0;
        key_o = key_o;

        case (state_reg)
            IDLE: begin
                if (start)
                    state_next = START;
                else begin
                    state_next = IDLE;
                    busy_o = 1'b0;
                    data_valid_o = 1'b0;
                end
            end

            START: begin
                busy_o = 1'b1;
                state_next = ROUND_PROCESS;
                data_feedback = data_i ^ key_i;
            end

            ROUND_PROCESS: begin
                if (counter == 4'd10) begin
                    state_next = DONE;
                end else begin
                    key_o = key[counter];
                    data_valid_o = 1'b1;
                    data_o = data_feedback;
                    state_next = NEXT_ROUND;
                end
            end

            NEXT_ROUND: begin
                data_valid_o = 1'b0;
                data_feedback = data_feedback_i;
                state_next = ROUND_PROCESS;
            end

            DONE: begin
                busy_o = 1'b0;
                done_o = 1'b1;
                data_final_o = data_feedback;
            end
        endcase
    end

endmodule
