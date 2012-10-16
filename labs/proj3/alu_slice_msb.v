/*
* Kevin Ngo and Jacques Uber
* (1 bit) ALU slice
*/
module alu_slice_msb(a, b, alu_out, cin, oflo, less, set, binvt, operation);
    input a, b, cin, less, binvt, operation;
    input [2:0] operation;
    output alu_out;
    output set;
    output oflo; // Over flow
    wire [3:0] mux_in;
    wire fa_a;
    wire fa_b;
    wire cout; // Used to calculate oflo


    // (input 0 of mux)
    assign mux_in[0] = a & b;

    // (input 1 of mux)
    assign mux_in[1] = a | b;

    // Configure Full adder (input 2 of mux)
    assign fa_b = b ^ binvt;
    fulladder f0(a, fa_b, cin, mux_in[2], cout);

    // If the carry into the high order column does not
    // equal the carry out of the high order column, you
    // have overflow.
    assign oflo = (cout ^ cin) ? 1: 0;

    // The 'Set' output is dependent upon the opcode
    // selecting 'set on less than' and the overflow being 1.
    assign set = (operation == 1'b111 & oflo) ? 1: 0;
    // (input 3 of mux)
    assign mux_in[3] = less;

    // Configure mux (alu_out is output of mux)
    mux mux4(mux_in, operation, alu_out);
endmodule
