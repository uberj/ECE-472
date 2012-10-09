/*
* Kevin Ngo and Jacques Uber
* A simple 4 bit adder
* Part 11 of the lab
*/

module cla_4bit(a, b, sum, cin, p0, g0);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output p0, g0;

    wire [3:0] la_p_out;
    wire [3:0] la_g_out;
    wire [3:0] c;


    fulladder_LA f0(a[0], b[0], cin, sum[0], la_p_out[0], la_g_out[0]);
    fulladder_LA f1(a[1], b[1], c[0], sum[1], la_p_out[1], la_g_out[1]);
    fulladder_LA f2(a[2], b[2], c[1], sum[2], la_p_out[2], la_g_out[2]);
    fulladder_LA f3(a[3], b[3], c[2], sum[3], la_p_out[3], la_g_out[3]);
    lookahead la0(la_p_out, la_g_out, c[3:0], cin, p0, g0);
endmodule
