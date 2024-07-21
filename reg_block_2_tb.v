`timescale 1ns / 1ps

module msrv32_reg_block_2_tb;

    // Inputs
    reg [4:0] rd_addr_in;
    reg [11:0] csr_addr_in;
    reg [31:0] rs1_in, rs2_in, pc_in, pc_plus_4_in, iadder_in, imm_in;
    reg [3:0] alu_opcode_in;
    reg [1:0] load_size_in;
    reg [2:0] wb_mux_sel_in, csr_op_in;
    reg load_unsigned_in, alu_src_in, csr_wr_en_in, rf_wr_en_in, branch_taken_in, clk_in, reset_in;

    // Outputs
    wire [4:0] rd_addr_reg_out;
    wire [11:0] csr_addr_reg_out;
    wire [31:0] rs1_reg_out, rs2_reg_out, pc_reg_out, pc_plus_4_reg_out, iadder_out_reg_out, imm_reg_out;
    wire [3:0] alu_opcode_reg_out;
    wire [1:0] load_size_reg_out;
    wire [1:0] wb_mux_sel_reg_out,csr_op_reg_out;
    wire load_unsigned_reg_out, alu_src_reg_out, csr_wr_en_reg_out, rf_wr_en_reg_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_reg_block_2 uut (
        .rd_addr_in(rd_addr_in), 
        .csr_addr_in(csr_addr_in), 
        .rs1_in(rs1_in), 
        .rs2_in(rs2_in), 
        .pc_in(pc_in), 
        .pc_plus_4_in(pc_plus_4_in), 
        .iadder_in(iadder_in), 
        .imm_in(imm_in), 
        .alu_opcode_in(alu_opcode_in), 
        .load_size_in(load_size_in), 
        .wb_mux_sel_in(wb_mux_sel_in), 
        .csr_op_in(csr_op_in), 
        .load_unsigned_in(load_unsigned_in), 
        .alu_src_in(alu_src_in), 
        .csr_wr_en_in(csr_wr_en_in), 
        .rf_wr_en_in(rf_wr_en_in), 
        .branch_taken_in(branch_taken_in),
        .clk_in(clk_in),
        .reset_in(reset_in),
        .rd_addr_reg_out(rd_addr_reg_out),
        .csr_addr_reg_out(csr_addr_reg_out),
        .rs1_reg_out(rs1_reg_out),
        .rs2_reg_out(rs2_reg_out),
        .pc_reg_out(pc_reg_out),
        .pc_plus_4_reg_out(pc_plus_4_reg_out),
        .iadder_out_reg_out(iadder_out_reg_out),
        .imm_reg_out(imm_reg_out),
        .alu_opcode_reg_out(alu_opcode_reg_out),
        .load_size_reg_out(load_size_reg_out),
        .wb_mux_sel_reg_out(wb_mux_sel_reg_out),
        .csr_op_reg_out(csr_op_reg_out),
        .load_unsigned_reg_out(load_unsigned_reg_out),
        .alu_src_reg_out(alu_src_reg_out),
        .csr_wr_en_reg_out(csr_wr_en_reg_out),
        .rf_wr_en_reg_out(rf_wr_en_out)
    );

    initial begin
        // Initialize Inputs
        rd_addr_in = 5'b00000;
csr_addr_in = 12'b000000000000;
rs1_in = 32'h00000000;
rs2_in = 32'h00000000;
pc_in = 32'h00000000;
pc_plus_4_in = 32'h00000000;
iadder_in = 32'h00000000;
imm_in = 32'h00000000;
alu_opcode_in = 4'b0000;
load_size_in = 2'b00;
wb_mux_sel_in = 3'b000;
csr_op_in = 3'b000;
load_unsigned_in = 1'b0;
alu_src_in = 1'b0;
csr_wr_en_in = 1'b0;
rf_wr_en_in = 1'b0;
branch_taken_in = 1'b0;


    	// Initialize clock and reset
    	clk_in = 0;
    	reset_in = 1;

    	// Wait for some time to let the reset settle
    	#10;

    	// Deassert reset
    	reset_in = 0;
        rd_addr_in = 5'b11111;
csr_addr_in = 12'b111111111111;
rs1_in = 32'hFFFFFFFF;
rs2_in = 32'hFFFFFFFF;
pc_in = 32'hFFFFFFFF;
pc_plus_4_in = 32'hFFFFFFFF;
iadder_in = 32'hFFFFFFFF;
imm_in = 32'hFFFFFFFF;
alu_opcode_in = 4'b1111;
load_size_in = 2'b11;
wb_mux_sel_in = 3'b111;
csr_op_in = 3'b111;
load_unsigned_in = 1'b1;
alu_src_in = 1'b1;
csr_wr_en_in = 1'b1;
rf_wr_en_in = 1'b1;
branch_taken_in = 1'b1;
    	// Toggle clock for a few cycles
    	repeat (10) begin
    		#5 clk_in = ~clk_in; // Toggle clock every 5ns
    	end

    	// Add stimulus here


	end

endmodule

