// Kevin Ngo and Jacques Uber
// 4-bit carry-look-ahead module
/*
* Input 4 pg (8 wires)
* Output 4 c (4 wires)
*/

module lookahead(p, g, c);
    input [3:0] p, g;
    output [3:0] c;

    assign c[0] = g[0] | p[0] & c[0];
    assign c[1] = g[1] | g[0] & p[1] | c[0] & p[0] & p[1];
    assign c[2] = g[2] | g[1] & p[2] | g[0] & p[1] & p[2] | c[0] & p[0] & p[1] & p[2];
    assign c[3] = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | c[0] & p[1] & p[2] & p[3] & p[3] | c[0] & p[0] & p[1] & p[2] & p[3];
endmodule
