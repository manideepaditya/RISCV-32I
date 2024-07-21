`timescale 1ns / 1ps

module msrv32_machine_control_tb;

    // Parameters
    reg clk_in;
    reg reset_in;
    reg illegal_instr_in;
    reg misaligned_load_in;
    reg misaligned_store_in;
    reg misaligned_instr_in;
    reg [6:2] opcode_6_to_2_in;
    reg [2:0] funct3_in;
    reg [6:0] funct7_in;
    reg [4:0] rs1_addr_in;
    reg [4:0] rs2_addr_in;
    reg e_irq_in;
    reg t_irq_in;
    reg s_irq_in;
reg rd_addr_in;
reg mie_in, meie_in,mtie_in, msie_in, meip_in,mtip_in,msip_in;
    wire i_or_e_out;
    wire set_epc_out;
    wire set_cause_out;
    wire [3:0] cause_out;
    wire instret_inc_out;
    wire mie_clear_out;
    wire mie_set_out;
    wire misaligned_exception_out;
    wire [1:0] pc_src_out;
    wire flush_out;
    wire trap_taken_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_machine_control UUT (
        .clk_in(clk_in),
        .reset_in(reset_in),
        .illegal_instr_in(illegal_instr_in),
        .misaligned_load_in(misaligned_load_in),
        .misaligned_store_in(misaligned_store_in),
        .misaligned_instr_in(misaligned_instr_in),
        .opcode_6_to_2_in(opcode_6_to_2_in),
        .funct3_in(funct3_in),
        .funct7_in(funct7_in),
        .rs1_addr_in(rs1_addr_in),
        .rs2_addr_in(rs2_addr_in),
        .e_irq_in(e_irq_in),
        .t_irq_in(t_irq_in),
        .s_irq_in(s_irq_in),
        .i_or_e_out(i_or_e_out),
        .set_epc_out(set_epc_out),
        .set_cause_out(set_cause_out),
        .cause_out(cause_out),
        .instret_inc_out(instret_inc_out),
        .mie_clear_out(mie_clear_out),
        .mie_set_out(mie_set_out),
        .misaligned_exception_out(misaligned_exception_out),
        .pc_src_out(pc_src_out),
        .flush_out(flush_out),
        .trap_taken_out(trap_taken_out)
    );

    initial begin
        // Initialize inputs
        clk_in = 0;
        reset_in = 1;

        #10; // Wait for 10 time units
        reset_in = 0; // De-assert reset

        #10; // Wait for another 10 time units

        // Add your test cases here
		// Test case 1: Illegal instruction exception
		illegal_instr_in = 1'b1; 
		#10;

		illegal_instr_in = 1'b0; 
		#10;

		// Test case 2: Misaligned load exception
		misaligned_load_in = 1'b1; 
		#10;

		misaligned_load_in = 1'b0; 
		#10;

		// Test case 3: Misaligned store exception
		misaligned_store_in = 1'b1; 
		#10;

		misaligned_store_in = 1'b0; 
		#10;

		// Test case 4: Misaligned instruction exception
		misaligned_instr_in = 1'b1; 
		#10;

		misaligned_instr_in = 1'b0; 
		#10;

        // Finish the simulation
        $finish;
    end

    always #5 clk_in = ~clk_in; // Clock generation

endmodule

