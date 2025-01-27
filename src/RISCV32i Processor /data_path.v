// Module: data_ph
// Description: This module implements the datapath for a processor including the program counter, ALU, and supporting components.

module data_path(
  input stall,
  input clk, reset_n,               // Clock and asynchronous active-low reset signals
  input [1:0] ResultSrc, ImmSrc,   // Control signals for selecting result and immediate source
  
  input MemWrite, ALUSrc, RegWrite, PCSrc,  // Control signals for memory, ALU, and PC
  input [2:0] ALUControl,                  // ALU control signal
  
  input [31:0] Instr, ReadData,           // Instruction and memory read data inputs
  output [31:0] PC,                       // Program counter output
  output [31:0] ALUResult,                // ALU result output
  output [31:0] WriteData,                // Data to be written to memory
  output Zero                             // ALU zero flag output
);

  // Internal signals
  wire [31:0] SrcA, SrcB;                 // ALU source operands
  wire [31:0] ImmExt;                     // Sign-extended immediate value
  wire [31:0] PCPlus4;                    // PC + 4 value
  wire [31:0] PCTarget;                   // Target PC value
  wire [31:0] PCNext;                     // Next PC value
  wire [31:0] Result;                     // Selected result value

  // Register file instantiation
  Register_file U1(
    .clk(clk),
    .reset_n(reset_n),
    .A1(Instr[19:15]),        // Source register 1 address
    .A2(Instr[24:20]),        // Source register 2 address
    .A3(Instr[11:7]),         // Destination register address
    .WD3(Result),             // Data to write to destination register
    .WE3(RegWrite),           // Write enable signal
    .RD1(SrcA),               // Read data from source register 1
    .RD2(WriteData)           // Read data from source register 2
  );

  // ALU source operand multiplexer
  Mux U2(
    .in0(WriteData),          // Source register 2 data
    .in1(ImmExt),             // Immediate value
    .sel(ALUSrc),             // Select signal for ALU source operand
    .out(SrcB)                // ALU source operand B
  );

  // Immediate value sign extension
  Sign_Extend U3(
    .Instr(Instr[31:7]),      // Immediate value from instruction
    .ImmSrc(ImmSrc),          // Immediate source control signal
    .ImmExt(ImmExt)           // Sign-extended immediate value
  );

  // Program counter register
  PC U4(
    .stall(stall),
    .clk(clk),
    .reset_n(reset_n),
    .inp(PCNext),             // Next PC value
    .out(PC)                  // Current PC value
  );

  // PC + 4 adder
  Adder U5(
    .inp1(PC),                // Current PC value
    .inp2(32'd4),             // Constant value 4
    .sum(PCPlus4)             // PC + 4 value
  );

  // PC target address adder
  Adder U6(
    .inp1(PC),                // Current PC value
    .inp2(ImmExt),            // Immediate value
    .sum(PCTarget)            // Target PC value
  );

  // PC selection multiplexer
  Mux U7(
    .in0(PCPlus4),            // PC + 4 value
    .in1(PCTarget),           // Target PC value
    .sel(PCSrc),              // PC source select signal
    .out(PCNext)              // Next PC value
  );

  // Arithmetic Logic Unit (ALU)
  ALU U8(
    .inp1(SrcA),              // ALU operand A
    .inp2(SrcB),              // ALU operand B
    .sel(ALUControl),         // ALU control signal
    .out(ALUResult),          // ALU result
    .zero_flag(Zero)          // Zero flag output
  );

  // Result selection multiplexer
  mux3 U9(
    .inp1(ALUResult),         // ALU result
    .inp2(ReadData),          // Memory read data
    .inp3(PCPlus4),           // PC + 4 value
    .sel(ResultSrc),          // Result source select signal
    .out(Result)              // Selected result
  );

endmodule
