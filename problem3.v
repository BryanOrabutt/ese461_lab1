
module problem3(clk, d, q, xq);

input d, clk;
output reg q, xq;

always@(posedge clk) begin
	q <= d;
	xq <= ~d;
end

endmodule
