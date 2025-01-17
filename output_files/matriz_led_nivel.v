module matriz_led_nivel(AL, A, M, B, C1, C2, C3, C4, C5, L1, L2, L3, L4, L5, L6, L7, S7);
 
	input AL, A, M, B, S7;
	output C1, C2, C3, C4, C5, L1, L2, L3, L4, L5, L6, L7;
	
	not(NOT_A, A);
	not(NOT_B, B);
	not(NOT_M, M);
	not(NOT_AL, AL);
	
	wire Q1, Q2, Q3, Q1_, Q2_, Q3_;
	
	dFlipFlop(Q1_, 0, S7, 0, Q1, Q1_);
	dFlipFlop(Q2_, 0, Q1_, 0, Q2, Q2_);
	dFlipFlop(Q3_, 0, Q2_, 0, Q3, Q3_);
	
	and(C1, Q1_, Q2_, Q3_);
	and(C2, Q1, Q2_, Q3_);
	and(C3, Q1_, Q2, Q3_);
	and(C4, Q1, Q2, Q3_);
	and(C5, Q1_, Q2_, Q3);
	
	// Nivel Baixo
	
	or(B1, C1, C2, C3, C4, C5, C6);
	or(B2, C1, C2, C3, C4, C5, C6);
	or(B3, C1, C2, C3, C4, C5, C6);
	or(B4, C1, C2, C3, C4, C5, C6);
	or(B5, C1, C2, C3, C4, C5, C6);
	or(B6, C1, C2, C3, C4, C5, C6);
	
	and(B_S1, B1, B, NOT_A, NOT_M, NOT_AL);
	and(B_S2, B2, B, NOT_A, NOT_M, NOT_AL);
	and(B_S3, B3, B, NOT_A, NOT_M, NOT_AL);
	and(B_S4, B4, B, NOT_A, NOT_M, NOT_AL);
	and(B_S5, B5, B, NOT_A, NOT_M, NOT_AL);
	and(B_S6, B6, B, NOT_A, NOT_M, NOT_AL);
	
	// Nivel Medio
	
	or(M1, C1, C2, C3, C4, C5, C6);
	or(M2, C1, C2, C3, C4, C5, C6);
	or(M3, C1, C2, C3, C4, C5, C6);
	or(M5, C1, C2, C3, C4, C5, C6);
	or(M6, C1, C2, C3, C4, C5, C6);
	
	and(M_S1, M1, B, NOT_A, M, NOT_AL);
	and(M_S2, M2, B, NOT_A, M, NOT_AL);
	and(M_S3, M3, B, NOT_A, M, NOT_AL);
	and(M_S5, M5, B, NOT_A, M, NOT_AL);
	and(M_S6, M6, B, NOT_A, M, NOT_AL);
	
	// Nivel ALto
	
	or(A2, C1, C2, C3, C4, C5, C6);
	or(A3, C1, C2, C3, C4, C5, C6);
	or(A5, C1, C2, C3, C4, C5, C6);
	or(A6, C1, C2, C3, C4, C5, C6);
	
	and(A_S2, A2, B, A, M, NOT_AL);
	and(A_S3, A3, B, A, M, NOT_AL);
	and(A_S5, A5, B, A, M, NOT_AL);
	and(A_S6, A6, B, A, M, NOT_AL);

	// Exibindo na matriz

	
	or(L1, B_S1, M_S1);
	or(L2, B_S2, M_S2, A_S2);
	or(L3, B_S3, M_S3, A_S3);
	or(L4, B_S4);
	or(L5, B_S5, M_S5, A_S5);
	or(L6, B_S6, M_S6, A_S6);
	
endmodule
