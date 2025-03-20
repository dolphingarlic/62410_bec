`timescale 1ns / 1ps

module dac_nco_freq_controller_sv(
    input wire clk_in,
    input wire rst_in,

    input wire dma_axis_tvalid,
    input wire [31:0] dma_axis_tdata,
    output logic dma_axis_tready,

    output logic freq_axis_tvalid,
    output logic [47:0] freq_axis_tdata,
    input wire freq_axis_tready
);

    // TODO

endmodule
