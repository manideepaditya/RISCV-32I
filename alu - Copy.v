module msrv32_ALU (
    input [31:0] op_1_in,
    input [31:0] op_2_in,
    input [3:0] opcode_in,
    output reg [31:0] result_out
);

always @* begin
result_out = 32'b0;
    case (opcode_in)
        4'b0000: result_out = op_1_in + op_2_in; // ALU_ADD
        4'b1000: result_out = op_1_in - op_2_in; // ALU_SUB
        4'b0010: result_out = (op_1_in < op_2_in) ? 1 : 0; // ALU_SLT
        4'b0011: result_out = (op_1_in < op_2_in) ? 1 : 0; // ALU_SLTU
        4'b0111: result_out = op_1_in & op_2_in; // ALU_AND
        4'b0110: result_out = op_1_in | op_2_in; // ALU_OR
        4'b0100: result_out = op_1_in ^ op_2_in; // ALU_XOR
        4'b0001: result_out = op_1_in << op_2_in; // ALU_SLL
        4'b0101: result_out = op_1_in >> op_2_in; // ALU_SRL
        4'b1101: result_out = $signed(op_1_in) >>> op_2_in; // ALU_SRA
        default: result_out = 32'hX;
    endcase
end

endmodule

