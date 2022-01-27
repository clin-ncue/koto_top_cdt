//lpm_add_sub CARRY_CHAIN="IGNORE" CARRY_CHAIN_LENGTH=48 DEVICE_FAMILY="Stratix II" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=16 ONE_INPUT_IS_CONSTANT="NO" clock dataa datab result
//VERSION_BEGIN 9.1SP2 cbx_cycloneii 2010:03:24:20:38:24:SJ cbx_lpm_add_sub 2010:03:24:20:38:24:SJ cbx_mgl 2010:03:24:21:00:10:SJ cbx_stratix 2010:03:24:20:38:24:SJ cbx_stratixii 2010:03:24:20:38:24:SJ  VERSION_END
//CBXI_INSTANCE_NAME="sigma_delta_lpm_add_sub0_inst39_lpm_add_sub_lpm_add_sub_component"
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



//synthesis_resources = lut 17 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_add_sub0_add_sub
	( 
	clock,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [15:0]  dataa;
	input   [15:0]  datab;
	output   [15:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
	tri0   [15:0]  dataa;
	tri0   [15:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	[15:0]	wire_pipeline_dffe_Q;
	wire	[15:0]	wire_pipeline_dffe_D;
	wire	[15:0]	wire_result_int;

	assign
		wire_result_int = dataa - datab;
	//synopsys translate_off
	initial
		wire_pipeline_dffe_Q = 0;
	//synopsys translate_on
	always @(posedge clock)
		wire_pipeline_dffe_Q <= wire_pipeline_dffe_D;
	assign
		result = wire_pipeline_dffe_Q[15:0],
		wire_pipeline_dffe_D[15:0] = wire_result_int;
endmodule //lpm_add_sub0_add_sub
//VALID FILE
