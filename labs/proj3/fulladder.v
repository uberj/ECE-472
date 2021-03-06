/*
* Kevin Ngo and Jacques Uber
* A full adder
*/

module fulladder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    // Problem 13 adds delay
    assign sum = a ^ b ^ cin; // Worst case delay is 2
    assign cout = a & b | a & cin | b & cin; // Worst case delay is 3
endmodule
