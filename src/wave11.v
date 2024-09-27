/* Generated by Yosys 0.27+22 (git sha1 53c0a6b78, clang 11.0.1-2 -fPIC -Os) */

module wave11(clk, dataout, reset);

  wire [4:0] _0_;
  wire [31:0] _1_;
  wire _2_;
  wire [4:0] _3_;
  reg [4:0] _4_ /*= 5'h00*/;
  reg [7:0] _5_ /*= 8'h00*/;
  wire [239:0] _6_;
  wire [7:0] _7_;
  input clk;
  wire clk;
  wire [7:0] conv;
  wire [6:0] conv2;
  output [6:0] dataout;
  wire [6:0] dataout;
  wire [4:0] i;
  wire [239:0] sine;
  reg [7:0] \27  [29:0];
  input reset;
  wire reset;
  
  initial begin
    \27 [0] = 8'h19;
    \27 [1] = 8'h13;
    \27 [2] = 8'h0d;
    \27 [3] = 8'h08;
    \27 [4] = 8'h04;
    \27 [5] = 8'h02;
    \27 [6] = 8'h00;
    \27 [7] = 8'h00;
    \27 [8] = 8'h02;
    \27 [9] = 8'h04;
    \27 [10] = 8'h08;
    \27 [11] = 8'h0d;
    \27 [12] = 8'h13;
    \27 [13] = 8'h19;
    \27 [14] = 8'h20;
    \27 [15] = 8'h26;
    \27 [16] = 8'h2c;
    \27 [17] = 8'h32;
    \27 [18] = 8'h37;
    \27 [19] = 8'h3b;
    \27 [20] = 8'h3d;
    \27 [21] = 8'h3f;
    \27 [22] = 8'h3f;
    \27 [23] = 8'h3d;
    \27 [24] = 8'h3b;
    \27 [25] = 8'h37;
    \27 [26] = 8'h32;
    \27 [27] = 8'h2c;
    \27 [28] = 8'h26;
    \27 [29] = 8'h20;
  end
  assign _7_ = \27 [_0_];
  assign _1_ = { 27'h0000000, i } + 32'd1;
  assign _2_ = { 27'h0000000, i } == 32'd29;
  assign _3_ = _2_ ? 5'h00 : _1_[4:0];
  always @(posedge clk)
    _4_ <= _3_;
  always @(posedge clk)
    _5_ <= _7_;
  assign _0_ = 5'h1d - i;
  assign i = _4_;
  assign conv = _5_;
  assign conv2 = conv[6:0];
  assign sine = 240'h20262c32373b3d3f3f3d3b37322c262019130d08040200000204080d1319;
  assign dataout = conv2;
endmodule
