module ALU16_tb;

reg [15:0]  A_i, B_i;
reg [2:0]   Operation_Code_i;
reg         clk;

wire [15:0] S_o;
wire        zero_o, overflow_o, carry_o;
/* Test The ALU Slice */
// Inputs
reg a_0;
reg b_0;
reg cin_0;
reg less;
reg binvt;
reg [2:0] operation;

// Outputs
wire alu_out;
wire cout_0;

reg [8:0] data;



ALU16 DUT(A_i, B_i, Operation_Code_i, zero_o,S_o, overflow_o, carry_o);

always
    #5 clk = ~clk;

initial begin

    A_i               = 16'h0000;
    B_i               = 16'h0000;
    data = 1'b0;

    Operation_Code_i  = 3'b000;           //AND

    clk               = 1'b0;
end

    always
        #5 clk=~clk;

    always @(posedge clk)
    begin
        data <= data + 1;
        // Map all inputs onto data. This will provide all possible inputs.
        a_0 <= data[0];
        b_0 <= data[1];
        cin_0 <= data[2];
        less <= data[4];
        binvt <= data[5];
        operation <= data[8:6];
    end
    alu_slice_1bit alu_slice(a_0, b_0, alu_out, cin_0, cout_0, less, binvt, operation);
    /*
    A_i = 16'h0000; B_i = 16'hFFFF; #10;
    A_i = 16'h5555; B_i = 16'hAAAA; #10;
    A_i = 16'h1234; B_i = 16'h5678; #10;

    A_i = 16'h5555; B_i = 16'hFFFF; #10;
    A_i = 16'h5555; B_i = 16'hAAAA; #10;
    A_i = 16'h1234; B_i = 16'h5678; #10;

    Operation_Code_i    = 3'b001;         //OR
    A_i = 16'h7555; B_i = 16'h0FFF; #10;
    A_i = 16'h5555; B_i = 16'h0101; #10;
    A_i = 16'hABCD; B_i = 16'h0000; #10;

    Operation_Code_i    = 3'b010;         //ADD
    A_i = 16'h0001; B_i = 16'h7FFF; #10;
    A_i = 16'h2222; B_i = 16'h3333; #10;
    A_i = 16'hABCD; B_i = 16'h1111; #10;
    A_i = 16'h7FFF; B_i = 16'h7FFF; #10;

    Operation_Code_i    = 3'b110;         //SUB
    A_i = 16'h0001; B_i = 16'h7FFF; #10;
    A_i = 16'h4444; B_i = 16'h3333; #10;
    A_i = 16'hABCD; B_i = 16'h1111; #10;
    A_i = 16'h7FFF; B_i = 16'h7FFF; #10;
    A_i = 16'h1000; B_i = 16'h2245; #10;

    Operation_Code_i    = 3'b111;         //SLT
    A_i = 16'h1000; B_i = 16'h1000; #10;
    A_i = 16'h3332; B_i = 16'h3333; #10;
    A_i = 16'hFFFF; B_i = 16'hABCD; #10;
    A_i = 16'h7FFF; B_i = 16'h7FFE; #10;
    A_i = 16'h0002; B_i = 16'h0003;
    */

endmodule
