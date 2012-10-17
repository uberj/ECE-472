/*
* Kevin Ngo and Jacques Uber
* (4 bit) mux
*/

module mux(in, sel, out);
    input [3:0] in;
    input [2:0] sel;
    output out;
    reg out;

    always @(in or sel)
    begin
        case (sel)
            0: out = in[0];
            1: out = in[1];
            2: out = in[2];
            6: out = in[3];
            7: out = 0;
        endcase
    end
endmodule
