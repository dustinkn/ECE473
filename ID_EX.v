// ID_EX.v

module ID_EX(
	input wire clock,
	input wire [31:0] RS_in,
	input wire [31:0] RT_in,
	input wire [4:0]	RD_in,
	
	output reg [31:0] RS_out,
	output reg [31:0] RT_out,
	output reg [4:0]  RD_out);
	
	always @(posedge clock) begin
		RS_out <= RS_in;
		RT_out <= RT_in;
		RD_out <= RD_in;
	end
endmodule
