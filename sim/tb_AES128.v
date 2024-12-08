module tb_AES128();
// Parameters
  parameter WIDTH = 128;
  
  // Testbench signals
  reg              clk_i;
  reg              rst_n_i;
  
  reg  [WIDTH-1:0] plaintext_i;
  reg  [WIDTH-1:0] key_i;

  reg                  start;
  wire                 data_ready_o;
  wire                 busy_o;
  wire                 valid_o;
  wire     [WIDTH-1:0] ciphertext_o;
  

  // Instantiate the module under test (UUT)
  AES128 #(WIDTH) uut (
    .clk_i(clk_i),
    .rst_n_i(rst_n_i),
    .start(start),
    .plaintext_i(plaintext_i),
    .key_i(key_i),
    .data_ready_o(data_ready_o),
    .busy_o(busy_o),
    .valid_o(valid_o),
    .ciphertext_o(ciphertext_o)   
  );
  initial
      begin
          forever #5 clk_i = ~ clk_i;
      end
    // Testbench logic
  initial begin
  clk_i = 1'b0;
  rst_n_i = 1'b0;
  start = 1'b0;
  plaintext_i = 128'h0;
  key_i = 128'h0;
  #10;
  rst_n_i = 1'b1;
  // Test case Cipher Key = 2b 7e 15 16 28 ae d2 a6 ab f7 15 88 09 cf 4f 3c
  #10;
  key_i       = 128'h2b7e151628aed2a6abf7158809cf4f3c;
  #20;
  start  = 1'b1;
  // Test case Input Data = 32 43 f6 a8 88 5a 30 8d 31 31 98 a2 e0 37 07 34
  plaintext_i = 128'h3243f6a8885a308d313198a2e0370734;
  #10;
  start = 1'b0;
  #300;
  // End simulation
  $stop;
  end
  endmodule
