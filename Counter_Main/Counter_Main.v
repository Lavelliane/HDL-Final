//CounterInput: 4-bit input to determine what mode to run
//CounterEnable: 1-bit input to determine if counter is on (Only on if coin is inserted)


module Counter_Main(CounterInput, CounterEnable, Clk, nReset, S1, S2, S3, S4, S5, S6);

	input [3:0]CounterInput;
	input CounterEnable, Clk, nReset;
	output [3:0]S1, S2, S3, S4, S5, S6;
	


	ComplexCounter_4Bit C1(.Clk(Clk), .nReset(nReset), .Enable(CounterEnable), .Mode(4'd9), .Count(S1)); //9
	ComplexCounter_4Bit C2(.Clk(Clk), .nReset(nReset), .Enable(S0 == 4'd0), .Mode(4'd5), .Count(S2));  //5
	ComplexCounter_4Bit C3(.Clk(Clk), .nReset(nReset), .Enable(S0 == 4'd0), .Mode(CounterInput == 4'd1 ? 4'd1 : 4'd9), .Count(S3)); //1:59


			
endmodule