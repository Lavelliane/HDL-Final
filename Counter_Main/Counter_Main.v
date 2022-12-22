//CounterInput: 4-bit input to determine what mode to run
//CounterEnable: 1-bit input to determine if counter is on (Only on if coin is inserted)


module Counter_Main(CounterInput, CounterEnable, Clk, nReset, PresentTime);

	input [3:0]CounterInput;
	input CounterEnable, Clk, nReset;
	wire [3:0] S1, S2, S3;
	output [11:0]PresentTime;
	
	ComplexCounter_4Bit C3(.Clk(Clk), .nReset(nReset), .Enable(S2==4'b0000 && S1 ==4'b0000 ), .Mode(CounterInput == 4'd1 ? 4'b0001 : 4'd9), .Count(S3)); //1:59
	ComplexCounter_4Bit C2(.Clk(Clk), .nReset(nReset), .Enable(S1==4'b0000), .Mode(4'b0101), .Count(S2));  //5
	ComplexCounter_4Bit C1(.Clk(Clk), .nReset(nReset), .Enable(CounterEnable), .Mode(4'b1001), .Count(S1)); //9
	
	assign PresentTime = {S1, S2, S3};


			
endmodule
