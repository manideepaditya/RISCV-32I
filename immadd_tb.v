`timescale 1ns / 1ps

module tb_msrv32_immediate_adder;

    // Parameters
    reg [31:0] pc_in, rs_1_in, imm_in;
    reg iadder_src_in;

    wire [31:0] iadder_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_immediate_adder uut (
        .pc_in(pc_in), 
        .rs_1_in(rs_1_in), 
        .imm_in(imm_in), 
        .iadder_src_in(iadder_src_in),
        .iadder_out(iadder_out)
    );

    initial begin
      // Initialize Inputs
      pc_in = 32'h00000000;
      rs_1_in = 32'h00000000;
      imm_in = 32'h00000000;
      iadder_src_in = 1'b0;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      iadder_src_in = 1'b0; // Select PC as source
      pc_in = 32'h12345678; // PC value
      imm_in = 32'h00000001; // Immediate value, should result in output being PC + immediate
      #50;

      iadder_src_in = 1'b1; // Select RS_1 as source
      rs_1_in = 32'h87654321; // RS_1 value, should result in output being RS_1 + immediate
      #50;

    end

endmodule

