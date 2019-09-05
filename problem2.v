
module problem2(a, b, cin, w_0, w_1, w_2, s, cout);

input a, b, cin;
output w_0, w_1, w_2, s, cout;

assign w_0 = a ^ b;
assign s = w_0 ^ cin;
assign w_1 = w_0 | cin;
assign w_2 = a | b;
assign cout = w_1 | w_2;

endmodule
