//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" lpm_direction="UP" lpm_port_updown="PORT_UNUSED" lpm_width=16 aclr clock cnt_en q CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_lpm_counter 2010:03:24:20:38:24:SJ cbx_lpm_decode 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_lpm_counter0_inst89_lpm_counter_lpm_counter_component"
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



//synthesis_resources = lut 16 reg 16 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_counter0_cntr
	( 
	aclr,
	clock,
	cnt_en,
	q) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   cnt_en;
	output   [15:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   cnt_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire  [0:0]   wire_counter_comb_bita_5cout;
	wire  [0:0]   wire_counter_comb_bita_6cout;
	wire  [0:0]   wire_counter_comb_bita_7cout;
	wire  [0:0]   wire_counter_comb_bita_8cout;
	wire  [0:0]   wire_counter_comb_bita_9cout;
	wire  [0:0]   wire_counter_comb_bita_10cout;
	wire  [0:0]   wire_counter_comb_bita_11cout;
	wire  [0:0]   wire_counter_comb_bita_12cout;
	wire  [0:0]   wire_counter_comb_bita_13cout;
	wire  [0:0]   wire_counter_comb_bita_14cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [0:0]   wire_counter_comb_bita_2sumout;
	wire  [0:0]   wire_counter_comb_bita_3sumout;
	wire  [0:0]   wire_counter_comb_bita_4sumout;
	wire  [0:0]   wire_counter_comb_bita_5sumout;
	wire  [0:0]   wire_counter_comb_bita_6sumout;
	wire  [0:0]   wire_counter_comb_bita_7sumout;
	wire  [0:0]   wire_counter_comb_bita_8sumout;
	wire  [0:0]   wire_counter_comb_bita_9sumout;
	wire  [0:0]   wire_counter_comb_bita_10sumout;
	wire  [0:0]   wire_counter_comb_bita_11sumout;
	wire  [0:0]   wire_counter_comb_bita_12sumout;
	wire  [0:0]   wire_counter_comb_bita_13sumout;
	wire  [0:0]   wire_counter_comb_bita_14sumout;
	wire  [0:0]   wire_counter_comb_bita_15sumout;
	wire  [15:0]   wire_counter_reg_bit1a_adatasdata;
	wire  [15:0]   wire_counter_reg_bit1a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire [15:0]  data;
	wire  external_cin;
	wire  lsb_cin;
	wire  [15:0]  s_val;
	wire  [15:0]  safe_q;
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
	.datad(wire_counter_reg_bit1a_regout[0:0]),
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
	.datad(wire_counter_reg_bit1a_regout[1:1]),
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
	.datad(wire_counter_reg_bit1a_regout[2:2]),
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
	stratixii_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[3:3]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_3sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_3.extended_lut = "off",
		counter_comb_bita_3.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_3.shared_arith = "off",
		counter_comb_bita_3.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[4:4]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_4sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_4.extended_lut = "off",
		counter_comb_bita_4.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_4.shared_arith = "off",
		counter_comb_bita_4.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_5cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[5:5]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_5sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_5.extended_lut = "off",
		counter_comb_bita_5.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_5.shared_arith = "off",
		counter_comb_bita_5.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_6
	( 
	.cin(wire_counter_comb_bita_5cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_6cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[6:6]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_6sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_6.extended_lut = "off",
		counter_comb_bita_6.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_6.shared_arith = "off",
		counter_comb_bita_6.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_7
	( 
	.cin(wire_counter_comb_bita_6cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_7cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[7:7]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_7sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_7.extended_lut = "off",
		counter_comb_bita_7.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_7.shared_arith = "off",
		counter_comb_bita_7.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_8
	( 
	.cin(wire_counter_comb_bita_7cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_8cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[8:8]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_8sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_8.extended_lut = "off",
		counter_comb_bita_8.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_8.shared_arith = "off",
		counter_comb_bita_8.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_9
	( 
	.cin(wire_counter_comb_bita_8cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_9cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[9:9]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_9sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_9.extended_lut = "off",
		counter_comb_bita_9.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_9.shared_arith = "off",
		counter_comb_bita_9.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_10
	( 
	.cin(wire_counter_comb_bita_9cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_10cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[10:10]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_10sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_10.extended_lut = "off",
		counter_comb_bita_10.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_10.shared_arith = "off",
		counter_comb_bita_10.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_11
	( 
	.cin(wire_counter_comb_bita_10cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_11cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[11:11]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_11sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_11.extended_lut = "off",
		counter_comb_bita_11.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_11.shared_arith = "off",
		counter_comb_bita_11.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_12
	( 
	.cin(wire_counter_comb_bita_11cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_12cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[12:12]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_12sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_12.extended_lut = "off",
		counter_comb_bita_12.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_12.shared_arith = "off",
		counter_comb_bita_12.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_13
	( 
	.cin(wire_counter_comb_bita_12cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_13cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[13:13]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_13sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_13.extended_lut = "off",
		counter_comb_bita_13.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_13.shared_arith = "off",
		counter_comb_bita_13.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_14
	( 
	.cin(wire_counter_comb_bita_13cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_14cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[14:14]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_14sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_14.extended_lut = "off",
		counter_comb_bita_14.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_14.shared_arith = "off",
		counter_comb_bita_14.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_15
	( 
	.cin(wire_counter_comb_bita_14cout[0:0]),
	.combout(),
	.cout(),
	.datad(wire_counter_reg_bit1a_regout[15:15]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_15sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_15.extended_lut = "off",
		counter_comb_bita_15.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_15.shared_arith = "off",
		counter_comb_bita_15.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit1a_0
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[0:0]),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[0:0]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_1
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[1:1]),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[1:1]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_2
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[2:2]),
	.clk(clock),
	.datain(wire_counter_comb_bita_2sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[2:2]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_3
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[3:3]),
	.clk(clock),
	.datain(wire_counter_comb_bita_3sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[3:3]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_4
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[4:4]),
	.clk(clock),
	.datain(wire_counter_comb_bita_4sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[4:4]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_5
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[5:5]),
	.clk(clock),
	.datain(wire_counter_comb_bita_5sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[5:5]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_6
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[6:6]),
	.clk(clock),
	.datain(wire_counter_comb_bita_6sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[6:6]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_7
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[7:7]),
	.clk(clock),
	.datain(wire_counter_comb_bita_7sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[7:7]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_8
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[8:8]),
	.clk(clock),
	.datain(wire_counter_comb_bita_8sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[8:8]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_9
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[9:9]),
	.clk(clock),
	.datain(wire_counter_comb_bita_9sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[9:9]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_10
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[10:10]),
	.clk(clock),
	.datain(wire_counter_comb_bita_10sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[10:10]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_11
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[11:11]),
	.clk(clock),
	.datain(wire_counter_comb_bita_11sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[11:11]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_12
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[12:12]),
	.clk(clock),
	.datain(wire_counter_comb_bita_12sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[12:12]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_13
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[13:13]),
	.clk(clock),
	.datain(wire_counter_comb_bita_13sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[13:13]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_14
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[14:14]),
	.clk(clock),
	.datain(wire_counter_comb_bita_14sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[14:14]),
	.sclr(sclr),
	.sload((sset | sload)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_15
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[15:15]),
	.clk(clock),
	.datain(wire_counter_comb_bita_15sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[15:15]),
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
		wire_counter_reg_bit1a_adatasdata = (({16{sset}} & s_val) | ({16{(~ sset)}} & data));
	assign
		aclr_actual = aclr,
		clk_en = 1'b1,
		data = {16{1'b0}},
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		q = safe_q,
		s_val = {16{1'b1}},
		safe_q = wire_counter_reg_bit1a_regout,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b1,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule //lpm_counter0_cntr
//VALID FILE
