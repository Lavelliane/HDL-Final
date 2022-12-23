module Mode_Select(Coin, nReset,Enable, Mode);
	
	input nReset;
	input wire [2:0] Coin;
	input wire Enable;
	output reg [3:0]Mode;
	
	always@(*)
		begin
			if(!nReset)
				begin
					Mode = 4'b0000;
				end
			else
			begin
				if(Enable)
				begin
					if(Coin == 3'b001) //if 1 peso
						begin
						Mode = 4'b0001;
						end
					else if(Coin == 3'b101) //if 5 peso
						begin
						Mode = 4'b0101;
						end
				
				end		
			end
			
		

				
		
		end	
endmodule
	
	
	
	