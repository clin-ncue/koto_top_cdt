//altlvds_rx CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" COMMON_RX_TX_PLL="OFF" CYCLONEII_M4K_COMPATIBILITY="ON" DESERIALIZATION_FACTOR=6 DEVICE_FAMILY="Stratix II" IMPLEMENT_IN_LES="ON" INCLOCK_PERIOD=8000 INCLOCK_PHASE_SHIFT=0 INPUT_DATA_RATE=750 NUMBER_OF_CHANNELS=1 OUTCLOCK_RESOURCE="AUTO" PLL_OPERATION_MODE="NORMAL" PORT_RX_DATA_ALIGN="PORT_USED" REGISTERED_DATA_ALIGN_INPUT="OFF" REGISTERED_OUTPUT="ON" USE_EXTERNAL_PLL="OFF" rx_data_align rx_in rx_inclock rx_out rx_outclock CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48 LOW_POWER_MODE="AUTO" ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 9.1SP2 cbx_altaccumulate 2010:03:24:20:38:24:SJ cbx_altclkbuf 2010:03:24:20:38:24:SJ cbx_altddio_in 2010:03:24:20:38:24:SJ cbx_altddio_out 2010:03:24:20:38:24:SJ cbx_altlvds_rx 2010:03:24:20:38:24:SJ cbx_altsyncram 2010:03:24:20:38:24:SJ cbx_cyclone 2010:03:24:20:38:24:SJ cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_counter 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_lpm_mux 2010:03:24:20:38:24:SJ cbx_lpm_shiftreg 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_stratixiii 2010:03:24:20:38:24:SJ cbx_util_mgl 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_CL_lvds_rx_1_inst183_altlvds_rx_altlvds_rx_component"
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
module  CL_lvds_rx_1_altclkctrl
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

	wire  wire_clkctrl7_outclk;
	wire [1:0]  clkselect;
	wire  [1:0]  clkselect_wire;
	wire ena;
	wire  [3:0]  inclk_wire;

	stratixii_clkctrl   clkctrl7
	( 
	.clkselect(clkselect_wire),
	.ena(ena),
	.inclk(inclk_wire),
	.outclk(wire_clkctrl7_outclk)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		clkctrl7.clock_type = "AUTO",
		clkctrl7.lpm_type = "stratixii_clkctrl";
	assign
		clkselect = {2{1'b0}},
		clkselect_wire = {clkselect},
		ena = 1'b1,
		inclk_wire = {inclk},
		outclk = wire_clkctrl7_outclk;
endmodule //CL_lvds_rx_1_altclkctrl


//altddio_in CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" WIDTH=1 datain dataout_h dataout_l inclock
//VERSION_BEGIN 9.1SP2 cbx_altddio_in 2010:03:24:20:38:24:SJ cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_stratixiii 2010:03:24:20:38:24:SJ  VERSION_END

//synthesis_resources = stratixii_io 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ANALYZE_METASTABILITY=OFF"} *)
module  CL_lvds_rx_1_ddio_in
	( 
	datain,
	dataout_h,
	dataout_l,
	inclock) /* synthesis synthesis_clearbox=1 */;
	input   [0:0]  datain;
	output   [0:0]  dataout_h;
	output   [0:0]  dataout_l;
	input   inclock;

	wire  [0:0]   wire_ddio_ina_ddioregout;
	wire  [0:0]   wire_ddio_ina_regout;

	stratixii_io   ddio_ina_0
	( 
	.combout(),
	.ddioregout(wire_ddio_ina_ddioregout[0:0]),
	.dqsbusout(),
	.inclk(inclock),
	.linkout(),
	.padio(datain[0:0]),
	.regout(wire_ddio_ina_regout[0:0]),
	.areset(1'b0),
	.datain(1'b0),
	.ddiodatain(1'b0),
	.ddioinclk(1'b0),
	.delayctrlin({6{1'b0}}),
	.dqsupdateen(1'b1),
	.inclkena(1'b1),
	.linkin(1'b0),
	.oe(1'b1),
	.offsetctrlin({6{1'b0}}),
	.outclk(1'b0),
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
		ddio_ina_0.ddio_mode = "input",
		ddio_ina_0.input_async_reset = "none",
		ddio_ina_0.input_power_up = "low",
		ddio_ina_0.input_register_mode = "register",
		ddio_ina_0.input_sync_reset = "none",
		ddio_ina_0.operation_mode = "input",
		ddio_ina_0.lpm_type = "stratixii_io";
	assign
		dataout_h = wire_ddio_ina_regout,
		dataout_l = wire_ddio_ina_ddioregout;
endmodule //CL_lvds_rx_1_ddio_in


//dffpipe CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DELAY=1 WIDTH=1 clock d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 9.1SP2 cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratixii 2010:03:24:20:38:24:SJ cbx_util_mgl 2010:03:24:20:38:24:SJ  VERSION_END

//synthesis_resources = reg 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  CL_lvds_rx_1_dffpipe
	( 
	clock,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [0:0]  d;
	output   [0:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dffe8a;
	wire clrn;
	wire ena;
	wire prn;
	wire sclr;

	// synopsys translate_off
	initial
		dffe8a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe8a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe8a <= 1'b0;
		else if  (ena == 1'b1)   dffe8a <= (d & (~ sclr));
	assign
		clrn = 1'b1,
		ena = 1'b1,
		prn = 1'b1,
		q = dffe8a,
		sclr = 1'b0;
endmodule //CL_lvds_rx_1_dffpipe


//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" lpm_modulus=6 lpm_port_updown="PORT_UNUSED" lpm_width=3 clock cnt_en q
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_counter 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ  VERSION_END


//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" LPM_WIDTH=3 ONE_INPUT_IS_CONSTANT="YES" aeb dataa datab
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_lvds_rx_1_cmpr
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [2:0]  dataa;
	input   [2:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [2:0]  dataa;
	tri0   [2:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [7:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = (data_wire[0] | data_wire[1]),
		data_wire = {datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], (data_wire[6] ^ data_wire[7]), ((data_wire[2] ^ data_wire[3]) | (data_wire[4] ^ data_wire[5]))},
		eq_wire = aeb_result_wire;
endmodule //CL_lvds_rx_1_cmpr

//synthesis_resources = lut 3 reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_lvds_rx_1_cntr
	( 
	clock,
	cnt_en,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	output   [2:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_cmpr10_aeb;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [0:0]   wire_counter_comb_bita_2sumout;
	wire  [2:0]   wire_counter_reg_bit9a_adatasdata;
	wire  [2:0]   wire_counter_reg_bit9a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire  compare_result;
	wire  cout_actual;
	wire [2:0]  data;
	wire  external_cin;
	wire  lsb_cin;
	wire  [2:0]  modulus_bus;
	wire  modulus_trigger;
	wire  [2:0]  s_val;
	wire  [2:0]  safe_q;
	wire sclr;
	wire sload;
	wire sset;
	wire  time_to_clear;
	wire  updown_dir;
	wire  updown_lsb;
	wire  updown_other_bits;

	CL_lvds_rx_1_cmpr   cmpr10
	( 
	.aeb(wire_cmpr10_aeb),
	.dataa(safe_q),
	.datab(modulus_bus));
	stratixii_lcell_comb   counter_comb_bita_0
	( 
	.cin(lsb_cin),
	.combout(),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.datad(wire_counter_reg_bit9a_regout[0:0]),
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
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.datad(wire_counter_reg_bit9a_regout[1:1]),
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
	stratixii_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.datad(wire_counter_reg_bit9a_regout[2:2]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_2sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_2.extended_lut = "off",
		counter_comb_bita_2.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_2.shared_arith = "off",
		counter_comb_bita_2.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit9a_0
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit9a_adatasdata[0:0]),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit9a_regout[0:0]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit9a_1
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit9a_adatasdata[1:1]),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit9a_regout[1:1]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit9a_2
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit9a_adatasdata[2:2]),
	.clk(clock),
	.datain(wire_counter_comb_bita_2sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit9a_regout[2:2]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		wire_counter_reg_bit9a_adatasdata = (({3{sset}} & s_val) | ({3{(~ sset)}} & (({3{sload}} & data) | (({3{(~ sload)}} & modulus_bus) & {3{(~ updown_dir)}}))));
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		compare_result = wire_cmpr10_aeb,
		cout_actual = (((~ wire_counter_comb_bita_2cout[0:0]) ^ updown_other_bits) | (time_to_clear & updown_dir)),
		data = {3{1'b0}},
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		modulus_bus = 3'b101,
		modulus_trigger = cout_actual,
		q = safe_q,
		s_val = {3{1'b1}},
		safe_q = wire_counter_reg_bit9a_regout,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		time_to_clear = compare_result,
		updown_dir = 1'b1,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule //CL_lvds_rx_1_cntr


//lpm_mux CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" LPM_SIZE=6 LPM_WIDTH=1 LPM_WIDTHS=3 data result sel
//VERSION_BEGIN 9.1SP2 cbx_lpm_mux 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ  VERSION_END

//synthesis_resources = lut 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CL_lvds_rx_1_mux
	( 
	data,
	result,
	sel) /* synthesis synthesis_clearbox=1 */;
	input   [5:0]  data;
	output   [0:0]  result;
	input   [2:0]  sel;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [5:0]  data;
	tri0   [2:0]  sel;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire	wire_l1_w0_n0_mux_dataout;
	wire	wire_l1_w0_n1_mux_dataout;
	wire	wire_l1_w0_n2_mux_dataout;
	wire	wire_l1_w0_n3_mux_dataout;
	wire	wire_l2_w0_n0_mux_dataout;
	wire	wire_l2_w0_n1_mux_dataout;
	wire	wire_l3_w0_n0_mux_dataout;
	wire  [13:0]  data_wire;
	wire  [0:0]  result_wire_ext;
	wire  [8:0]  sel_wire;

	assign		wire_l1_w0_n0_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[1] : data_wire[0];
	assign		wire_l1_w0_n1_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[3] : data_wire[2];
	assign		wire_l1_w0_n2_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[5] : data_wire[4];
	assign		wire_l1_w0_n3_mux_dataout = (sel_wire[0] === 1'b1) ? data_wire[7] : data_wire[6];
	assign		wire_l2_w0_n0_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[9] : data_wire[8];
	assign		wire_l2_w0_n1_mux_dataout = (sel_wire[4] === 1'b1) ? data_wire[11] : data_wire[10];
	assign		wire_l3_w0_n0_mux_dataout = (sel_wire[8] === 1'b1) ? data_wire[13] : data_wire[12];
	assign
		data_wire = {wire_l2_w0_n1_mux_dataout, wire_l2_w0_n0_mux_dataout, wire_l1_w0_n3_mux_dataout, wire_l1_w0_n2_mux_dataout, wire_l1_w0_n1_mux_dataout, wire_l1_w0_n0_mux_dataout, {2{1'b0}}, data},
		result = result_wire_ext,
		result_wire_ext = {wire_l3_w0_n0_mux_dataout},
		sel_wire = {sel[2], {3{1'b0}}, sel[1], {3{1'b0}}, sel[0]};
endmodule //CL_lvds_rx_1_mux

//synthesis_resources = clkctrl 1 lut 9 reg 23 stratixii_io 1 stratixii_pll 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF;{-to lvds_rx_pll} AUTO_MERGE_PLLS=OFF"} *)
module  CL_lvds_rx_1_lvds_rx
	( 
	rx_data_align,
	rx_in,
	rx_inclock,
	rx_out,
	rx_outclock) /* synthesis synthesis_clearbox=1 */;
	input   rx_data_align;
	input   [0:0]  rx_in;
	input   rx_inclock;
	output   [5:0]  rx_out;
	output   rx_outclock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   rx_data_align;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_rx_outclock_buf_outclk;
	wire  [0:0]   wire_ddio_in_dataout_h;
	wire  [0:0]   wire_ddio_in_dataout_l;
	reg	[1:0]	cda_h_shiftreg3a;
	reg	[2:0]	cda_l_shiftreg4a;
	reg	[2:0]	h_shiftreg2a;
	reg	int_bitslip_reg;
	reg	[2:0]	l_shiftreg1a;
	reg	[5:0]	rx_reg;
	wire  [0:0]   wire_h_dffpipe_q;
	wire  [0:0]   wire_l_dffpipe_q;
	wire  [2:0]   wire_bitslip_cntr_q;
	wire  [0:0]   wire_h_mux5a_result;
	wire  [0:0]   wire_l_mux6a_result;
	wire  [5:0]   wire_lvds_rx_pll_clk;
	wire  bitslip;
	wire  [2:0]  bitslip_en;
	wire  [0:0]  ddio_dataout_h;
	wire  [0:0]  ddio_dataout_h_int;
	wire  [0:0]  ddio_dataout_l;
	wire  [0:0]  ddio_dataout_l_int;
	wire  fast_clock;
	wire  int_bitslip;
	wire  [5:0]  rx_out_wire;
	wire  slow_clock;

	CL_lvds_rx_1_altclkctrl   rx_outclock_buf
	( 
	.inclk({{3{1'b0}}, wire_lvds_rx_pll_clk[1]}),
	.outclk(wire_rx_outclock_buf_outclk));
	CL_lvds_rx_1_ddio_in   ddio_in
	( 
	.datain(rx_in),
	.dataout_h(wire_ddio_in_dataout_h),
	.dataout_l(wire_ddio_in_dataout_l),
	.inclock(fast_clock));
	// synopsys translate_off
	initial
		cda_h_shiftreg3a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  cda_h_shiftreg3a <= {cda_h_shiftreg3a[0], ddio_dataout_h[0]};
	// synopsys translate_off
	initial
		cda_l_shiftreg4a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  cda_l_shiftreg4a <= {cda_l_shiftreg4a[1:0], ddio_dataout_l[0]};
	// synopsys translate_off
	initial
		h_shiftreg2a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg2a <= {h_shiftreg2a[1:0], wire_l_mux6a_result};
	// synopsys translate_off
	initial
		int_bitslip_reg = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  int_bitslip_reg <= int_bitslip;
	// synopsys translate_off
	initial
		l_shiftreg1a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg1a <= {l_shiftreg1a[1:0], wire_h_mux5a_result};
	// synopsys translate_off
	initial
		rx_reg = 0;
	// synopsys translate_on
	always @ ( posedge slow_clock)
		  rx_reg <= rx_out_wire;
	CL_lvds_rx_1_dffpipe   h_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_h_int),
	.q(wire_h_dffpipe_q));
	CL_lvds_rx_1_dffpipe   l_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_l_int),
	.q(wire_l_dffpipe_q));
	CL_lvds_rx_1_cntr   bitslip_cntr
	( 
	.clock(fast_clock),
	.cnt_en(bitslip),
	.q(wire_bitslip_cntr_q));
	CL_lvds_rx_1_mux   h_mux5a
	( 
	.data({cda_l_shiftreg4a[2], cda_h_shiftreg3a[1], cda_l_shiftreg4a[1], cda_h_shiftreg3a[0], cda_l_shiftreg4a[0], ddio_dataout_h[0]}),
	.result(wire_h_mux5a_result),
	.sel(bitslip_en));
	CL_lvds_rx_1_mux   l_mux6a
	( 
	.data({cda_h_shiftreg3a[1], cda_l_shiftreg4a[1], cda_h_shiftreg3a[0], cda_l_shiftreg4a[0], ddio_dataout_h[0], ddio_dataout_l[0]}),
	.result(wire_l_mux6a_result),
	.sel(bitslip_en));
	stratixii_pll   lvds_rx_pll
	( 
	.activeclock(),
	.clk(wire_lvds_rx_pll_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.inclk({1'b0, rx_inclock}),
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
	.areset(1'b0),
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
		lvds_rx_pll.clk0_divide_by = 1,
		lvds_rx_pll.clk0_multiply_by = 3,
		lvds_rx_pll.clk0_phase_shift = "0",
		lvds_rx_pll.clk1_divide_by = 3,
		lvds_rx_pll.clk1_multiply_by = 3,
		lvds_rx_pll.clk1_phase_shift = "0",
		lvds_rx_pll.inclk0_input_frequency = 8000,
		lvds_rx_pll.operation_mode = "normal",
		lvds_rx_pll.lpm_type = "stratixii_pll";
	assign
		bitslip = ((~ int_bitslip_reg) & int_bitslip),
		bitslip_en = wire_bitslip_cntr_q,
		ddio_dataout_h = wire_h_dffpipe_q,
		ddio_dataout_h_int = wire_ddio_in_dataout_l,
		ddio_dataout_l = wire_l_dffpipe_q,
		ddio_dataout_l_int = wire_ddio_in_dataout_h,
		fast_clock = wire_lvds_rx_pll_clk[0],
		int_bitslip = rx_data_align,
		rx_out = rx_reg,
		rx_out_wire = {l_shiftreg1a[2], h_shiftreg2a[2], l_shiftreg1a[1], h_shiftreg2a[1], l_shiftreg1a[0], h_shiftreg2a[0]},
		rx_outclock = slow_clock,
		slow_clock = wire_rx_outclock_buf_outclk;
endmodule //CL_lvds_rx_1_lvds_rx
//VALID FILE
