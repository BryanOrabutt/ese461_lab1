
module problem4(s, r, q, xq);

input s, r,
output q, xq;

nor(q, r, xq);
nor(xq, s, q);

endmodule
