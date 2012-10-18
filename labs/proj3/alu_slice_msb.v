/*
* Kevin Ngo and Jacques Uber
* (1 bit) ALU slice MSB
*/
module alu_slice_msb(a, b, alu_out, cin, cout, oflo, set, binvt, operation);
    input a, b, cin,  binvt, operation;
    input [2:0] operation;
    output alu_out;
    output set;
    output cout;
    output oflo; // Over flow
    wire cout; // Used to calculate oflo
    wire mx_out;
    wire zero;
    wire msb_sum;
    wire tmp1, tmp2;
    assign zero = 0;
    alu_slice_1bit inner_alu(a, b, alu_out, cin, cout, zero, binvt, operation);

    assign oflo = (cout ^ cin) ? 1: 0;

    // The 'Set' output is dependent upon the opcode
    // selecting 'set on less than' and the overflow being 1.
    assign fa_b = b ^ binvt;
    fulladder f0(a, fa_b, cin, msb_sum, tmp1);
    assign set = (operation == 3'b111 & msb_sum) ? 1: 0;
endmodule
