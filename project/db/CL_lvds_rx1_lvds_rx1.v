//altlvds_rx CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" COMMON_RX_TX_PLL="ON" CYCLONEII_M4K_COMPATIBILITY="ON" DATA_ALIGN_ROLLOVER=8 DESERIALIZATION_FACTOR=8 DEVICE_FAMILY="Stratix II" ENABLE_DPA_MODE="ON" IMPLEMENT_IN_LES="OFF" INCLOCK_PERIOD=32000 INPUT_DATA_RATE=250 NUMBER_OF_CHANNELS=1 OUTCLOCK_RESOURCE="AUTO" REGISTERED_OUTPUT="ON" USE_EXTERNAL_PLL="OFF" pll_areset rx_channel_data_align rx_in rx_inclock rx_out rx_outclock CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48 LOW_POWER_MODE="AUTO" ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 9.1SP2 cbx_altaccumulate 2010:03:24:20:38:24:SJ cbx_altclkbuf 2010:03:24:20:38:24:SJ cbx_altddio_in 2010:03:24:20:38:24:SJ cbx_altddio_out 2010:03:24:20:38:24:SJ cbx_altlvds_rx 2010:03:24:20:38:24:SJ cbx_altsyncram 2010:03:24:20:38:24:SJ cbx_cyclone 2010:03:24:20:38:24:SJ cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_counter 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_lpm_mux 2010:03:24:20:38:24:SJ cbx_lpm_shiftreg 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_stratixiii 2010:03:24:20:38:24:SJ cbx_util_mgl 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_CL_Rx_inst101_CL_lvds_rx1_inst55_altlvds_rx_altlvds_rx_component"
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2010 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//altclkctrl CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CLOCK_TYPE="AUTO" DEVICE_FAMILY="Stratix II" inclk outclk
//VERSION_BEGIN 9.1SP2 cbx_altclkbuf 2010:03:24:20:38:24:SJ cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_lpm_mux 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_stratixiii 2010:03:24:20:38:24:SJ  VERSION_END

//synthesis_resources = clkctrl 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_lvds_rx1_altclkctrl1
	( 
	inclk,
	outclk) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  inclk;
	output   outclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [3:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_clkctrl3_outclk;
	wire [1:0]  clkselect;
	wire  [1:0]  clkselect_wire;
	wire ena;
	wire  [3:0]  inclk_wire;

	stratixii_clkctrl   clkctrl3
	( 
	.clkselect(clkselect_wire),
	.ena(ena),
	.inclk(inclk_wire),
	.outclk(wire_clkctrl3_outclk)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		clkctrl3.clock_type = "AUTO",
		clkctrl3.lpm_type = "stratixii_clkctrl";
	assign
		clkselect = {2{1'b0}},
		clkselect_wire = {clkselect},
		ena = 1'b1,
		inclk_wire = {inclk},
		outclk = wire_clkctrl3_outclk;
endmodule //CL_lvds_rx1_altclkctrl1

//synthesis_resources = clkctrl 1 reg 8 stratixii_lvds_receiver 1 stratixii_pll 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF;REMOVE_DUPLICATE_REGISTERS=OFF;{-to pll} AUTO_MERGE_PLLS=ON;-name SOURCE_MULTICYCLE 8 -from wire_rx_dataout* -to rxreg*;-name SOURCE_MULTICYCLE_HOLD 8 -from wire_rx_dataout* -to rxreg*"} *)
module  CL_lvds_rx1_lvds_rx1
	( 
	pll_areset,
	rx_channel_data_align,
	rx_in,
	rx_inclock,
	rx_out,
	rx_outclock) /* synthesis synthesis_clearbox=1 */;
	input   pll_areset;
	input   [0:0]  rx_channel_data_align;
	input   [0:0]  rx_in;
	input   rx_inclock;
	output   [7:0]  rx_out;
	output   rx_outclock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   pll_areset;
	tri0   [0:0]  rx_channel_data_align;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_rx_outclock_buf_outclk;
	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON"} *)
	reg	[7:0]	rxreg;
	wire  [0:0]   wire_rx_clk0;
	wire  [7:0]   wire_rx_dataout;
	wire  [5:0]   wire_pll_clk;
	wire  wire_pll_enable0;
	wire  wire_pll_locked;
	wire  [1:0]   wire_pll_sclkout;
	wire  outclock;
	wire rx_pll_enable;

	CL_lvds_rx1_altclkctrl1   rx_outclock_buf
	( 
	.inclk({{3{1'b0}}, wire_pll_clk[0]}),
	.outclk(wire_rx_outclock_buf_outclk));
	// synopsys translate_off
	initial
		rxreg = 0;
	// synopsys translate_on
	always @ ( posedge outclock)
		  rxreg <= wire_rx_dataout;
	stratixii_lvds_receiver   rx_0
	( 
	.bitslip(rx_channel_data_align),
	.bitslipmax(),
	.clk0(wire_rx_clk0[0:0]),
	.datain(rx_in),
	.dataout(wire_rx_dataout[7:0]),
	.dpalock(),
	.enable0(wire_pll_enable0),
	.postdpaserialdataout(),
	.serialdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipreset(1'b0),
	.dpahold(1'b0),
	.dpareset(1'b0),
	.dpaswitch(1'b1),
	.fiforeset(1'b0),
	.serialfbk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		rx_0.channel_width = 8,
		rx_0.data_align_rollover = 8,
		rx_0.enable_dpa = "on",
		rx_0.lpm_type = "stratixii_lvds_receiver";
	assign
		wire_rx_clk0 = wire_pll_sclkout[0];
	stratixii_pll   pll
	( 
	.activeclock(),
	.areset(pll_areset),
	.clk(wire_pll_clk),
	.clkbad(),
	.clkloss(),
	.ena(rx_pll_enable),
	.enable0(wire_pll_enable0),
	.enable1(),
	.inclk({{1{1'b0}}, rx_inclock}),
	.locked(wire_pll_locked),
	.scandataout(),
	.scandone(),
	.sclkout(wire_pll_sclkout),
	.testdownout(),
	.testupout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkswitch(1'b0),
	.fbin(1'b0),
	.pfdena(1'b1),
	.scanclk(1'b0),
	.scandata(1'b0),
	.scanread(1'b0),
	.scanwrite(1'b0),
	.testin({4{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		pll.clk0_divide_by = 8,
		pll.clk0_multiply_by = 8,
		pll.clk0_phase_shift = "-2000",
		pll.compensate_clock = "lvdsclk",
		pll.inclk0_input_frequency = 32000,
		pll.operation_mode = "normal",
		pll.pll_type = "fast",
		pll.sclkout0_phase_shift = "-2000",
		pll.vco_divide_by = 1,
		pll.vco_multiply_by = 8,
		pll.lpm_type = "stratixii_pll";
	assign
		outclock = wire_rx_outclock_buf_outclk,
		rx_out = rxreg,
		rx_outclock = outclock,
		rx_pll_enable = 1'b1;
endmodule //CL_lvds_rx1_lvds_rx1
//VALID FILE
