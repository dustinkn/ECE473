// pc_counter.v

module pc_counter(
	input wire clock,
		
	output reg [31:0] pc);
		
	initial begin
		pc = -1;
	end
	
	always @(posedge clock) begin
		pc = pc + 1;		
	end
endmodule
	