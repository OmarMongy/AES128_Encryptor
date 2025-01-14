module top (
    input clk,
    input reset_n
);

   wire mem_rstrb;
   wire [31:0] mem_addr;
   wire [31:0] mem_wdata;
   wire [3:0] mem_wstrb;
   wire [31:0] mem_rdata;

   wire s0_sel_mem;
   wire s1_sel_aes;
   
   // AES IP AHB signals 
   wire aes_hready = s1_sel_aes;
   wire aes_hresp; 
   wire [31:0] aes_hrdata;

   // Combined processor read data
   wire [31:0] processor_rdata = (s1_sel_aes) ? aes_hrdata : mem_rdata;

   // Memory instantiation
   Memory #(
       .MEM_FILE("FirmWare.mem"),
       .SIZE(1024)
   ) D_mem_unit (
       .clk(clk),
       .mem_addr(mem_addr),
       .mem_rdata(mem_rdata),
       .mem_rstrb(s0_sel_mem & mem_rstrb),
       .mem_wdata(mem_wdata),
       .mem_wmask({4{s0_sel_mem}} & mem_wstrb)
   );

   // RISC-V Processor instantiation
   FemtoRV32 RV32_Pico (
       .clk      (clk),
       .reset    (reset_n),
       .mem_rstrb(mem_rstrb),
       .mem_rbusy(1'b0),
       .mem_wbusy(1'b0),
       .mem_addr (mem_addr),
       .mem_wdata(mem_wdata),
       .mem_wmask(mem_wstrb),
       .mem_rdata(processor_rdata)
   );

   // Device selection logic
   device_select dv_sel(
       .addr(mem_addr),
       .s0_sel_mem(s0_sel_mem),
       .s1_sel_aes(s1_sel_aes)
   );

   // AES IP instantiation
   aes_core AES128_IP (
       .HCLK(clk),
       .HRESETn(reset_n),
       .HSEL(s1_sel_aes),
       .HADDR(mem_addr),
       .HWRITE(|mem_wstrb),  // Write enable signal
       .HREADY(aes_hready),
       .HWDATA(mem_wdata),
       .HRDATA(aes_hrdata),
       .HRESP(aes_hresp)
   );

endmodule
