module ChargingStation(Coin, Enable, PresentTime, Clk, nReset);


	input [2:0]Coin;
	input Enable, Clk, nReset;
	output [11:0]PresentTime;
	
	wire [3:0]Mode; 
	wire [3:0]C_Input;
	wire C_En;
	
	Counter_Main	CM(.CounterInput(C_Input), .CounterEnable(C_En), .Clk(Clk), .nReset(nReset), .PresentTime(PresentTime));	
	Controller   	 C(.Mode(Mode), .PresentTime(PresentTime), .CounterInput(C_Input), .CounterEnable(C_En));
	Mode_Select 	MS(.Coin(Coin), .Enable(Enable), .Mode(Mode));



endmodule