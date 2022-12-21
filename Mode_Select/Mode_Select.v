module Mode_Select(Coin, Enable, isRunning, Mode);

	input wire [2:0] Coin;
	input wire Enable, isRunning;
	output reg [3:0]Mode;
	
	always@(*)
		begin
			if(!Enable)
				Mode = 4'd0;
			else
				begin
					if(isRunning);
						//NOP
					else
						begin
							if(Coin == 3'b001)
								Mode = {3'b001, isRunning};
							else if(Coin == 3'b101)
								Mode = {3'b101, isRunning};
							else
								Mode = {3'b000, isRunning};	
						end
				end		
		
		end	
endmodule
	
	