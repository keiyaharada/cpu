module sel(in0,in1,sel,out);
	input sel;
	input[43:0] in0,in1;
	output[43:0] out;
	reg out;

	always @(in0 or in1 or sel) begin
		if(sel) out = in0;
		else out = in1;
	end
endmodule
