/*
* Kevin Ngo and Jacques Uber
* 16 bit ALU
*/
module ALU16(A_i, B_i, Operation_Code_i, zero_o,S_o, overflow_o, carry_o);
    
    input [15:0] A_i;
    input [15:0] B_i;
    input [15:0] S_o; // Sum out
    input [2:0] Operation_Code_i;
    input zero_o;
    input overflow_o;
    input carry_o;

    wire [15:0] c;
    assign c[0] = Operation_Code_i[2] ? 1 : 0;

    wire binvt;
    assign binvt = Operation_Code_i[2];

    wire zero;
    assign zero = 0;
    wire less;
    wire set;
    
    // Overflow is: Operation Addition
    // if msb(a) == msb(b) and msb(sum) != msb(a)


    alu_slice_1bit alu1b0(A_i[0], B_i[0], S_o[0], c[0], c[1], set, binvt, Operation_Code_i);
    alu_slice_1bit alu1b1(A_i[1], B_i[1], S_o[1], c[1], c[2], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b2(A_i[2], B_i[2], S_o[2], c[2], c[3], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b3(A_i[3], B_i[3], S_o[3], c[3], c[4], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b4(A_i[4], B_i[4], S_o[4], c[4], c[5], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b5(A_i[5], B_i[5], S_o[5], c[5], c[6], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b6(A_i[6], B_i[6], S_o[6], c[6], c[7], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b7(A_i[7], B_i[7], S_o[7], c[7], c[8], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b8(A_i[8], B_i[8], S_o[8], c[8], c[9], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b9(A_i[9], B_i[9], S_o[9], c[9], c[10], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b10(A_i[10], B_i[10], S_o[10], c[10], c[11], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b11(A_i[11], B_i[11], S_o[11], c[11], c[12], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b12(A_i[12], B_i[12], S_o[12], c[12], c[13], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b13(A_i[13], B_i[13], S_o[13], c[13], c[14], zero, binvt, Operation_Code_i);
    alu_slice_1bit alu1b14(A_i[14], B_i[14], S_o[14], c[14], c[15], zero, binvt, Operation_Code_i);
    alu_slice_msb alu1b15(A_i[15], B_i[15], S_o[15], c[15], overflow_o, zero, set, binvt, Operation_Code_i);

endmodule
