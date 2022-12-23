module ChargingStation(Coin, Enable, PresentTime, Clk, nReset);


	input [2:0]Coin;
	input Enable, Clk, nReset;
	output reg[11:0]PresentTime;
	
	wire [3:0]Mode; 
	wire [3:0]C_Input;
	wire C_En;
	wire [11:00] currentTime;
	
	Mode_Select 	MS(.Coin(Coin), .Enable(Enable), .Mode(Mode));
	Counter_Main	CM(.CounterInput(C_Input), .CounterEnable(C_En), .Clk(Clk), .nReset(nReset), .PresentTime(currentTime));	
	Controller   	 C(.Mode(Mode), .PresentTime(currentTime), .CounterInput(C_Input), .CounterEnable(C_En), .Clk(Clk), .nReset(nReset));
	
	always@(*)
	begin
		PresentTime <= currentTime;
	end



endmodule