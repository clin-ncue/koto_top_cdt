//altlvds_tx CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" COMMON_RX_TX_PLL="ON" DESERIALIZATION_FACTOR=8 DEVICE_FAMILY="Stratix II" ENABLE_CLK_LATENCY="ON" IMPLEMENT_IN_LES="ON" INCLOCK_PERIOD=32000 INCLOCK_PHASE_SHIFT=2000 NUMBER_OF_CHANNELS=1 OUTCLOCK_RESOURCE="AUTO" OUTPUT_DATA_RATE=250 REGISTERED_INPUT="TX_CLKIN" USE_EXTERNAL_PLL="OFF" USE_NO_PHASE_SHIFT="OFF" pll_areset tx_in tx_inclock tx_out CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1SP2 cbx_altaccumulate 2010:03:24:20:43:42:SJ cbx_altclkbuf 2010:03:24:20:43:42:SJ cbx_altddio_in 2010:03:24:20:43:42:SJ cbx_altddio_out 2010:03:24:20:43:42:SJ cbx_altlvds_tx 2010:03:24:20:43:42:SJ cbx_altsyncram 2010:03:24:20:43:42:SJ cbx_cyclone 2010:03:24:20:43:43:SJ cbx_cycloneii 2010:03:24:20:43:43:SJ cbx_lpm_add_sub 2010:03:24:20:43:43:SJ cbx_lpm_compare 2010:03:24:20:43:43:SJ cbx_lpm_counter 2010:03:24:20:43:43:SJ cbx_lpm_decode 2010:03:24:20:43:43:SJ cbx_lpm_mux 2010:03:24:20:43:43:SJ cbx_lpm_shiftreg 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ cbx_stratix 2010:03:24:20:43:43:SJ cbx_stratixii 2010:03:24:20:43:43:SJ cbx_stratixiii 2010:03:24:20:43:43:SJ cbx_util_mgl 2010:03:24:20:43:43:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_CL_ALTLVDS_Tx_1_inst126_altlvds_tx_altlvds_tx_component"
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
//VERSION_BEGIN 9.1SP2 cbx_altclkbuf 2010:03:24:20:43:42:SJ cbx_cycloneii 2010:03:24:20:43:43:SJ cbx_lpm_add_sub 2010:03:24:20:43:43:SJ cbx_lpm_compare 2010:03:24:20:43:43:SJ cbx_lpm_decode 2010:03:24:20:43:43:SJ cbx_lpm_mux 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ cbx_stratix 2010:03:24:20:43:43:SJ cbx_stratixii 2010:03:24:20:43:43:SJ cbx_stratixiii 2010:03:24:20:43:43:SJ  VERSION_END

//synthesis_resources = clkctrl 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_ALTLVDS_Tx_1_altclkctrl2
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

	wire  wire_clkctrl14_outclk;
	wire [1:0]  clkselect;
	wire  [1:0]  clkselect_wire;
	wire ena;
	wire  [3:0]  inclk_wire;

	stratixii_clkctrl   clkctrl14
	( 
	.clkselect(clkselect_wire),
	.ena(ena),
	.inclk(inclk_wire),
	.outclk(wire_clkctrl14_outclk)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		clkctrl14.clock_type = "AUTO",
		clkctrl14.lpm_type = "stratixii_clkctrl";
	assign
		clkselect = {2{1'b0}},
		clkselect_wire = {clkselect},
		ena = 1'b1,
		inclk_wire = {inclk},
		outclk = wire_clkctrl14_outclk;
endmodule //CL_ALTLVDS_Tx_1_altclkctrl2


//altddio_out CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" WIDTH=1 aclr datain_h datain_l dataout outclock
//VERSION_BEGIN 9.1SP2 cbx_altddio_out 2010:03:24:20:43:42:SJ cbx_cycloneii 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ cbx_stratix 2010:03:24:20:43:43:SJ cbx_stratixii 2010:03:24:20:43:43:SJ cbx_stratixiii 2010:03:24:20:43:43:SJ  VERSION_END

//synthesis_resources = stratixii_io 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ANALYZE_METASTABILITY=OFF"} *)
module  CL_ALTLVDS_Tx_1_ddio_out2
	( 
	aclr,
	datain_h,
	datain_l,
	dataout,
	outclock) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   [0:0]  datain_h;
	input   [0:0]  datain_l;
	output   [0:0]  dataout;
	input   outclock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_ddio_outa_padio;

	stratixii_io   ddio_outa_0
	( 
	.areset(aclr),
	.combout(),
	.datain(datain_h),
	.ddiodatain(datain_l),
	.ddioregout(),
	.dqsbusout(),
	.linkout(),
	.outclk(outclock),
	.padio(wire_ddio_outa_padio[0:0]),
	.regout(),
	.ddioinclk(1'b0),
	.delayctrlin({6{1'b0}}),
	.dqsupdateen(1'b1),
	.inclk(1'b0),
	.inclkena(1'b1),
	.linkin(1'b0),
	.oe(1'b1),
	.offsetctrlin({6{1'b0}}),
	.outclkena(1'b1),
	.sreset(1'b0),
	.terminationcontrol({14{1'b0}})
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devoe(1'b0),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ddio_outa_0.ddio_mode = "output",
		ddio_outa_0.operation_mode = "output",
		ddio_outa_0.output_async_reset = "clear",
		ddio_outa_0.output_power_up = "low",
		ddio_outa_0.output_register_mode = "register",
		ddio_outa_0.output_sync_reset = "none",
		ddio_outa_0.lpm_type = "stratixii_io";
	assign
		dataout = wire_ddio_outa_padio;
endmodule //CL_ALTLVDS_Tx_1_ddio_out2


//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" LPM_WIDTH=2 aeb dataa datab
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:43:43:SJ cbx_lpm_add_sub 2010:03:24:20:43:43:SJ cbx_lpm_compare 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ cbx_stratix 2010:03:24:20:43:43:SJ cbx_stratixii 2010:03:24:20:43:43:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_ALTLVDS_Tx_1_cmpr2
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [1:0]  dataa;
	input   [1:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  dataa;
	tri0   [1:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [3:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = ((data_wire[0] ^ data_wire[1]) | (data_wire[2] ^ data_wire[3])),
		data_wire = {datab[1], dataa[1], datab[0], dataa[0]},
		eq_wire = aeb_result_wire;
endmodule //CL_ALTLVDS_Tx_1_cmpr2


//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" lpm_modulus=4 lpm_width=2 aclr clock q updown
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:43:43:SJ cbx_lpm_add_sub 2010:03:24:20:43:43:SJ cbx_lpm_compare 2010:03:24:20:43:43:SJ cbx_lpm_counter 2010:03:24:20:43:43:SJ cbx_lpm_decode 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ cbx_stratix 2010:03:24:20:43:43:SJ cbx_stratixii 2010:03:24:20:43:43:SJ  VERSION_END

//synthesis_resources = lut 2 reg 2 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_ALTLVDS_Tx_1_cntr2
	( 
	aclr,
	clock,
	q,
	updown) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	output   [1:0]  q;
	input   updown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   updown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [1:0]   wire_counter_reg_bit15a_adatasdata;
	wire  [1:0]   wire_counter_reg_bit15a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire cnt_en;
	wire [1:0]  data;
	wire  external_cin;
	wire  lsb_cin;
	wire  [1:0]  s_val;
	wire  [1:0]  safe_q;
	wire sclr;
	wire sload;
	wire sset;
	wire  updown_dir;
	wire  updown_lsb;
	wire  updown_other_bits;

	stratixii_lcell_comb   counter_comb_bita_0
	( 
	.cin(lsb_cin),
	.combout(),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.datad(wire_counter_reg_bit15a_regout[0:0]),
	.dataf(updown_lsb),
	.shareout(),
	.sumout(wire_counter_comb_bita_0sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_0.extended_lut = "off",
		counter_comb_bita_0.lut_mask = 64'h000000000000FF00,
		counter_comb_bita_0.shared_arith = "off",
		counter_comb_bita_0.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(),
	.cout(),
	.datad(wire_counter_reg_bit15a_regout[1:1]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_1sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_1.extended_lut = "off",
		counter_comb_bita_1.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_1.shared_arith = "off",
		counter_comb_bita_1.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit15a_0
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit15a_adatasdata[0:0]),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit15a_regout[0:0]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit15a_1
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit15a_adatasdata[1:1]),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit15a_regout[1:1]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		wire_counter_reg_bit15a_adatasdata = (({2{sset}} & s_val) | ({2{(~ sset)}} & data));
	assign
		aclr_actual = aclr,
		clk_en = 1'b1,
		cnt_en = 1'b1,
		data = {2{1'b0}},
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		q = safe_q,
		s_val = {2{1'b1}},
		safe_q = wire_counter_reg_bit15a_regout,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		updown_dir = updown,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule //CL_ALTLVDS_Tx_1_cntr2


//lpm_shiftreg CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" LPM_DIRECTION="RIGHT" LPM_WIDTH=4 aclr clock data load shiftin shiftout
//VERSION_BEGIN 9.1SP2 cbx_lpm_shiftreg 2010:03:24:20:43:43:SJ cbx_mgl 2010:03:24:21:01:05:SJ  VERSION_END

//synthesis_resources = reg 4 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_ALTLVDS_Tx_1_shift_reg2
	( 
	aclr,
	clock,
	data,
	load,
	shiftin,
	shiftout) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   [3:0]  data;
	input   load;
	input   shiftin;
	output   shiftout;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   [3:0]  data;
	tri0   load;
	tri1   shiftin;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[3:0]	shift_reg;
	wire  [3:0]  shift_node;

	// synopsys translate_off
	initial
		shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) shift_reg <= 4'b0;
		else
			if (load == 1'b1) shift_reg <= data;
			else  shift_reg <= shift_node;
	assign
		shift_node = {shiftin, shift_reg[3:1]},
		shiftout = shift_reg[0];
endmodule //CL_ALTLVDS_Tx_1_shift_reg2

//synthesis_resources = clkctrl 1 lut 2 reg 32 stratixii_io 1 stratixii_pll 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"{-to lvds_tx_pll} AUTO_MERGE_PLLS=ON"} *)
module  CL_ALTLVDS_Tx_1_lvds_tx2
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

	wire  wire_coreclk_buf_outclk;
	wire  [0:0]   wire_ddio_out_dataout;
	reg	dffe11;
	reg	[1:0]	dffe3a;
	reg	[1:0]	dffe4a;
	reg	[1:0]	dffe5a;
	reg	[1:0]	dffe6a;
	reg	[1:0]	dffe7a;
	reg	[1:0]	dffe8a;
	reg	sync_dffe1a;
	reg	[7:0]	tx_reg;
	wire  wire_cmpr10_aeb;
	wire  wire_cmpr9_aeb;
	wire  [1:0]   wire_cntr2_q;
	wire  wire_shift_reg12_shiftout;
	wire  wire_shift_reg13_shiftout;
	wire  [5:0]   wire_lvds_tx_pll_clk;
	wire  fast_clock;
	wire  [0:0]  h_input;
	wire  [0:0]  l_input;
	wire  load_signal;
	wire  slow_clock;
	wire  [7:0]  tx_in_wire;
	wire  w_reset;

	CL_ALTLVDS_Tx_1_altclkctrl2   coreclk_buf
	( 
	.inclk({{3{1'b0}}, wire_lvds_tx_pll_clk[2]}),
	.outclk(wire_coreclk_buf_outclk));
	CL_ALTLVDS_Tx_1_ddio_out2   ddio_out
	( 
	.aclr(w_reset),
	.datain_h(l_input),
	.datain_l(h_input),
	.dataout(wire_ddio_out_dataout),
	.outclock(fast_clock));
	// synopsys translate_off
	initial
		dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  dffe11 <= ((wire_cmpr9_aeb & sync_dffe1a) | (wire_cmpr10_aeb & (~ sync_dffe1a)));
	// synopsys translate_off
	initial
		dffe3a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b1)   dffe3a <= wire_cntr2_q;
	// synopsys translate_off
	initial
		dffe4a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b0)   dffe4a <= wire_cntr2_q;
	// synopsys translate_off
	initial
		dffe5a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b1)   dffe5a <= dffe3a;
	// synopsys translate_off
	initial
		dffe6a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b0)   dffe6a <= dffe4a;
	// synopsys translate_off
	initial
		dffe7a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b0)   dffe7a <= dffe5a;
	// synopsys translate_off
	initial
		dffe8a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		if (sync_dffe1a == 1'b1)   dffe8a <= dffe6a;
	// synopsys translate_off
	initial
		sync_dffe1a = 0;
	// synopsys translate_on
	always @ ( posedge slow_clock or  posedge w_reset)
		if (w_reset == 1'b1) sync_dffe1a <= 1'b0;
		else  sync_dffe1a <= (~ sync_dffe1a);
	// synopsys translate_off
	initial
		tx_reg = 0;
	// synopsys translate_on
	always @ ( posedge tx_inclock or  posedge w_reset)
		if (w_reset == 1'b1) tx_reg <= 8'b0;
		else  tx_reg <= tx_in;
	CL_ALTLVDS_Tx_1_cmpr2   cmpr10
	( 
	.aeb(wire_cmpr10_aeb),
	.dataa(dffe4a),
	.datab(dffe8a));
	CL_ALTLVDS_Tx_1_cmpr2   cmpr9
	( 
	.aeb(wire_cmpr9_aeb),
	.dataa(dffe3a),
	.datab(dffe7a));
	CL_ALTLVDS_Tx_1_cntr2   cntr2
	( 
	.aclr(w_reset),
	.clock(fast_clock),
	.q(wire_cntr2_q),
	.updown(sync_dffe1a));
	CL_ALTLVDS_Tx_1_shift_reg2   shift_reg12
	( 
	.aclr(w_reset),
	.clock(fast_clock),
	.data({tx_in_wire[1], tx_in_wire[3], tx_in_wire[5], tx_in_wire[7]}),
	.load(load_signal),
	.shiftin(1'b0),
	.shiftout(wire_shift_reg12_shiftout));
	CL_ALTLVDS_Tx_1_shift_reg2   shift_reg13
	( 
	.aclr(w_reset),
	.clock(fast_clock),
	.data({tx_in_wire[0], tx_in_wire[2], tx_in_wire[4], tx_in_wire[6]}),
	.load(load_signal),
	.shiftin(1'b0),
	.shiftout(wire_shift_reg13_shiftout));
	stratixii_pll   lvds_tx_pll
	( 
	.activeclock(),
	.areset(pll_areset),
	.clk(wire_lvds_tx_pll_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.inclk({1'b0, tx_inclock}),
	.locked(),
	.scandataout(),
	.scandone(),
	.sclkout(),
	.testdownout(),
	.testupout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkswitch(1'b0),
	.ena(1'b1),
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
		lvds_tx_pll.clk0_divide_by = 1,
		lvds_tx_pll.clk0_multiply_by = 4,
		lvds_tx_pll.clk0_phase_shift = "0",
		lvds_tx_pll.clk1_divide_by = 1,
		lvds_tx_pll.clk1_multiply_by = 4,
		lvds_tx_pll.clk1_phase_shift = "-2000",
		lvds_tx_pll.clk2_divide_by = 8,
		lvds_tx_pll.clk2_multiply_by = 8,
		lvds_tx_pll.clk2_phase_shift = "0",
		lvds_tx_pll.inclk0_input_frequency = 32000,
		lvds_tx_pll.operation_mode = "normal",
		lvds_tx_pll.lpm_type = "stratixii_pll";
	assign
		fast_clock = wire_lvds_tx_pll_clk[0],
		h_input = {wire_shift_reg13_shiftout},
		l_input = {wire_shift_reg12_shiftout},
		load_signal = dffe11,
		slow_clock = wire_coreclk_buf_outclk,
		tx_in_wire = tx_reg,
		tx_out = wire_ddio_out_dataout,
		w_reset = pll_areset;
endmodule //CL_ALTLVDS_Tx_1_lvds_tx2
//VALID FILE
