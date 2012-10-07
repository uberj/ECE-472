// Kevin Ngo and Jacques Uber
// 4-bit carry-look-ahead module
/*
* Input 4 pg (8 wires)
* Output 4 c (4 wires)
*/

module lookahead(p, g, c, cin);
    input [3:0] p, g;
    input cin;
    output [3:0] c;

   /*
    assign  #2 c[0] = g[0] | p[0] & cin;
    assign  #3 c[1] = g[1] | g[0] & p[1] | c[0] & p[0] & p[1];
    assign  #4 c[2] = g[2] | g[1] & p[2] | g[0] & p[1] & p[2] | c[0] & p[0] & p[1] & p[2];
    assign  #5 c[3] = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | c[0] & p[1] & p[2] & p[3] & p[3] | c[0] & p[0] & p[1] & p[2] & p[3];
    */
    assign  #2 c[0] = g[0] | p[0] & cin;
    assign  #2 c[1] = g[1] | p[1] & c[0];
    assign  #2 c[2] = g[2] | p[2] & c[1];
    assign  #2 c[3] = g[3] | p[3] & c[2];
endmodule
