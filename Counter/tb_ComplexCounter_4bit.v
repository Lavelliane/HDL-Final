/*****************************************************
*	File:					tb_ComplexCounter_4Bit.v
*	Author:				Thomas Lee Arquiza Castro
*  Class: 				CPE 3101L
*	Group/Schedule:	Group 6 Wed 9:00AM-12:00NN
*	Description:		Testbench file for Moore_3BitCounter
*****************************************************/

`timescale 1 ns / 1 ps
module tb_ComplexCounter_4Bit ();

	reg			Clk, nReset, Enable;
	reg  [3:0]  Mode
	wire [3:0]	Count;
	
	ComplexCounter_4Bit UUT ( .Clk(Clk), .nReset(nReset), .Enable(Enable), .Mode(Mode), .Count(Count) );
	
	initial
		Clk = 1'b0;
		
	always
		#5		Clk = ~Clk;
		
	initial begin
		$display("Starting simulation at %d ns...", $time);
		nReset = 1'b0;		            #10
		nReset = 1'b1;					   #90
		Enable = 1;    Mode = 4'd9;	#90
		nReset = 1'b0;					   #20
		nReset = 1'b1;		
		$display("Finished simulation at %d ns.", $time);
		$stop;
	end
	
	initial
		$monitor("Time: %3d ns\t Clk = %b\t nReset = %1b\t Mode = %1d\t Count = %4b == %1d", $time, Clk, nReset, Mode, Count, Count);
	
endmodule 