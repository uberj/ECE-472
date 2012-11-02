// ----
// Module: Test Bench
// Author: Jacques Uber and Kevin Ngo
// Tests the bench
//

module test_bench();
	reg clk, reset;

	mips_single DUT(clk, reset);

	always
        #100 clk = ~clk;

	initial begin
		clk = 1'b0;
		reset = 1'b0; #100;
		reset = 1'b1; #100;
		reset = 1'b0; #100;
	end

endmodule
