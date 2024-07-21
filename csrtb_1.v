module csr_top_module (
  input wire clk,
  input wire reset,
  input wire write_en,
  input wire [31:0] write_addr,
  input wire [31:0] write_data,
  output wire [31:0] read_data
);

  parameter NUM_REGISTERS = 8;
  reg [31:0] registers [0:NUM_REGISTERS-1];

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      for (i = 0; i < NUM_REGISTERS; i = i + 1) begin
        registers[i] <= 32'b0;
      end
    end else begin
      if (write_en && (write_addr < NUM_REGISTERS)) begin
        registers[write_addr] <= write_data;
      end
    end
  end

  always @(*) begin
    if (write_addr < NUM_REGISTERS) begin
      read_data <= registers[write_addr];
    end else begin
      read_data <= 32'b0; // Return zero for invalid address
    end
  end
endmodule
