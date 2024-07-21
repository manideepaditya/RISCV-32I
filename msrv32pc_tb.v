`timescale 1ns / 1ps

module tb_msrv32_pc;

    // Parameters
    reg rst_in;
    reg [1:0] pc_src_in;
    reg [31:0] epc_in;
    reg [31:0] trap_addres_in;
    reg brank_taken_in;
    reg [31:1] iaddr_in;
    reg ahb_ready_in;
    reg [31:0] pc_in;

    wire [31:0] iaddr_out;
    wire [31:0] pc_plus_4_out;
    wire misaligned_instr_out;
    wire [31:0] pc_mux_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_pc uut (
        .rst_in(rst_in), 
        .pc_src_in(pc_src_in), 
        .epc_in(epc_in), 
        .trap_addres_in(trap_addres_in),
        .brank_taken_in(brank_taken_in),
        .iaddr_in(iaddr_in),
        .ahb_ready_in(ahb_ready_in),
        .pc_in(pc_in),
        .iaddr_out(iaddr_out),
        .pc_plus_4_out(pc_plus_4_out),
        .misaligned_instr_out(misaligned_instr_out),
        .pc_mux_out(pc_mux_out)
    );

    initial begin
      // Initialize Inputs
      rst_in = 1'b0;
      pc_src_in = 2'b00;
      epc_in = 32'h00000000;
      trap_addres_in = 32'h00000000;
      brank_taken_in = 1'b0;
      iaddr_in = 31'h00000000;
      ahb_ready_in = 1'b1;
      pc_in = 32'h00000000;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      rst_in = 1'b1; // Reset, should result in PC being BOOT_ADDRESS
      #50;

      rst_in = 1'b0; // De-assert the reset
      #50;

      pc_src_in = 2'b01; // EPC source, should result in PC being EPC
      epc_in = 32'h00000008; // Some EPC value
      #50;

      pc_src_in = 2'b10; // Trap address source, should result in PC being trap address
      trap_addres_in = 32'h00000001; // Some trap address value
      #50;

      pc_src_in = 2'b11; // Next PC source, should result in PC being next PC (PC + 4 or branch address)
      brank_taken_in = 1'b1; // Branch taken, should result in PC being branch address
      iaddr_in = 31'hAAAAA; // Some branch address value
      #50;

    end

endmodule

