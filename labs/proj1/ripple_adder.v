module ripple_adder(a, b, sum, cout);
    input [3:0] a, b;
    output [3:0] sum;
    output cout;

    wire [3:0] c;
    assign c[0]=0;

    fulladder f0(a[0], b[0], c[0], sum[0], c[1]);
    fulladder f1(a[1], b[1], c[1], sum[1], c[2]);
    fulladder f2(a[2], b[2], c[2], sum[2], c[3]);
    fulladder f3(a[3], b[3], c[3], sum[3], cout);
endmodule

