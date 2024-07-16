module cronometro(H, M, L, C1, C2, C3, C4, C5, LL1, LL2, LL3, LL4, LL5, LL6, LL7, CLK_IN, D0SET, D0RST, D1SET, D1RST, D2SET, D2RST, D3SET, D3RST, D1DSET, D1DRST, a0, b0, c0, d0, e0, f0, g0, DG1, DG2, DG3, DG4, D0, D1, D2, D3, D0D, D1D);

input CLK_IN, D0SET, D0RST, D1SET, D1RST, D2SET, D2RST, D3SET, D3RST, D1DSET, D1DRST, H, M, L;

output DG1, DG2, DG3, DG4, a0, b0, c0, d0, e0, f0, g0, D0, D1, D2, D3, D0D, D1D, C1, C2, C3, C4, C5, LL1, LL2, LL3, LL4, LL5, LL6, LL7;

wire D0_, D1_, D2_, D3_, D1_IN, D2_IN, D3_IN, and1, and2, and3, and4, and5, or1, CLK_1S, S7;

frequency_divisor(CLK_IN, CLK_1S, S7);

// ENTRADAS D
D1_IN(D0, D1, D2, D3, D1_IN);
D2_IN(D0, D1, D2, D3, D2_IN);
D3_IN(D0, D1, D2, D3, D3_IN);

// UNIDADE
dFlipFlop FFD0(D0_, 0, CLK_1S, 0, D0, D0_);
dFlipFlop FFD1(D1_IN, 0, CLK_1S, 0, D1, D1_);
dFlipFlop FFD2(D2_IN, 0, CLK_1S, 0, D2, D2_);
dFlipFlop FFD3(D3_IN, 0, CLK_1S, 0, D3, D3_);

// CLK SEGUINTE
and(and1, D0, !D2);
and(and2,!D1, D3);
and(and3, and1, and2);

wire D0D_, D1D_, D0D, D1D, D0DSET, D0DRST, D1DSET, D1DRST;

// DEZENA
dFlipFlop FFD0D(D0D_, 0, and3, 0, D0D, D0D_);
dFlipFlop FFD1D(or1, 0, and3, 0, D1D, D1D_);

// ENTRADA D FFD0D
and(and4, D0D, D1D);
and(and5, D0D_, D1D_);
or(or1, and4, and5);

// Decoder 4B
decoder_unit_sec DCDUS(D0, D1, D2, D3, a0S, b0S, c0S, d0S, e0S, f0S, g0S);

// Decoder 2B
decoder_duzen_sec DCDDS(D0D, D1D, a1D, b1D, c1D, d1D, e1D, f1D, g1D);

wire L1_, L2_;

dFlipFlop FFL0(L1_, 0, S7, 0, L1, L1_);
dFlipFlop FFL1(L2_, 0, L1_, 0, L2, L2_);

and(and40, L0, L1);
and(and50, !L0, !L1);
or(or10, and40, and50);

and(DG1_, L1_, L2_);
and(DG2_, L1, L2_);
and(DG3_, L2, L1_);
and(DG4_, L2, L1);
	
not(DG1, DG1_);
not(DG2, 0);
not(DG3, DG3_);
not(DG4, DG4_);

wire a0S0, b0S0, c0S0, d0S0, e0S0, f0S0, g0S0;
// Setando Unit Sec pro digito 4
and(a0S0, a0S, DG4_);
and(b0S0, b0S, DG4_);
and(c0S0, c0S, DG4_);
and(d0S0, d0S, DG4_);
and(e0S0, e0S, DG4_);
and(f0S0, f0S, DG4_);
and(g0S0, g0S, DG4_);
	
// Setando Duzen Sec pro digito 3
wire a1D1, b1D1, c1D1, d1D1, e1D1, f1D1, g1D1;
and(a1D1, a1D, DG3_);
and(b1D1, b1D, DG3_);
and(c1D1, c1D, DG3_);
and(d1D1, d1D, DG3_);
and(e1D1, e1D, DG3_);
and(f1D1, f1D, DG3_);
and(g1D1, g1D, DG3_);
	
// exibindo nos digitos
or(a0, a1D1, a0S0);
or(b0, b1D1, b0S0);
or(c0, c1D1, c0S0);
or(d0, d1D1, d0S0);
or(e0, e1D1, e0S0);
or(f0, f1D1, f0S0);
or(g0, g1D1, g0S0);
	
	
// MATRIZ DE LEDS
matriz_led_nivel(0, H, M, L, C1, C2, C3, C4, C5, LL1, LL2, LL3, LL4, LL5, LL6, LL7, S7);

endmodule

