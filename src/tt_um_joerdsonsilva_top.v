`default_nettype none 

module tt_um_joerdsonsilva_top (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset;
    wire [1:0] sel;
    wire [6:0] mod_out;
    wire [7:7] demod_out;

    assign reset = !rst_n;
    assign sel = ui_in[1:0];
    assign uo_out[6:0] = mod_out;
    assign uo_out[7:7] = demod_out;

    // IOs bidirecionais da UIO_OE
    assign uio_oe = 8'b00000000;

    // IOs bidirecionais da UIO_OUT
    assign uio_out = 8'b00000000;

    modem modem(.reset(reset), .clk(clk), .sel(sel), .mod_out(mod_out), .demod_out(demod_out));

    endmodule
