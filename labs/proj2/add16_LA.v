// Kevin Ngo and Jacques Uber
// 16 bit adder using 4 r-bit Carry-lookahead-adders
module add16_LA(a, b, sum, cout);
    input [15:0] a, b;

    output cout;
    output [15:0] sum;

    wire [3:0] c; // LA module carries

    wire [3:0] super_p;
    wire [3:0] super_g;
    wire cin;
    assign cin = 0;
    assign cout = c[3];

    wire [1:0] p_g; // We don't care about these

    cla_4bit cla0(a[3:0], b[3:0], sum[3:0], cin, super_p[0], super_g[0]);
    cla_4bit cla1(a[7:4], b[7:4], sum[7:4], c[0],  super_p[1], super_g[1]);
    cla_4bit cla2(a[11:8], b[11:8], sum[11:8], c[1], super_p[2], super_g[2]);
    cla_4bit cla3(a[15:12], b[15:12], sum[15:12], c[2], super_p[3], super_g[3]);
    lookahead large_cla(super_p, super_g, c[3:0], cin, p_g[0], p_g[1]);
endmodule
