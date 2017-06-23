module memory(clk, rst_n, in, addr, we, out);
	input clk, rst_n;
	input [43:0] in;
	input [43:0] addr;
	input we;
	output [43:0] out;

	reg [43:0] mem [255:0];

	wire [43:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7;

	integer i;

	always @(posedge clk) begin
		if (!rst_n) begin
			for(i=0; i<=256; i=i+1)
				mem[i]=0;
		end else begin
			if (we) begin
				mem[addr] <= in;
			end else begin
				mem[addr] <= mem[addr];
			end
		end
	end

	assign out = mem[addr];
	assign mem0 = mem[0];
	assign mem1 = mem[1];
	assign mem2 = mem[2];
	assign mem3 = mem[3];
	assign mem4 = mem[4];
	assign mem5 = mem[5];
	assign mem6 = mem[6];
	assign mem7 = mem[7];

endmodule
