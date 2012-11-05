/*
* Kevin Ngo and Jacques Uber
* Lab4 testbench
* Simulate the processor.
*/

module proj4_testbench;

    reg clk;
    reg reset;
    wire pc,  pc_next, instr;

    // DUT = Device under test
    mips_single DUT(clk, reset);

    always
        #100 clk=~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;
    end

    always @(posedge clk)
    begin
        reset = 0;
    end
endmodule
