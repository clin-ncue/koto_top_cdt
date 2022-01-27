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


FUNCTION lpm_mux1 
(
	clock,
	data0x[38..0],
	data10x[38..0],
	data11x[38..0],
	data12x[38..0],
	data13x[38..0],
	data14x[38..0],
	data15x[38..0],
	data16x[38..0],
	data17x[38..0],
	data18x[38..0],
	data19x[38..0],
	data1x[38..0],
	data20x[38..0],
	data21x[38..0],
	data22x[38..0],
	data23x[38..0],
	data24x[38..0],
	data25x[38..0],
	data26x[38..0],
	data27x[38..0],
	data28x[38..0],
	data29x[38..0],
	data2x[38..0],
	data30x[38..0],
	data31x[38..0],
	data32x[38..0],
	data33x[38..0],
	data34x[38..0],
	data35x[38..0],
	data36x[38..0],
	data37x[38..0],
	data38x[38..0],
	data3x[38..0],
	data4x[38..0],
	data5x[38..0],
	data6x[38..0],
	data7x[38..0],
	data8x[38..0],
	data9x[38..0],
	sel[5..0]
)

RETURNS (
	result[38..0]
);
