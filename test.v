`timescale 1ps/1ps

module test;
	reg clk, rst_n;

	top top0(clk, rst_n);

always #0.5 clk = ~clk;

	initial begin
		$dumpfile("top_test.vcd");
		$dumpvars(0,top0);
		$dumplimit(100000000000);
		//$monitor($stime, "clk:%b rst:%b", clk, rst_n);
		rst_n = 1;
		clk = 0;
	#5
	rst_n = 0;
	#5
	rst_n = 1;
	#1000000
	$finish;
	end
endmodule
