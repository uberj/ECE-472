// Kevin Ngo and Jacques Uber
// A flipflop

module flipflop(reset, clk, d_in, d_out);
  input reset, clk;
  input d_in;
  output d_out;
  reg d_out;

  always @(posedge clk)
  begin

    if (reset)
      d_out <= 0;
    else
      d_out <= d_in;
  end
endmodule

