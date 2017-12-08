module pwm(clk, rst_n, period, pulse_width, enable, pwm_out);
parameter WIDTH = 8;
input wire clk, rst_n;
input wire[WIDTH - 1:0] period;
input wire[WIDTH - 1:0] pulse_width;
input wire enable;
output wire pwm_out;

reg[WIDTH - 1:0] ticks_d, ticks_q;
reg pwm_q, pwm_d;


always@(*)

begin

	ticks_d = ticks_q + 1'b1;

	if(ticks_d > period)

	begin

		ticks_d = 8'b0;

	end

	pwm_d = (ticks_d < pulse_width)?1'b1:1'b0;

end

always @(posedge clk)

begin

	if(!rst_n)

	begin

		ticks_q <= 8'b0;

	end

	else

	begin

		ticks_q <= ticks_d;

	end

	pwm_q <= pwm_d;

end

assign pwm_out = (enable == 1)?pwm_q:1'b0;

endmodule


