module D1_IN (D0, D1, D2, D3, D1_in);

	input D0, D1, D2, D3;

	output D1_in;


	wire and1, and2, and3, and4, or1;

	and(and1, D0, D1);

	and(and2, !D0, D3);

	and(and3, !D0, D2);

	and(and4, and3, !D1);

	or(or1, and1, and2);

	or(D1_in, or1, and4);

endmodule
