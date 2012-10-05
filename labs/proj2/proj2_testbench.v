// Kevin Ngo and Jacques Uber
// Lab1 testbench

module proj2_testbench;

    wire [15:0] sum;
    wire cout;

    reg [15:0] A, B;
    reg clk;

    // DUT = Device under test
    ripple_adder DUT(A, B, sum, cout);

    always
        #5 clk=~clk;

    initial begin
        clk = 1'b0;
        A = 8'h00;
        B = 8'h00;
    end

    always @(posedge clk)
    begin
        A = A + 1;
    end
endmodule
