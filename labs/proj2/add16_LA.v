// Kevin Ngo and Jacques Uber
// 16 bit adder using 4 r-bit Carry-lookahead-adders
module add16_LA(a, b, sum, cin, cout);
    input cin;
    input [15:0] a, b;

    output cout;
    output [15:0] sum;

    wire [3:0] c; // The cout of a LA

    cla_4bit cla0(a[3:0], b[3:0], sum[3:0], cin, c[0]);
    cla_4bit cla1(a[7:4], b[7:4], sum[7:4], c[0], c[1]);
    cla_4bit cla2(a[11:8], b[11:8], sum[11:8], c[1], c[2]);
    cla_4bit cla3(a[15:12], b[15:12], sum[15:12], c[2], cout);
endmodule
