module D3_IN (D0, D1, D2, D3, D3_in);

input D0, D1, D2, D3;

output D3_in;

wire and1, and2, and3, and4, or1;

and(and1, D0, D3);

and(and2, !D0, !D1);

and(and3, !D2, !D3);

and(and4, and2, and3);

or(D3_in, and1, and4);

endmodule
