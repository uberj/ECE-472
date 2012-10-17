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
reg binvt;
reg [2:0] operation;

// Outputs
wire less;
wire alu_out;
wire oflo;
wire set;

reg [8:0] data;



ALU16 DUT(A_i, B_i, Operation_Code_i, zero_o,S_o, overflow_o, carry_o);

always
    #5 clk = ~clk;

initial begin

    A_i               = 16'h0000;
    B_i               = 16'h0000;
    data = 16'hE000;

    Operation_Code_i  = 3'b000;           //AND

    clk               = 1'b0;
end


    always @(posedge clk)
    begin
        #5 clk=~clk;
        data <= data + 1;
        // Map all inputs onto data. This will provide all possible inputs.
        a_0 <= data[0];
        b_0 <= data[1];
        cin_0 <= data[2];
        binvt <= data[5];
        operation <= data[8:6];
    end
    alu_slice_msb alu_slice(a_0, b_0, alu_out, cin_0, oflo, less, binvt, operation);
endmodule
