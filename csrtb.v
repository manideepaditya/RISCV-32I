`timescale 1ns / 1ps

module msrv32_csr_file_tb;

    // Parameters
    reg clk_in;
    reg rst_in;
    reg [11:0] csr_addr_in;
    reg [2:0] csr_op_in;
    reg [4:0] csr_uimm_in;
    reg [31:0] csr_data_in;
    reg [31:0] pc_in;
    reg iadder_in;
    reg e_irq_in;
    reg t_irq_in;
    reg s_irq_in;
    reg i_or_e_in;
    reg set_cause_in;
    reg instret_inc_in;
    reg mie_clear_in;
    reg mie_set_in;
    reg [3:0] cause_in;
    reg [63:0] real_time_in;
    reg misaligned_exception_in;

    wire [31:0] csr_data_out;
    wire mie_out;
    wire [31:0] epc_out;
    wire trap_address_out;
    wire meie_out;
    wire mtie_out;
    wire msie_out;
    wire meip_out;
    wire mtip_out;
    wire msip_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_csr_file UUT (
        .clk_in(clk_in),
        .rst_in(rst_in),
        .wr_en_in(1'b0), // Set to 1 for write operations
        .csr_addr_in(csr_addr_in),
        .csr_op_in(csr_op_in),
        .csr_uimm_in(csr_uimm_in),
        .csr_data_in(csr_data_in),
        .pc_in(pc_in),
        .iadder_in(iadder_in),
        .e_irq_in(e_irq_in),
        .t_irq_in(t_irq_in),
        .s_irq_in(s_irq_in),
        .i_or_e_in(i_or_e_in),
        .set_cause_in(set_cause_in),
        .instret_inc_in(instret_inc_in),
        .mie_clear_in(mie_clear_in),
        .mie_set_in(mie_set_in),
        .cause_in(cause_in),
        .real_time_in(real_time_in),
        .misaligned_exception_in(misaligned_exception_in),
        .csr_data_out(csr_data_out),
        .mie_out(mie_out),
        .epc_out(epc_out),
        .trap_address_out(trap_address_out),
        .meie_out(meie_out),
        .mtie_out(mtie_out),
        .msie_out(msie_out),
        .meip_out(meip_out),
        .mtip_out(mtip_out),
        .msip_out(msip_out)
    );

    // Clock generation
// Initialize inputs
initial begin
    clk_in = 0;
    rst_in = 0;
    csr_addr_in = 12'b0; // Set your CSR address
    csr_op_in = 3'b0;    // Set your CSR operation code
    csr_uimm_in = 5'b0;  // Set your CSR immediate value
    csr_data_in = 32'b0; // Set your initial CSR data
    pc_in = 32'b0;       // Set the program counter value
    iadder_in = 1'b0;    // Set iadder value
    e_irq_in = 1'b0;     // Set external IRQ
    t_irq_in = 1'b0;     // Set timer IRQ
    s_irq_in = 1'b0;     // Set software IRQ
    i_or_e_in = 1'b0;    // Set interrupt or exception signal
    set_cause_in = 1'b0; // Set cause signal
    instret_inc_in = 1'b0; // Set instruction count increment signal
    mie_clear_in = 1'b0;   // Set MIE clear signal
    mie_set_in = 1'b0;     // Set MIE set signal
    cause_in = 4'b0;       // Set interrupt cause
    real_time_in = 64'b0;  // Set real-time value
    misaligned_exception_in = 1'b0; // Set misaligned exception

    // De-assert reset
    #10;
    rst_in = 1'b0;

    // Example test case:
    // Write a value to a CSR and read it back
    // First, write a value to a CSR
    csr_op_in = 3'b010; // Write operation
    csr_uimm_in = 5'b00000; // Set the CSR to be written
    csr_data_in = 32'h12345678; // Value to be written
    

    // Wait for a few clock cycles
    #10;

    // Now, perform a read operation on the same CSR
    csr_op_in = 3'b001; // Read operation
    csr_uimm_in = 5'b00000; // Set the CSR to be read
    

    // Wait for a few clock cycles
    #10;

    // Check the result by monitoring csr_data_out
    if (csr_data_out == 32'h12345678) begin
        $display("Test Passed: CSR read value matches the expected value");
    end else begin
        $display("Test Failed: CSR read value does not match the expected value");
    end

    // Finish the simulation
    $finish;
end

endmodule



