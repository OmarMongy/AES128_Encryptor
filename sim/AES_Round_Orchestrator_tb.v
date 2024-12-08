module AES_Round_Orchestrator_tb;
  
  // Parameters
  localparam WIDTH = 128;
  
  // Inputs
  reg clk_i;
  reg rst_n_i;
  reg start;
  reg [WIDTH-1:0] data_i;
  reg [WIDTH-1:0] data_feedback_i;
  reg [WIDTH-1:0] key_i;
  reg [WIDTH-1:0] key_1_i, key_2_i, key_3_i, key_4_i;
  reg [WIDTH-1:0] key_5_i, key_6_i, key_7_i, key_8_i;
  reg [WIDTH-1:0] key_9_i, key_10_i;
  
  // Outputs
  wire [WIDTH-1:0] data_o;
  wire [WIDTH-1:0] data_final_o;
  wire [WIDTH-1:0] key_o;
  wire data_valid;
  wire busy;
  wire done;
  
  // Instantiate the Unit Under Test (UUT)
  AES_Round_Orchestrator #(WIDTH) uut (
      .clk_i(clk_i),
      .rst_n_i(rst_n_i),
      .start(start),
      .data_i(data_i),
      .data_feedback_i(data_feedback_i),
      .key_i(key_i),
      .key_1_i(key_1_i), .key_2_i(key_2_i), .key_3_i(key_3_i), .key_4_i(key_4_i),
      .key_5_i(key_5_i), .key_6_i(key_6_i), .key_7_i(key_7_i), .key_8_i(key_8_i),
      .key_9_i(key_9_i), .key_10_i(key_10_i),
      .data_o(data_o),
      .data_final_o(data_final_o),
      .key_o(key_o),
      .data_valid(data_valid),
      .busy(busy),
      .done(done)
  );
  
  // Clock generation
  initial clk_i = 0;
  always #5 clk_i = ~clk_i; // 10ns clock period (100 MHz)
  
  // Test sequence
  initial begin
      // Initialize inputs
      rst_n_i = 0;
      start = 0;
      data_i = 0;
      data_feedback_i = 0;
      key_i = 128'h000102030405060708090A0B0C0D0E0F; // Example key
      key_1_i = 128'h2B7E151628AED2A6ABF7158809CF4F3C;
      key_2_i = 128'hA0FAFE1788542CB123A339392A6C7605;
      key_3_i = 128'hF2C295F27A96B9435935807A7359F67F;
      key_4_i = 128'h3D80477D4716FE3E1E237E446D7A883B;
      key_5_i = 128'hEF44A541A8525B7FB671253BDB0BAD00;
      key_6_i = 128'hD4D1C6F87C839D87CAF2B8BC11F915BC;
      key_7_i = 128'h6D88A37A110B3EFDDBF98641CA0093FD;
      key_8_i = 128'h4E54F70E5F5FC9F384A64FB24EA6DC4F;
      key_9_i = 128'hEA612C484E006D7FEA64589F65C361F2;
      key_10_i = 128'h4E54F70E5F5FC9F384A64FB24EA6DC4F;
  
      // Reset sequence
      #20;
      rst_n_i = 1;
  
      // Start AES round orchestrator
      #10;
      start = 1;
      data_i = 128'h00112233445566778899AABBCCDDEEFF; // Example data input
  
      #10;
      start = 0;
  
      // Wait for processing
      wait(done);
      
      // Check outputs
      #10;
      $display("Data Final Output: %h", data_final_o);
      $display("Busy: %b, Done: %b", busy, done);
  
      // Finish simulation
      #20;
      $finish;
  end
  
  endmodule
