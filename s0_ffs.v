module s0_ffs(FF0, FF1, H, M, L, US, UA, T, AG, DFF0, DFF1);

input FF0, FF1, H, M, L, US, UA, T, AG;
output DFF0, DFF1;

wire and1, and2, and3, and4, and5, or1, or2;

and(and1, !FF0, !FF1);

and(and2, H, M);

and(and3, and2, L);

and(and4, and3, !US);

or(or1, !UA, !T);
or(or2, or1, US);

and(and5, or2, and3;

and(DFF1, and1, and5);
and(DFF0, and1, and4);

endmodule