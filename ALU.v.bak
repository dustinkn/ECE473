// ALU.v

module ALU(
	input wire clock,
	input wire [31:0] data_in_1,
	input wire [31:0] data_in_2,
	
	output reg [31:0] data_out);

	always @(negedge clock) begin
		data_out <= data_in_1 + data_in_2;
	end
endmodule
	