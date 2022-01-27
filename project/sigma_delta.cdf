/* Quartus II 64-Bit Version 9.1 Build 222 10/21/2009 SJ Full Version */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(EPC16) MfrSpec(OpMask(0) FullPath("C:/Users/yctung/Desktop/CT_9_90_4/sigma_delta.pof"));
	P ActionCode(Cfg)
		Device PartName(EP2S90F1020) Path("C:/Users/jaylin/Desktop/KOTO DAQ/Top_CDT/Top_CDT_v34/") File("sigma_delta.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
