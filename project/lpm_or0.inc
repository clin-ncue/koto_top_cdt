--Copyright (C) 1991-2010 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


FUNCTION lpm_or0 
(
	data0x[38..0],
	data10x[38..0],
	data11x[38..0],
	data12x[38..0],
	data13x[38..0],
	data14x[38..0],
	data15x[38..0],
	data1x[38..0],
	data2x[38..0],
	data3x[38..0],
	data4x[38..0],
	data5x[38..0],
	data6x[38..0],
	data7x[38..0],
	data8x[38..0],
	data9x[38..0]
)

RETURNS (
	result[38..0]
);
