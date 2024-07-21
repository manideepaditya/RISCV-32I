module msrv32_immediate_adder(pc_in,rs_1_in,iadder_src_in,imm_in, iadder_out);
input [31:0] pc_in,rs_1_in,imm_in;
input iadder_src_in;
output [31:0] iadder_out;
wire [31:0] w;
assign w=iadder_src_in?rs_1_in:pc_in;
assign iadder_out=w+imm_in;

endmodule
