module s1_ffs(FF0, FF1, H, M, L, US, UA, T, DFF0, DFF1);

input(FF0, FF1, H, M, L, US, UA, T);
output(DFF0, DFF1);

wire and11, and21, and31, and41, and51, and61, and71,and81, and91, and101, or11, or21, or31, or41, or51 ;

and(and11, FF0, !FF1);

and(and21, !H, L);
and(and31, M, L);

and(and41, !US, and21);
and(and51, !US, and31);

or(or11, and41, and51);

and(and61, !UA, L);
and(and71, L, US);
and(and81, M, !L);
and(and91, H, !M);
and(and101, H, !T);

or(or21, and61, and71);
or(or31, anr81, and91);
or(or41, or31, and101);
or(or51, or21, or41);

and(DFF0, and11, or11);
and(DFF1, and11, or51);

endmodule