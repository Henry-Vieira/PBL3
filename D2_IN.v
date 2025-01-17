module D2_IN (D0, D1, D2, D3, D2_in);

input D0, D1, D2, D3;

output D2_in;

wire and1, and2, or1, or2;

or(or1, D0, D1);

and(and1, or1, D2);

and(and2, !D0, D3);

or(D2_in, and1, and2);

endmodule
