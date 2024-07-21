`timescale 1ns / 1ps

module tb_msrv32_bu;

    // Parameters
    reg [6:2] opcode_6_to_2_in;
    reg [2:0] funct3_in;
    reg [31:0] rs1_in, rs2_in;

    wire branch_taken_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_bu uut (
        .opcode_6_to_2_in(opcode_6_to_2_in), 
        .funct3_in(funct3_in), 
        .rs1_in(rs1_in), 
        .rs2_in(rs2_in), 
        .branch_taken_out(branch_taken_out)
    );

    initial begin
      // Initialize Inputs
      opcode_6_to_2_in = 5'b00000;
      funct3_in = 3'b000;
      rs1_in = 32'h00000000;
      rs2_in = 32'h00000000;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      opcode_6_to_2_in = 5'b11000; // OPCODE_BRANCH
      funct3_in = 3'b000; // BEQ
      rs1_in = 32'h00000001;
      rs2_in = 32'h00000001; // rs1 == rs2, branch should be taken
      #50;

      opcode_6_to_2_in = 5'b11011; // OPCODE_JAL, branch should always be taken regardless of funct3, rs1, and rs2
      #50;

      opcode_6_to_2_in = 5'b11001; // OPCODE_JALR, branch should always be taken regardless of funct3, rs1, and rs2
      #50;

    end

endmodule

