// Kevin Ngo and Jacques Uber
// A full adder with lookahead

module fulladder_LA(a, b, cin, sum, p, g);
    input a, b, cin;
    output sum, p, g;

    assign sum = a ^ b ^ cin;
    assign g = a & b;
    assign p = a ^ b;
endmodule
