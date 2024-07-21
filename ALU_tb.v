`timescale 1ns / 1ps

module ALU_tb;
    reg [31:0] op_1_in;
    reg [31:0] op_2_in;
    reg [3:0] opcode_in;
    wire [31:0] result_out;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .op_1_in(op_1_in),
        .op_2_in(op_2_in),
        .opcode_in(opcode_in),
        .result_out(result_out)
    );

    initial begin
        // Initialize inputs
        op_1_in = 32'h00000000;
        op_2_in = 32'h00000000;
        opcode_in = 4'b0000;

        // Wait for 100 ns for global reset to finish
        #100;

        // Add stimulus here
        op_1_in = 32'h00000001;
        op_2_in = 32'h00000001;
        opcode_in = 4'b0000; // ALU_ADD
        #50;

        op_1_in = 32'h00000002;
        op_2_in = 32'h00000001;
        opcode_in = 4'b1000; // ALU_SUB
        #50;

        // Add more stimulus as needed...

    end

endmodule

