`timescale 1ns / 1ps

module mux_sel_unit_tb;
    reg [2:0] wb_mux_sel_reg_in;
    reg [31:0] alu_result_in, lu_output_in, imm_reg_in, iadder_out_reg_in, csr_data_in, pc_plus_4_reg_in, rs2_reg_in;
    reg alu_source_reg_in;
    wire [31:0] wb_mux_out, alu_2nd_src_mux_out;

    // Instantiate the Unit Under Test (UUT)
    mux_sel_unit uut (
        .wb_mux_sel_reg_in(wb_mux_sel_reg_in),
        .alu_result_in(alu_result_in),
        .lu_output_in(lu_output_in),
        .imm_reg_in(imm_reg_in),
        .iadder_out_reg_in(iadder_out_reg_in),
        .csr_data_in(csr_data_in),
        .pc_plus_4_reg_in(pc_plus_4_reg_in),
        .rs2_reg_in(rs2_reg_in),
        .alu_source_reg_in(alu_source_reg_in),
        .wb_mux_out(wb_mux_out),
        .alu_2nd_src_mux_out(alu_2nd_src_mux_out)
    );

    initial begin
        // Initialize inputs
        wb_mux_sel_reg_in = 3'b000;
        alu_result_in = 32'h00000000;
        lu_output_in = 32'h00000000;
        imm_reg_in = 32'h00000000;
        iadder_out_reg_in = 32'h00000000;
        csr_data_in = 32'h00000000;
        pc_plus_4_reg_in = 32'h00000000;
        rs2_reg_in = 32'h00000000;
        alu_source_reg_in = 1'b0;

        // Wait for 100 ns for global reset to finish
        #100;

        // Add stimulus here
        wb_mux_sel_reg_in = 3'b001; // WB_LU
        lu_output_in = 32'h00000001;
        #50;

        wb_mux_sel_reg_in = 3'b010; // WB_IMM
        imm_reg_in = 32'h00000002;
        #50;

        // Add more stimulus as needed...

    end

endmodule

