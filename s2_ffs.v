module s2_ffs(FF0, FF1, H, M, L, US, UA, AG, T, DFF0, DFF1);

input FF0, FF1, H, M, L, US, UA, AG, T;
output DFF0, DFF1;

wire;

and(and12, !FF0, FF1);

and(and22, !UA, L);
and(and32, AG, L);
and(and42, US, L);
and(and52, M, !L);
and(and62, !M, H);
and(and72, !T, H);

or(or12, and22, and32);
or(or22, and42, and52);
or(or32, and62, and72);
or(or42, or12, or22);
or(or52, or42, or32);

and(DFF1, and12, or52);

//primeira camada de ands
and(and82, !H, US);
and(and92, !UA, !US);
and(and102, !UA, !AG);
and(and112, !US, T);
and(and122, M, L);
and(and132, !T, !US);
and(and142, !US, !AG);

//segunda camada de ands
and(and152, and82, and92);
and(and162, and82, and102);
and(and172, and82, !M);
and(and182, and112, H);
and()

endmodule

