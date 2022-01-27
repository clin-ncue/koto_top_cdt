//altlvds_tx CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" COMMON_RX_TX_PLL="ON" DESERIALIZATION_FACTOR=8 DEVICE_FAMILY="Stratix II" ENABLE_CLK_LATENCY="ON" IMPLEMENT_IN_LES="OFF" INCLOCK_PERIOD=32000 INCLOCK_PHASE_SHIFT=1000 NUMBER_OF_CHANNELS=1 OUTCLOCK_RESOURCE="AUTO" OUTPUT_DATA_RATE=250 REGISTERED_INPUT="TX_CLKIN" USE_EXTERNAL_PLL="OFF" pll_areset tx_in tx_inclock tx_out CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1SP2 cbx_altaccumulate 2010:03:24:20:38:24:SJ cbx_altclkbuf 2010:03:24:20:38:24:SJ cbx_altddio_in 2010:03:24:20:38:24:SJ cbx_altddio_out 2010:03:24:20:38:24:SJ cbx_altlvds_tx 2010:03:24:20:38:24:SJ cbx_altsyncram 2010:03:24:20:38:24:SJ cbx_cyclone 2010:03:24:20:38:24:SJ cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_counter 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_lpm_mux 2010:03:24:20:38:24:SJ cbx_lpm_shiftreg 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_stratixiii 2010:03:24:20:38:24:SJ cbx_util_mgl 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_CL_ALTLVDS_Tx_1_inst157_altlvds_tx_altlvds_tx_component"
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



//synthesis_resources = reg 8 stratixii_lvds_transmitter 1 stratixii_pll 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"{-to pll} AUTO_MERGE_PLLS=ON;-name MULTICYCLE 7 -from txreg* -to tx*;-name MULTICYCLE_HOLD 8 -from txreg* -to tx*"} *)
module  CL_ALTLVDS_Tx_1_lvds_tx
	( 
	pll_areset,
	tx_in,
	tx_inclock,
	tx_out) /* synthesis synthesis_clearbox=1 */;
	input   pll_areset;
	input   [7:0]  tx_in;
	input   tx_inclock;
	output   [0:0]  tx_out;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   pll_areset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	(* ALTERA_ATTRIBUTE = {"PRESERVE_REGISTER=ON"} *)
	reg	[7:0]	txreg;
	wire  [0:0]   wire_tx_clk0;
	wire  [0:0]   wire_tx_dataout;
	wire  wire_pll_enable0;
	wire  [1:0]   wire_pll_sclkout;
	wire tx_pll_enable;

	// synopsys translate_off
	initial
		txreg = 0;
	// synopsys translate_on
	always @ ( posedge tx_inclock)
		  txreg <= tx_in;
	stratixii_lvds_transmitter   tx_0
	( 
	.clk0(wire_tx_clk0[0:0]),
	.datain(txreg),
	.dataout(wire_tx_dataout[0:0]),
	.enable0(wire_pll_enable0),
	.serialfdbkout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.postdpaserialdatain(1'b0),
	.serialdatain(1'b0)
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
		tx_0.channel_width = 8,
		tx_0.lpm_type = "stratixii_lvds_transmitter";
	assign
		wire_tx_clk0 = wire_pll_sclkout[0];
	stratixii_pll   pll
	( 
	.activeclock(),
	.areset(pll_areset),
	.clk(),
	.clkbad(),
	.clkloss(),
	.ena(tx_pll_enable),
	.enable0(wire_pll_enable0),
	.enable1(),
	.inclk({{1{1'b0}}, tx_inclock}),
	.locked(),
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
		pll.clk0_phase_shift = "-1000",
		pll.compensate_clock = "lvdsclk",
		pll.inclk0_input_frequency = 32000,
		pll.operation_mode = "normal",
		pll.pll_type = "fast",
		pll.sclkout0_phase_shift = "-1000",
		pll.vco_divide_by = 1,
		pll.vco_multiply_by = 8,
		pll.lpm_type = "stratixii_pll";
	assign
		tx_out = wire_tx_dataout,
		tx_pll_enable = 1'b1;
endmodule //CL_ALTLVDS_Tx_1_lvds_tx
//VALID FILE
