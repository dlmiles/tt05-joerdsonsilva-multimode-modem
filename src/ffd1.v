/* Generated by Yosys 0.27+22 (git sha1 53c0a6b78, clang 11.0.1-2 -fPIC -Os) */

module ffd1(d, clk, q);

  reg _0_ /*= 1'h1*/;
  reg _1_;
  input clk;
  wire clk;
  input d;
  wire d;
  output q;
  wire q;
  wire sig_q;
  
  always @(negedge clk)
    _0_ <= d;
  always @(negedge clk)
    _1_ <= sig_q;
  assign sig_q = _0_;
  assign q = _1_;
endmodule
