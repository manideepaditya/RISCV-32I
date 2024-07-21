`timescale 1ns / 1ps

module tb_msrv32_integer_file;

    // Parameters
    reg clk_in;
    reg reset_in;
    reg [4:0] rs_1_addr_in, rs_2_addr_in;
    reg [4:0] rd_addr_in;
    reg wr_en_in;
    reg [31:0] rd_in;

    wire [31:0] rs_1_out, rs_2_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_integer_file uut (
        .clk_in(clk_in), 
        .reset_in(reset_in), 
        .rs_1_addr_in(rs_1_addr_in), 
        .rs_2_addr_in(rs_2_addr_in), 
        .rd_addr_in(rd_addr_in),
        .wr_en_in(wr_en_in),
        .rd_in(rd_in),
        .rs_1_out(rs_1_out),
        .rs_2_out(rs_2_out)
    );

    initial begin
      // Initialize Inputs
      clk_in = 1'b0;
      reset_in = 1'b0;
      rs_1_addr_in = 5'b00000;
      rs_2_addr_in = 5'b00000;
      rd_addr_in = 5'b00000;
      wr_en_in = 1'b0;
      rd_in = 32'h00000000;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      reset_in = 1'b1; // Reset the register file
      #50;

      reset_in = 1'b0; // De-assert the reset
      #50;
clk_in = 1'b1;
#50;

      wr_en_in = 1'b1; // Enable write
      rd_addr_in = 5'b00001; // Write to register 1
      rd_in = 32'h12345678; // Write value 0x12345678
      #50;

      wr_en_in = 1'b0; // Disable write
      rs_1_addr_in = 5'b00001; // Read from register 1, should output value 0x12345678
      #50;

    end

endmodule

