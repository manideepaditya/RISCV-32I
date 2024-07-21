module msrv32_reg_block_1(input [31:0] pc_mux_in,
input clk_in,
input rst_in,
output reg [31:0] pc_out);
parameter BOOT_ADDRESS = 0;
always @(posedge clk_in) 
begin
if (rst_in)  
 pc_out <= BOOT_ADDRESS;
else pc_out <= pc_mux_in;
end
endmodule
