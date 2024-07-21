`timescale 1ns / 1ps

module tb_msrv32_imm_generator;

    // Parameters
    reg [31:7] instr_in;
    reg [2:0] imm_type_in;

    wire [31:0] imm_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_imm_generator uut (
        .instr_in(instr_in), 
        .imm_type_in(imm_type_in), 
        .imm_out(imm_out)
    );

    initial begin
      // Initialize Inputs
      instr_in = 32'h00000000;
      imm_type_in = 3'b000;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      instr_in = 32'h12345678; // Some instruction
      imm_type_in = 3'b000; // I-type immediate
      #50;

      imm_type_in = 3'b001; // S-type immediate
      #50;

      imm_type_in = 3'b010; // B-type immediate
      #50;

      imm_type_in = 3'b011; // U-type immediate
      #50;

      imm_type_in = 3'b100; // J-type immediate
      #50;

      imm_type_in = 3'b101; // CSR-type immediate
      #50;

    end

endmodule

