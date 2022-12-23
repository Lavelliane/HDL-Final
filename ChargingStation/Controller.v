module Controller(
	input [3:0]Mode,
	input [11:0] PresentTime,
	output reg CounterEnable, 
	input nReset);

	
	always@(*)
		begin
			if(!nReset)
				CounterEnable = 1'b0;
			else
			begin
				if(PresentTime == 12'b000000000000)
						begin
							case(Mode)
								4'b0001 : begin
												CounterEnable = 1'b1;
											 end
								4'b0101 : begin
												CounterEnable = 1'b1;
											 end
								default : begin
												CounterEnable = 1'b0;
											 end
							endcase
						end
					
			end
			
					
			
					
		end

endmodule
