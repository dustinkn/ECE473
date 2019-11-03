// ALU.v

module ALU(
	input wire clock,
	input wire [31:0] RS_in,
	input wire [31:0] RT_in,
	input wire [31:0] inst,
	
	output reg [31:0] data_out,
	output reg zero);

	reg [5:0] opcode = inst[31:26];
	reg [5:0] funct = inst[5:0];
	reg [4:0] shamt = inst[10:6];
	reg [31:0] RS_out;
	reg [31:0] RT_out;
	integer i;
	integer sa;
	
	always @(negedge clock) begin
		sa = shamt[4:0];
	
		if(opcode[5:0] == 6'b000000) begin
			// add
			if(funct[5:0] == 6'b100000) begin
				data_out <= RS_in + RT_in;
			end
						
			// addu
			if(funct[5:0] == 6'b100001) begin
				if(RS_in[31] == 1) begin
					RS_out = ~RS_in + 1;
				end
				if(RT_in[31] == 1) begin
					RT_out = ~RT_in + 1;
				end
				data_out <= RS_out + RT_out; 
			end		
			
			// sub
			if(funct[5:0] == 6'b100010) begin
				 data_out <= RS_in - RT_in;
			end		
		
			// subu
			if(funct[5:0] == 6'b100011) begin
				if(RS_in[31] == 1) begin
					RS_out = ~RS_in[31:0] + 1;
				end
				if(RT_in[31] == 1) begin
					RT_out = ~RT_in[31:0] + 1;
				end
				data_out <= RS_out - RT_out;
			end		
		
			// and
			if(funct[5:0] == 6'b100100) begin
				data_out <= RS_in & RT_in;
			end		
		
			// or
			if(funct[5:0] == 6'b100101) begin
				data_out <= RS_in | RT_in;
			end		
		
			// nor
			if(funct[5:0] == 6'b100111) begin
				data_out <= ~(RS_in | RT_in);
			end

			// slt
			if(funct[5:0] == 6'b101010) begin
					if(RS_in < RT_in) begin
						data_out <= 1;
					end else begin
						data_out <= 0;
					end
			end	

			// sll
			if(funct[5:0] == 6'b000000) begin
				data_out <= RT_in << sa;
			end
			
			// srl
			if(funct[5:0] == 6'b000010) begin
				data_out <= RT_in >> sa;
			end
		
			// sra
			if(funct[5:0] == 6'b000011) begin
				if(RT_in[31] == 0) begin
					data_out <= RT_in >> shamt;
				end else begin
					data_out <= RT_in >> shamt;
					for(i = 0; i < sa; i = i + 1) begin
						data_out[31-i] = 1;
					end
				end
			end		
		
			// jr
			if(funct[5:0] == 6'b001000) begin
				data_out = 0;
			end		
		
			// nop
			if((sa == 0) && (funct[5:0] == 6'b000000)) begin
				data_out = 0;
			end
		end
	end
endmodule
	