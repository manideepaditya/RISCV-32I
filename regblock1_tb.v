`timescale 1ns / 1ps

module tb_msrv32_reg_block_1;

    // Parameters
    reg [31:0] pc_mux_in;
    reg clk_in;
    reg rst_in;

    wire [32:0] pc_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_reg_block_1 uut (
        .pc_mux_in(pc_mux_in), 
        .clk_in(clk_in), 
        .rst_in(rst_in), 
        .pc_out(pc_out)
    );

    initial begin
      // Initialize Inputs
      pc_mux_in = 32'h00000000;
      clk_in = 1'b0;
      rst_in = 1'b0;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      rst_in = 1'b1; // Reset the PC, should result in PC being BOOT_ADDRESS
      #50;

      rst_in = 1'b0; // De-assert the reset
      #50;

      clk_in = 1'b1; // Rising edge of clock, should load pc_mux_in into PC
      pc_mux_in = 32'h12345678; // Some PC value
      #50;

      clk_in = 1'b0; // Falling edge of clock, should have no effect on PC
      #50;

    end

endmodule

