// RISCV32i Processor Module
// This module implements a basic RISC-V 32-bit processor with a control unit,
// data path, and memory components. It supports instruction fetch, decode, 
// execution, memory access, and write-back stages.

module RISCV32i(
  input clk,                    // Clock input
  input reset,                  // Reset input
  
  output wr_ena,                // Memory write enable signal
  output [31:0] addr,           // Address for memory operations
  output [31:0] w_data,         // Data to write to memory
  input  [31:0] r_data,          // Data read from memory
  input         stall,
  output        interrupt
);

  // Internal wires for control signals and data
  wire        zero;             // Zero flag for ALU result (used in branching)
  wire        RegWrite;         // Register write enable signal
  wire [1:0]  ImmSrc;           // Immediate source selection
  wire        ALUSrc;           // ALU source selection
  wire        MemWrite;         // Memory write enable signal
  wire [1:0]  ResultSrc;        // Result source selection (ALU or memory)
  wire [2:0]  ALUControl;       // ALU control signal
  wire        PCSrc;            // PC source selection (used for branches)
  wire [31:0] PC;               // Program Counter
  wire [31:0] Instr;            // Instruction fetched from instruction memory
  wire [31:0] ReadData;         // Data read from memory
  wire [31:0] WriteData;        // Data to be written to memory
  wire [31:0] ALUResult;        // Result of ALU operation

  // Control Unit: Decodes instruction and generates control signals
  ctrl_unit u1(
    .zero(zero),                // Zero flag for branching decision
    .op(Instr[6:0]),            // 7-bit opcode from instruction
    .funct3(Instr[14:12]),      // funct3 field from instruction
    .funct7(Instr[30]),         // funct7 field from instruction
    .RegWrite(RegWrite),        // Register write enable signal
    .ImmSrc(ImmSrc),            // Immediate source selection
    .ALUSrc(ALUSrc),            // ALU source selection
    .MemWrite(MemWrite),        // Memory write enable signal
    .ResultSrc(ResultSrc),      // Result source selection
    .ALUControl(ALUControl),    // ALU control signals
    .PCSrc(PCSrc)               // PC source selection (branch decision)
  );
  
  // Data Path: Handles the flow of data between registers, ALU, and memory
  data_path dp(
    .stall(stall),
    .clk(clk),                  // Clock signal
    .reset_n(reset),            // Reset signal (active low)
    .ResultSrc(ResultSrc),      // Result source selection (ALU or memory)
    .ImmSrc(ImmSrc),            // Immediate source selection
    .MemWrite(MemWrite),        // Memory write enable signal
    .ALUSrc(ALUSrc),            // ALU source selection
    .RegWrite(RegWrite),        // Register write enable signal
    .PCSrc(PCSrc),              // PC source selection (branching)
    .ALUControl(ALUControl),    // ALU control signals
    .Instr(Instr),              // Instruction fetched from instruction memory
    .ReadData(ReadData),        // Data read from memory
    .PC(PC),                    // Program counter
    .ALUResult(ALUResult),      // ALU result
    .WriteData(WriteData),      // Data to be written to memory
    .Zero(zero)                 // Zero flag for ALU result (used in branching)
  );
  
  // Data Memory: Handles memory read and write operations
//  ram u3(
//    .clk(clk),                  // Clock signal
//    .reset_n(reset),            // Reset signal (active low)
//    .WE(MemWrite),              // Memory write enable signal
//    .addr(ALUResult),           // Address for memory operation (ALU result)
//    .WD(WriteData),             // Data to be written to memory
//    .RD(ReadData)               // Data read from memory
//  );

  // Instruction Memory: Fetches instructions from memory based on PC
  rom u4(
    .addr(PC),                  // Address of the instruction (Program Counter)
    .data(Instr)                // Instruction fetched from memory
  );
 wire addr_valid = | addr;
  // Assign output signals
  assign addr = ALUResult;      // Memory address is the result of the ALU operation
  assign wr_ena = MemWrite;     // Memory write enable signal
  assign ReadData = r_data;     // Data read from external memory
  assign w_data = WriteData;    // Data to be written to memory
  //assign interrupt = |PC;
  // Interrupt signal logic for memory transaction request
  assign interrupt = (wr_ena || !wr_ena && addr_valid);  

endmodule
