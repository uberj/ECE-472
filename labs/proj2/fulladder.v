// Kevin Ngo and Jacques Uber
// A full adder

module fulladder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    // Problem 13 adds delay
    //assign sum = a ^ b ^ cin;
    assign sum = a ^ b ^ cin;
    // assign cout = a & b | a & cin | b & cin;
    assign cout = a & b | a & cin | b & cin;
endmodule
