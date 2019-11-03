// IF_ID.v

module IF_ID(
	input wire clock,
	input wire [31:0] instr_in,
	output reg [31:0] instr_out);
	
	always @(posedge clock) begin
			instr_out <= instr_in;
	end
endmodule
