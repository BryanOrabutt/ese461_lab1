
module problem5(rst, req_0, req_1, gnt_0, gnt_1, idle);

input rst, req_0, req_1;
output gnt_0, gnt_1, idle;
output reg[2:0] cur_state, next_state;

localparam IDLE=3'b001, GNT0=3'b010, GNT1=3'b100;

always@(rst) begin
	if(rst) state <= IDLE;
end


endmodule
