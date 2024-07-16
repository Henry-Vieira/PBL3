module decoder_duzen_sec(Q1, Q2, adm, bdm, cdm, ddm, edm, fdm, gdm);

	input Q1, Q2;
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	//LED A
	and(adm, Q1, !Q2);
	
	//LED B
	and(bdm, 0);
	
	//LED C
	and(cdm, !Q1, Q2);
	
	//LED D
	and(ddm, Q1, !Q2);
	
	//LED E
	and(edm, Q1);
	
	//LED F
	or(fdm, Q2, Q1);
	
	// LED G
	and(gdm, !Q2);

endmodule


