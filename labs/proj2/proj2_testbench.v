// Kevin Ngo and Jacques Uber
// Lab1 testbench
/*
* We want to simulate both the ripple adder and the carry look ahead adder at the same time. This
* will allow us to see the wave forms in the same window and allow for easier analysis.
* Any thing that has 'LA' or 'la' is assumed to be part of the 'Look Ahead' adder.
*/

module proj2_testbench;

    reg clk; // Both LA and non-LA use the same clock
    wire cin;

    wire [15:0] sum;
    wire cout;
    reg [15:0] A, B;

    assign cin = 0; // They both get 0 for cin

    // DUT = Device under test
    ripple_adder DUT(A, B, sum, cout);

    wire [15:0] sum_LA; // LA get's its own sub
    wire cout_LA; // LA get's it's own cout
    reg [15:0] A_la, B_la; // LA get's it's own inputs

    //cla_4bit lA(A_la, B_la, sum_LA, cin, cout_LA);
    add16_LA lA(A_la, B_la, sum_LA, cin, cout_LA);

    always
        #5 clk=~clk;

    initial begin
        clk = 1'b0;
        A = 8'h00;
        B = 8'h00;
        A_la = 8'h0;
        B_la = 8'h0;
    end

    always @(posedge clk)
    begin
        A = A + 1;
        A_la = A_la + 1;
        B_la = B_la + 1;
    end
endmodule
