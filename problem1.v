
module problem1(a, b, c, d, out_0, out_1, y);

input a, b, c, d;
output out_0, out_1, y;

assign out_0 = a ^ b;
assign out_1 = c ^ d;
assign y = out_0 ^ out_1;

endmodule
