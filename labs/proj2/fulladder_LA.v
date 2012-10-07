// Kevin Ngo and Jacques Uber
// A full adder with lookahead

module fulladder_LA(a, b, cin, sum, p, g);
    input a, b, cin;
    output sum, p, g;

    assign #2 sum = a ^ b ^ cin; // Worst case delay is 2
    assign #1 g = a & b; // Worst case delay is 1
    assign #1 p = a ^ b; // Worst case delay is 1
endmodule
