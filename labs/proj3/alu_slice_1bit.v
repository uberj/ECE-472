/*
* Kevin Ngo and Jacques Uber
* (1 bit) ALU slice
*/
module alu_slice_1bit(a, b, alu_out, cin, cout, less, binvt, operation);
    input a, b, cin, less, binvt, operation;
    input [2:0] operation;
    output cout;
    output alu_out;
    wire [3:0] mux_in;
    wire fa_a;
    wire fa_b;


    // (input 0 of mux)
    assign mux_in[0] = a & b;

    // (input 1 of mux)
    assign mux_in[1] = a & b;

    // Configure Full adder (input 2 of mux)
    assign fa_a = a;
    assign fa_b = b ^ binvt;
    fulladder f0(fa_a, fa_b, cin, mux_in[2], cout);

    // (input 3 of mux)
    assign mux_in[3] = less;

    // Configure mux (alu_out is output of mux)
    mux mux4(mux_in, operation, alu_out);
endmodule
