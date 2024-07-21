`timescale 1ns / 1ps

module tb_msrv32_store_unit;

  reg [1:0] funct3_in;
  reg [31:0] iadder_in, rs2_in;
  reg mem_wr_req_in, ahb_ready_in;
  wire [31:0] d_addr_out;
  wire [31:0] data_out;
  wire [3:0] wr_mask_out;
  wire [1:0] ahb_htrans_out;
  wire wr_req_out;

  msrv32_store_unit uut (
    .funct3_in(funct3_in),
    .iadder_in(iadder_in),
    .rs2_in(rs2_in),
    .mem_wr_req_in(mem_wr_req_in),
    .ahb_ready_in(ahb_ready_in),
    .d_addr_out(d_addr_out),
    .data_out(data_out),
    .wr_mask_out(wr_mask_out),
    .ahb_htrans_out(ahb_htrans_out),
    .wr_req_out(wr_req_out)
  );

  initial begin
    // Initialize inputs
    funct3_in = 2'b00;
    iadder_in = 32'h00000000;
    rs2_in = 32'h00000000;
    mem_wr_req_in = 1'b0;
    ahb_ready_in = 1'b0;

    // Apply stimulus to the inputs
    #10 funct3_in = 2'b01; iadder_in = 32'h00000001; rs2_in = 32'h12345678; mem_wr_req_in = 1'b1; ahb_ready_in = 1'b1;
    #10 funct3_in = 2'b10; iadder_in = 32'h00000008; rs2_in = 32'h87654321; mem_wr_req_in = 1'b0; ahb_ready_in = 1'b0;
    
    // Add more stimulus here...

    #10 $finish; // End the simulation
  end

endmodule

