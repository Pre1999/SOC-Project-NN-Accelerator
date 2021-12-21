module data_buffer (
	input clk,
	input reset,

	input write_enable,
	input read_enable,
	input [31:0] write_data,
	output [31:0] read_data,

	output buffer_full,
	output buffer_empty
);

reg [9:0] wptr;
reg [9:0] rptr;

reg [31:0] fifofile [0:1023]; // 1024 Deep FIFO memory

assign buffer_full = (wptr[8:0] == rptr[8:0]) & (wptr[9] != rptr[9]);
assign buffer_empty = (wptr == rptr);

always @(posedge clk) begin
	if(reset) begin
		wptr <= 10'h0;
		rptr <= 10'h0;
	end
	else  begin
		if(write_enable & ~buffer_full) begin
			fifofile[wptr[8:0]] <= write_data;
			wptr <= wptr + 10'h1;
		end
		if(read_enable & ~buffer_empty) begin
			rptr <= rptr + 10'h1;
		end
	end
end

assign read_data = fifofile[rptr[8:0]];

endmodule
