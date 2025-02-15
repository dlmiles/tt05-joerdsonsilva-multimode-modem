/* Generated by Yosys 0.27+22 (git sha1 53c0a6b78, clang 11.0.1-2 -fPIC -Os) */

module demod_bfsk(reset, clk, demod_in, data_demod_bfsk);
  wire [6:0] _0_;
  wire [6:0] _1_;
  wire _2_;
  input clk;
  wire clk;
  output data_demod_bfsk;
  wire data_demod_bfsk;
  input [6:0] demod_in;
  wire [6:0] demod_in;
  input reset;
  wire reset;
  wire [6:0] sig_teste;
  wire [6:0] sig_wave;
  wave122 instance2 (
    .clk(clk),
    .dataout(_0_),
    .reset(reset)
  );
  mult2 instance3 (
    .a0(demod_in),
    .a1(sig_wave),
    .clk(clk),
    .mult_out(_1_),
    .reset(reset)
  );
  integrator2 instance4 (
    .clk(clk),
    .comp_in(sig_teste),
    .comp_out(_2_),
    .reset(reset)
  );
  assign sig_wave = _0_;
  assign sig_teste = _1_;
  assign data_demod_bfsk = _2_;
endmodule
