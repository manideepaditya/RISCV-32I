`timescale 1ns / 1ps

module tb_msrv32_wr_en_generator;

    // Parameters
    reg flush_in;
    reg rf_wr_en_reg_in;
    reg csr_wr_en_reg_in;

    wire wr_en_integer_file_out;
    wire wr_en_csr_file_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_wr_en_generator uut (
        .flush_in(flush_in), 
        .rf_wr_en_reg_in(rf_wr_en_reg_in), 
        .csr_wr_en_reg_in(csr_wr_en_reg_in), 
        .wr_en_integer_file_out(wr_en_integer_file_out),
        .wr_en_csr_file_out(wr_en_csr_file_out)
    );

    initial begin
      // Initialize Inputs
      flush_in = 1'b0;
      rf_wr_en_reg_in = 1'b0;
      csr_wr_en_reg_in = 1'b0;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      flush_in = 1'b0; // No flush
      rf_wr_en_reg_in = 1'b1; // Enable write to integer file
      csr_wr_en_reg_in = 1'b1; // Enable write to CSR file
      #50;

      flush_in = 1'b1; // Flush, should disable writes regardless of rf_wr_en_reg_in and csr_wr_en_reg_in
      #50;

      flush_in = 1'b0; // No flush
      rf_wr_en_reg_in = 1'b0; // Disable write to integer file
      csr_wr_en_reg_in = 1'b0; // Disable write to CSR file
      #50;

    end

endmodule

