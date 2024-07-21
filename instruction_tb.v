`timescale 1ns / 1ps

module tb_msrv32_instruction_mux;

    // Parameters
    reg flush_in;
    reg [31:0] instr_in;

    wire [6:0] opcode_out, funct7_out;
    wire [2:0] funct3_out;
    wire [4:0] rs1_addr_out, rs2_addr_out, rd_addr_out;
    wire [11:0] csr_addr_out;
    wire [24:0] instr_31_7_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_instruction_mux uut (
        .flush_in(flush_in), 
        .instr_in(instr_in), 
        .opcode_out(opcode_out), 
        .funct7_out(funct7_out),
        .funct3_out(funct3_out),
        .rs1_addr_out(rs1_addr_out),
        .rs2_addr_out(rs2_addr_out),
        .rd_addr_out(rd_addr_out),
        .csr_addr_out(csr_addr_out),
        .instr_31_7_out(instr_31_7_out)
    );

    initial begin
      // Initialize Inputs
      flush_in = 1'b0;
      instr_in = 32'h00000000;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      flush_in = 1'b0; // No flush
      instr_in = 32'h00000013; // Some instruction
      #50;

      flush_in = 1'b1; // Flush instruction, should result in opcode 32'h00000013 regardless of instr_in
      #50;

      flush_in = 1'b0; // No flush
      instr_in = 32'hFFFFFFFF; // Some other instruction
      #50;

    end

endmodule

