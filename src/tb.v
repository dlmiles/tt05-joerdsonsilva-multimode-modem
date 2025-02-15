`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

// testbench is controlled by test.py
module tb ();

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    reg  clk;
    reg  rst_n;
    reg  ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;

    wire [1:0] sel = ui_in[1:0];
    wire [6:0] mod_out = uo_out[6:0];
    wire [7:7] demod_out = uo_out[7:7];
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
`ifdef GL_TEST
    wire VPWR = 1'b1;
    wire VGND = 1'b0;
`endif

`ifdef GL_TEST
    tt_um_joerdsonsilva_modem tt_um_joerdsonsilva_modem
`else
    tt_um_joerdsonsilva_top tt_um_joerdsonsilva_top
`endif
    (
    // include power ports for the Gate Level test
    `ifdef GL_TEST
        .VPWR(VPWR),
        .VGND(VGND),
    `endif
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
        );

endmodule
