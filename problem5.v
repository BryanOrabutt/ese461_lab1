
module problem5(rst, clk, req_0, req_1, gnt_0, gnt_1, idle);

input rst, req_0, req_1, clk;
output gnt_0, gnt_1, idle;
reg[2:0] cur_state, next_state;

localparam IDLE=3'b001, GNT0=3'b010, GNT1=3'b100;

//sequential logic to change state of FSM
always@(posedge clk or rst) begin
	if(rst) cur_state <= IDLE;
	else cur_state <= next_state;
end

//combinational logic to determine next state.
always@(req_0 or req_1 or cur_state) begin
	next_state = IDLE;

	case(cur_state)
		IDLE: 
			if(req_0) next_state <= GNT0;
			else if(req_1) next_state <= GNT1;
			else next_state <= IDLE;
		GNT0:
			if(req_0) next_state <= GNT0;
			else next_state <= IDLE;
		GNT1:
			if(req_1) next_state <= GNT1;
			else next_state <= IDLE;
		default:
			next_state <= IDLE;
	endcase
end

assign gnt_0 = cur_state[1];
assign gnt_1 = cur_state[2];
assign idle = cur_state[0];

endmodule
