module msrv32_dec(
input [6:0] opcode_in,
input funct7_5_in,
input [2:0] funct3_in,
input [1:0] iadder_1 _to_0_in,
input trap_taken_in,
output [3:0] alu_opcode_out,
output mem_wr_reg_out,
output [1:0] load_size_out,
output load_unsigned_out,
output alu_src_out,
output iadder_src_out,
output csr_wr_en_out,
output rf_wr_en_out,
output [2:0] wb_mux_sel_out,
output [2:0] imm_type_out,
output [2:0] csr_op_out,
output illegal_instr_out,
output misaligned_load_out,
output misaligned_store_out);


parameter OPCODE_OP = 5'b01100;
parameter OPCODE OP_IMM = 5'b00100;
parameter OPCODE_LOAD = 5'b00000;
parameter OPCODE STORE = 5'b01000;
parameter OPCODE_BRANCH = 5'b11000;
parameter OPCODE_JAL = 5'b11011;
parameter OBCODE_JALR = 5'b11001;
parameter OPCODE_LUI = 5'b01101;
parameter OPCODE_AUIPC = 5'b00101;
parameter OPCODE_MISC_MEM = 5'b00011;
parameter OPCODE_SYSTEM = 5'b11100;


parameter FUNCT3_ADD = 3'b000;
parameter FUNCT3_SUB = 3'b000;
parameter FUNCT3_SLT = 3'b010;
parameter FUNCT3_SLTU = 3'b011;
parameter FUNCT3_AND = 3'b111;
parameter FUNCT3_OR = 3'b110;
parameter FUNCT3_XOR = 3'b100;
parameter FUNCT3_SLL = 3'b001;
parameter FUNCT3_SRL = 3'b101;
parameter FUNCT3_SRR = 3'b101;



reg is_branch;
reg is_jal;
reg is_jalr:
reg is_auipc;
reg is_lui;
reg is_load:;
reg is_store;
reg is_system;
wire is_csr;


reg is _op;
reg is_op_imm;
reg is_misc_mem;
reg is_addi;
reg is_slti;
reg is_sltiu;
reg is_andi;
reg is_ori;
reg is_xori;
wire is_implemented_instr;
wire mal_word;
wire mal_half;
wire misaligned;






