// Kevin Ngo and Jacques Uber
// A multiplexer

module mux(in_a, in_b, sel, out);
    input in_a, in_b;
    input sel;
    output out;
    reg out;
    

    always @(in_a or in_b or sel)
    begin
        case (sel)
            1'b0: out = in_a;
            1'b1: out = in_b;
        endcase
    end
endmodule
