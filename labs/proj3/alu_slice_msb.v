/*
* Kevin Ngo and Jacques Uber
* (1 bit) ALU slice MSB
*/
module alu_slice_msb(a, b, alu_out, cin, oflo, set, binvt, operation);
    input a, b, cin,  binvt, operation;
    input [2:0] operation;
    output alu_out;
    output set;
    output oflo; // Over flow
    wire [3:0] mux_in;
    wire fa_b;
    wire cout; // Used to calculate oflo
    wire mx_out;
    wire zero;
    assign zero = 0;
    alu_slice_1bit inner_alu(a, b, alu_out, cin, cout, zero, binvt, operation);

    assign oflo = (cout ^ cin) ? 1: 0;

    // The 'Set' output is dependent upon the opcode
    // selecting 'set on less than' and the overflow being 1.
    assign set = (operation == 7 & oflo) ? 1: 0;
endmodule
