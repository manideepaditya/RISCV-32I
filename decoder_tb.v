module msrv32_dec_tb;

reg [6:0] opcode_in;
reg funct7_5_in;
reg [2:0] funct3_in;
reg [1:0] iadder_1_to_0_in;
reg trap_taken_in;

wire [3:0] alu_opcode_out;
wire mem_wr_req_out;
wire [1:0] load_size_out;
wire load_unsigned_out;
wire alu_src_out;
wire iadder_src_out;
wire csr_wr_en_out;
wire rf_wr_en_out;
wire [2:0] wb_mux_sel_out;
wire [2:0] imm_type_out;
wire [2:0] csr_op_out;
wire illegal_instr_out;
wire misalligned_load_out;
wire misalligned_store_out;

msrv32_dec DUT (
  .opcode_in(opcode_in),
  .funct7_5_in(funct7_5_in),
  .funct3_in(funct3_in),
  .iadder_1_to_0_in(iadder_1_to_0_in),
  .trap_taken_in(trap_taken_in),

  .alu_opcode_out(alu_opcode_out),
  .mem_wr_req_out(mem_wr_req_out),
  .load_size_out(load_size_out),
  .load_unsigned_out(load_unsigned_out),
  .alu_src_out(alu_src_out),
  .iadder_src_out(iadder_src_out),
  .csr_wr_en_out(csr_wr_en_out),
  .rf_wr_en_out(rf_wr_en_out),
  .wb_mux_sel_out(wb_mux_sel_out),
  .imm_type_out(imm_type_out),
  .csr_op_out(csr_op_out),
  .illegal_instr_out(illegal_instr_out),
  .misalligned_load_out(misalligned_load_out),
  .misalligned_store_out(misalligned_store_out)
);

initial begin
  // Test all possible opcodes
  opcode_in <= 7'b01100; // OP
  funct7_5_in <= 1'b0;
  funct3_in <= 3'b000; // ADD
  iadder_1_to_0_in <= 2'b00;
  trap_taken_in <= 1'b0;

  #100;

  opcode_in <= 7'b00100; // OP_IMM
  funct7_5_in <= 1'b0;
  funct3_in <= 3'b000; // ADDI
  iadder_1_to_0_in <= 2'b00;
  trap_taken_in <= 1'b0;

  #100;

  opcode_in <= 7'b00000; // LOAD
  funct7_5_in <= 1'b0;
  funct3_in <= 3'b000; // LB
  iadder_1_to_0_in <= 2'b00;
  trap_taken_in <= 1'b0;

  #100;

  // ... and so on
end

endmodule

