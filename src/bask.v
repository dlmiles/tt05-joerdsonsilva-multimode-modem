/* Generated by Yosys 0.27+22 (git sha1 53c0a6b78, clang 11.0.1-2 -fPIC -Os) */

module bask(reset, clk, bask_out);
  
  wire _0_;
  wire _1_;
  wire [6:0] _2_;
  wire [6:0] _3_;
  output [6:0] bask_out;
  wire [6:0] bask_out;
  input clk;
  wire clk;
  input reset;
  wire reset;
  wire sig_clk_1mhz;
  wire sig_data2;
  wire [6:0] sig_wave;
  
  mult1 instace4 (
    .clk(clk),
    .data(sig_data2),
    .mult_out(_3_),
    .reset(reset),
    .wave(sig_wave)
  );
  clk_rdg1 instance1 (
    .clk_in(clk),
    .clk_out(_0_),
    .reset(reset)
  );
  rdg1 instance2 (
    .clk(sig_clk_1mhz),
    .data(_1_),
    .reset(reset)
  );
  wave11 instance3 (
    .clk(clk),
    .dataout(_2_),
    .reset(reset)
  );
  assign sig_clk_1mhz = _0_;
  assign sig_data2 = _1_;
  assign sig_wave = _2_;
  assign bask_out = _3_;
endmodule
