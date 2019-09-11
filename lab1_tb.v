module lab1_tb();

reg clk, rst, a, b, c, d, cin, s, r, req0, req1;
reg[2:0] problem_number; //counter to show which problem is currently being tested.
wire out0, out1, y, w0, w1, w2, sum, cout, dq, dxq, srq, srxq, gnt0, gnt1, idle;
wire a2, b2;
reg d2;

problem1 uut1(.a(a), .b(b), .c(c), .d(d), .out_0(out0), .out_1(out1), .y(y));
problem2 uut2(.a(a2), .b(b2), .cin(cin), .w_0(w0), .w_1(w1), .w_2(w2), .s(sum), .cout(cout));
problem3 uut3(.clk(clk), .d(d2), .q(dq), .xq(dxq));
problem4 uut4(.s(s), .r(r), .q(srq), .xq(srxq));
problem5 uut5(.rst(rst), .clk(clk), .req_1(req1), .req_0(req0), .gnt_0(gnt0), .gnt_1(gnt1), .idle(idle));

assign a2 = c;
assign b2 = d;


initial begin

$dumpfile("lab1.vcd"); 
$dumpvars(0, lab1_tb); 

clk = 0;
rst = 0;
{a, b, c, d} = 4'h0;
cin = 0;
s = 0;
r = 0;
req0 = 0;
req1 = 0; 

//test problem1
#10
problem_number = 3'b001;
#140
//test problem2
rst = 1;
problem_number = 3'b010;
#5
rst = 0;
#45
cin = 1;
#40
//test problem3
problem_number = 3'b011;
#30
//test problem4
problem_number = 3'b100;
s = 1;
#15
s = 0;
r = 1;
#15
s = 1;
r = 1;
#5
s = 0;
r = 1;
#35
//test problem5
problem_number = 3'b101;
#5
req0 = 1;
#20
req0 = 0;
#10
req1 = 1;
#20
req1 = 0;
#20
rst = 1;
r = 0;
end

always	#10 clk = ~clk;
	
always@(posedge clk or rst) begin
	if(rst) {a,b,c,d} <= 4'h0;
	else {a,b,c,d} <= {a,b,c,d} + 4'h1;
	d2 <= #5 d;
end

initial #500 $finish;

endmodule
