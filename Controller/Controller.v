module Controller(Mode, PresentTime, CounterInput, CounterEnable, isRunning);

	input wire [3:0]Mode;
	input wire [11:0]PresentTime;
	output reg [3:0]CounterInput;
	output reg CounterEnable, isRunning;
	
	always@(*)
		begin
			if(PresentTime == 12'd0)
				begin
					CounterEnable = 1'b0;
					isRunning = 1'b0;
					CounterInput = 4'd0;
				end
			else
				begin
					case(Mode)
							4'b0010 : begin
											CounterEnable = 1'b1;
											isRunning = 1'b1;
											CounterInput = 4'd1;
										 end
							4'b1010 : begin
											CounterEnable = 1'b1;
											isRunning = 1'b1;
											CounterInput = 4'd5;
										 end
							default : begin
											CounterEnable = 1'bx;
											isRunning = 1'bx;
											CounterInput = 4'dx;
										 end
					endcase
				end
			
		end

endmodule