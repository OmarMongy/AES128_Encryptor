// Control Unit Module
// This module is responsible for generating control signals based on the 
// instruction opcode (op), function codes (funct3 and funct7), and the
// zero flag. These control signals are used to configure the ALU, 
// memory, and register operations in a processor pipeline.

module ctrl_unit(
  input  zero,               // Zero flag from ALU, used for branching decisions
  input  [6:0] op,           // 7-bit opcode, determines the operation type
  input  [2:0] funct3,       // 3-bit funct3 field, used in ALU operations
  input  funct7,             // 1-bit funct7 field, used in ALU operations
  output [2:0] ALUControl,   // ALU control signal, determines ALU operation
  output PCSrc,              // Control signal to select if the PC should be updated (branch)
  output [1:0] ResultSrc,    // Determines the source of the result (ALU, memory, etc.)
  output MemWrite,           // Memory write enable signal
  output ALUSrc,             // ALU source selection for operands
  output [1:0] ImmSrc,       // ImmSrc determines the immediate source for ALU
  output RegWrite            // Register write enable signal
);

  // Internal wire to hold ALU operation control signals
  wire [1:0] ALUOp;

  // Main Decoder Instantiation
  // Decodes the opcode and zero flag, generates control signals
  Main_Decoder maindec(
    .zero(zero),              // Zero flag from ALU
    .op(op),                  // Instruction opcode
    .PCSrc(PCSrc),            // Control signal for PC update (branch)
    .ResultSrc(ResultSrc),    // Determines the result source (ALU or memory)
    .MemWrite(MemWrite),      // Memory write enable
    .ALUSrc(ALUSrc),          // ALU source selection
    .immSrc(ImmSrc),          // Immediate source for ALU
    .RegWrite(RegWrite),      // Register write enable
    .ALUOp(ALUOp)            // ALU operation control signals
  );
  
  // ALU Decoder Instantiation
  // Decodes funct3, funct7, and ALUOp to generate the ALU control signal
  ALU_Decoder aludec(
    .funct3(funct3),          // funct3 field from instruction
    .funct7(funct7),          // funct7 field from instruction
    .ALUOp(ALUOp),            // ALU operation type from main decoder
    .op(op),                  // Instruction opcode
    .ALUControl(ALUControl)   // ALU operation control signal
  );
  
endmodule
