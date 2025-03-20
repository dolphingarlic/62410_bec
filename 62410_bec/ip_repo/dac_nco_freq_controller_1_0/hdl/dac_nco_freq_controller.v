
`timescale 1 ns / 1 ps

	module dac_nco_freq_controller #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [31:0] s00_axis_tdata,
		input wire [3:0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [47:0] m00_axis_tdata,
		output wire [5:0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);

    dac_nco_freq_controller_sv dac_nco_freq_controller_inst (
        .clk_in(s00_axis_aclk),
        .rst_in(~s00_axis_aresetn),
        
        .dma_axis_tvalid(s00_axis_tvalid),
        .dma_axis_tdata(s00_axis_tdata),
        .dma_axis_tready(s00_axis_tready),
        
        .freq_axis_tvalid(m00_axis_tvalid),
        .freq_axis_tdata(m00_axis_tdata),
        .freq_axis_tready(m00_axis_tready)
    );
    
    // We always only want to update the frequency (not the phase)
    assign m00_axis_tstrb = 6'b000111;
    assign m00_axis_tlast = 1'b1;

endmodule
