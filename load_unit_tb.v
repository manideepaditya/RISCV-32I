`timescale 1ns / 1ps

module tb_msrv32_lu;

    // Parameters
    reg [1:0] load_size_in;
    reg clk_in;
    reg load_unsigned_in;
    reg [31:0] data_in;
    reg [1:0] iadder_1_to_0_in;
    reg ahb_resp_in;

    wire [31:0] lu_output;

    // Instantiate the Unit Under Test (UUT)
    msrv32_lu uut (
        .load_size_in(load_size_in), 
        .clk_in(clk_in), 
        .load_unsigned_in(load_unsigned_in), 
        .data_in(data_in),
        .iadder_1_to_0_in(iadder_1_to_0_in),
        .ahb_resp_in(ahb_resp_in),
        .lu_output(lu_output)
    );

    initial begin
      // Initialize Inputs
      load_size_in = 2'b00;
      clk_in = 1'b0;
      load_unsigned_in = 1'b0;
      data_in = 32'h00000000;
      iadder_1_to_0_in = 2'b00;
      ahb_resp_in = 1'b0;

      // Wait for 100 ns for global reset to finish
      #100;

      // Add stimulus here
      load_size_in = 2'b00; // Byte load
      data_in = 32'h12345678; // Some data value
      iadder_1_to_0_in = 2'b00; // Load from byte 0, should result in output being lower byte of data
      #50;

      iadder_1_to_0_in = 2'b01; // Load from byte 1, should result in output being second byte of data
      #50;

      load_size_in = 2'b01; // Half-word load
      iadder_1_to_0_in = 2'b10; // Load from half-word 1, should result in output being upper half-word of data
      #50;

      ahb_resp_in = 1'b1; // AHB not ready, should result in output being high impedance
      #50;

    end

endmodule

