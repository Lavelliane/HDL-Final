module Mode_Select(Coin, Enable, Mode);

	input wire [2:0] Coin;
	input wire Enable;
	output reg [3:0]Mode;
	
	always@(*)
		begin
			if(!Enable)
				Mode = 4'd0;
			else
				begin
					if(Coin == 3'b001)
						Mode = 4'b0010;
					else if(Coin == 3'b101)
						Mode = 4'b1010;
					else
						Mode = 4'b0000;
				end		
		
		end	
endmodule
	
	
	
	