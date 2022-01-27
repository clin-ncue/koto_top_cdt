//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Stratix II" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=16 ONE_INPUT_IS_CONSTANT="YES" aneb clock dataa datab CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_lpm_compare 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_lpm_compare0_inst87_lpm_compare_lpm_compare_component"
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



//synthesis_resources = reg 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_compare0_cmpr
	( 
	aneb,
	clock,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aneb;
	input   clock;
	input   [15:0]  dataa;
	input   [15:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
	tri0   [15:0]  dataa;
	tri0   [15:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	aneb_output_dffe0;
	wire  [0:0]  aneb_output_dffe_d_wire0;
	wire  [0:0]  aneb_output_dffe_q_wire0;
	wire  [0:0]  aneb_result_wire;
	wire  [41:0]  data_wire;
	wire  neq_wire;

	// synopsys translate_off
	initial
		aneb_output_dffe0 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  aneb_output_dffe0 <= aneb_output_dffe_d_wire0;
	assign
		aneb = neq_wire,
		aneb_output_dffe_d_wire0 = {(data_wire[0] | data_wire[1])},
		aneb_output_dffe_q_wire0 = aneb_output_dffe0,
		aneb_result_wire = aneb_output_dffe_q_wire0[0],
		data_wire = {datab[15], dataa[15], datab[14], dataa[14], datab[13], dataa[13], datab[12], dataa[12], datab[11], dataa[11], datab[10], dataa[10], datab[9], dataa[9], datab[8], dataa[8], datab[7], dataa[7], datab[6], dataa[6], datab[5], dataa[5], datab[4], dataa[4], datab[3], dataa[3], datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], ((data_wire[38] ^ data_wire[39]) | (data_wire[40] ^ data_wire[41])), ((data_wire[34] ^ data_wire[35]) | (data_wire[36] ^ data_wire[37])), ((data_wire[30] ^ data_wire[31]) | (data_wire[32] ^ data_wire[33])), ((data_wire[26] ^ data_wire[27]) | (data_wire[28] ^ data_wire[29])), ((data_wire[22] ^ data_wire[23]) | (data_wire[24] ^ data_wire[25])), ((data_wire[18] ^ data_wire[19]) | (data_wire[20] ^ data_wire[21])), ((data_wire[14] ^ data_wire[15]) | (data_wire[16] ^ data_wire[17])), ((data_wire[10] ^ data_wire[11]) | (data_wire[12] ^ data_wire[13])), ((data_wire[6] | data_wire[7]) | (data_wire[8] | data_wire[9])), (((data_wire[2] | data_wire[3]) | data_wire[4]) | data_wire[5])},
		neq_wire = aneb_result_wire;
endmodule //lpm_compare0_cmpr
//VALID FILE
