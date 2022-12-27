//CounterInput: 4-bit input to determine what mode to run
//CounterEnable: 1-bit input to determine if counter is on (Only on if coin is inserted)


module ChargingStation(
   input Clk, nReset, ModeEnable,
	input [2:0] Coin,
	output reg [11:0] PresentTime);

	wire [3:0]CounterInput, Mode;
	wire ControllerEnable, CounterEnable;
	wire [3:0] S1, S2, S3;
	
	
	Mode_Select getMode(.nReset(nReset), .Coin(Coin), .Enable(ModeEnable), .Mode(CounterInput));
	Controller controller(.nReset(nReset), .Mode(CounterInput),  .CounterEnable(CounterEnable), .PresentTime(PresentTime));
	ComplexCounter_4Bit C3(.Clk(Clk), .nReset(nReset), .Enable(S2==4'b0000 && S1 ==4'b0000 ), .Mode(CounterInput == 4'd1 ? 4'd1 : 4'd9), .Count(S3)); //1:59
	ComplexCounter_4Bit C2(.Clk(Clk), .nReset(nReset), .Enable(S1==4'b0000), .Mode(4'b0101), .Count(S2));  //5
	ComplexCounter_4Bit C1(.Clk(Clk), .nReset(nReset), .Enable(CounterEnable), .Mode(4'b1001), .Count(S1)); //9
	
	always@(*)
	begin
		if(!nReset)
			begin
				PresentTime = 12'b000000000000;
			end
		else
			PresentTime = {S3, S2, S1};//1:59
	end
	


			
endmodule