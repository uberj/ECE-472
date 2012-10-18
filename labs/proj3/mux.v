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
            3'b000: out = in[0];
            3'b001: out = in[1];
            3'b010: out = in[2];
            3'b110: out = in[2];
            3'b111: out = in[3];
        endcase
    end
endmodule
