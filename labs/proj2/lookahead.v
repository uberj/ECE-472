// Kevin Ngo and Jacques Uber
// carry-look-ahead module
/*
* Input 4 pg (8 wires)
* Output 4 c (4 wires)
*/

module lookahead(p, g, c, cin, p0, g0);
    input [3:0] p, g;
    input cin;
    output [3:0] c;
    output p0, g0; // The Super P and G

    assign #2 c[0] = g[0] | p[0] & cin;
    assign #3 c[1] = g[1] | g[0] & p[1] | cin & p[0] & p[1];
    assign #4 c[2] = g[2] | g[1] & p[2] | g[0] & p[1] & p[2] | cin & p[0] & p[1] & p[2];
    assign #5 c[3] = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3] | cin & p[0] & p[1] & p[2] & p[3];

    assign #3 p0 = p[3] & p[2] & p[1] & p[0];
    assign #4 g0 = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];
endmodule
