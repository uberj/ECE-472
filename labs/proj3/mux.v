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
            1: out = in[0];
            2: out = in[1];
            3: out = in[2];
            4: out = in[3];
        endcase
    end
endmodule
