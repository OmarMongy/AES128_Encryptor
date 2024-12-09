`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 09:04:08 PM
// Design Name: 
// Module Name: tb_aes_ahb_interface
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
`timescale 1ns / 1ps

module tb_top_aes();

    // Testbench signals
    reg        HCLK;
    reg        HRESETn;
    reg        HSEL;
    reg [31:0] HADDR;
    reg        HWRITE;
    reg        HREADY;
    reg [31:0] HWDATA;
    wire [31:0] HRDATA;
    wire        HRESP;

    // Instantiate the AES top module
    aes_core uut (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSEL(HSEL),
        .HADDR(HADDR),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HWDATA(HWDATA),
        .HRDATA(HRDATA),
        .HRESP(HRESP)
    );

    // Clock generation
    initial begin
        HCLK = 0;
        forever #5 HCLK = ~HCLK; // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        HRESETn = 0;
        HSEL = 0;
        HADDR = 0;
        HWRITE = 0;
        HREADY = 1;
        HWDATA = 0;

        // Reset the DUT
        #10 HRESETn = 1;

        // Write key
        write_to_address(32'h0000, 32'h09cf4f3c); // KEY0
        write_to_address(32'h0004, 32'habf71588); // KEY1
        write_to_address(32'h0008, 32'h28aed2a6); // KEY2
        write_to_address(32'h000C, 32'h2b7e1516); // KEY3

        // Write plaintext
        write_to_address(32'h0010, 32'he0370734); // TEXT0
        write_to_address(32'h0014, 32'h313198a2); // TEXT1
        write_to_address(32'h0018, 32'h885a308d); // TEXT2
        write_to_address(32'h001C, 32'h3243f6a8); // TEXT3

        // Start encryption
        write_to_address(32'h0020, 32'h1); // Start signal

        // Wait for encryption process
         wait (HRESP);

        // Read ciphertext
        read_from_address(32'h0024); // CIPHER0
        read_from_address(32'h0028); // CIPHER1
        read_from_address(32'h002C); // CIPHER2
        read_from_address(32'h0030); // CIPHER3

        // End simulation
        #20 $finish;
    end

    // Task to write to a register
    task write_to_address;
        input [31:0] addr;
        input [31:0] data;
        begin
            @ (posedge HCLK);
            HSEL = 1;
            HWRITE = 1;
            HADDR = addr;
            HWDATA = data;
            HREADY = 1;
            @ (posedge HCLK);
            HSEL = 0;
            HWRITE = 0;
            HADDR = 0;
            HWDATA = 0;
        end
    endtask

    // Task to read from a register
    task read_from_address;
        input [31:0] addr;
        begin
            @ (posedge HCLK);
            HSEL = 1;
            HWRITE = 0;
            HADDR = addr;
            @ (posedge HCLK);
            if (HREADY) begin
                $display("Read from 0x%08X: 0x%08X", addr, HRDATA);
            end else begin
                $display("Read from 0x%08X failed. HREADY not asserted.", addr);
            end
            HSEL = 0;
        end
    endtask

    // Task to wait for HREADY signal
    /*task wait_for_ready;
        begin
            @ (posedge HCLK);
            while (!HREADY) begin
                @ (posedge HCLK);
            end
        end
    endtask*/

endmodule


