// register_file.v

module register_file(
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [31:0] write_data_in,
	input wire [4:0] write_address,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	input wire [4:0] read_address_debug,
	input wire clock_debug,
	
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug);
	
	
	// Create an array of 32, 32-bit registers
	reg [31:0] registers[31:0];
	
	
	// Initialize the register[i] with a value of i where i = 0,1,...,31
	integer i;
	
	// Execute for loop only once at time zero
	initial begin
	
	for(i = 0; i < 32; i = i + 1) begin
		registers[i] = i;
	end
	
	end
	
	always @(negedge clock_debug) begin
		data_out_debug <= registers[read_address_debug];
	end
	
	always @(negedge clock) begin
		// Set the output values of read registers
		data_out_1 <= registers[read_address_1];
		data_out_2 <= registers[read_address_2];
	end
	
	always @(posedge clock) begin
		registers[write_address] <= write_data_in;
	end
	
	
endmodule