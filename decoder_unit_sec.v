module decoder_unit_sec(Q1, Q2, Q3, Q4, aus, bus, cus, dus, eus, fus, gus);
	input Q1, Q2, Q3, Q4;
	output aus, bus, cus, dus, eus, fus, gus;

	// Led A
	and(A1, !Q2, Q1, !Q3, !Q4);
	and(A2, !Q1, !Q2, Q3);
	or(aus, A1, A2);
	
	// Led B
	and(B1, Q1, !Q2, Q3);
	and(B2, !Q1, Q2, Q3);
	or(bus, B1, B2);
	
	//LED C
	and(cus, !Q1, Q2, !Q3);
	
	//LED D
	and(D1, Q1, Q2, Q3);
	or(dus, D1, A1, A2);
	
	//LED E
	and(E1, !Q2, Q3);
	or(eus, E1, Q1);
	
	//LED F
	and(F11, Q1, !Q3, !Q4);
	and(F22, Q2, !Q3);
	and(F33, Q1, Q2);
	or(fus, F11, F22, F33);
	
	//LED G
	and(G1, !Q2, !Q3, !Q4);
	or(gus, G1, D1);
	
endmodule

	