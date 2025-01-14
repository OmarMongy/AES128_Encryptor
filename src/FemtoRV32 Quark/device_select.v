module device_select #(parameter MEM_BASE = 4'h0, AES_BASE = 4'h4)(
    input [31:0] addr,
    output s0_sel_mem,
    output s1_sel_aes
);

    wire mem_space = (addr[31:28] == MEM_BASE);
    wire aes_space = (addr[31:28] == AES_BASE);

    assign s0_sel_mem  = mem_space;
    assign s1_sel_aes  = aes_space;

endmodule
