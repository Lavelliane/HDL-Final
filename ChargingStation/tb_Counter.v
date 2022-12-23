`timescale 1 ns / 1 ps
module tb_Counter();
	
	reg [3:0]CounterInput;
	reg CounterEnable, Clk, nReset;
	wire [11:0]PresentTime;
	
	Counter_Main UUT ( .Clk(Clk), .nReset(nReset), .CounterEnable(CounterEnable), .CounterInput(CounterInput), .PresentTime(PresentTime));
	
	initial
		Clk = 1'b0;
		
	always
		#5		Clk = ~Clk;
		
	initial begin
		$display("Starting simulation at %d ns...", $time);
		nReset = 1'b0;		            #10
		nReset = 1'b1;	
							CounterEnable = 1'd1;            
													   CounterInput= 4'b0001;	#1500
		$display("Finished simulation at %d ns.", $time);
		$stop;
	end
	
	initial
		$monitor("Time: %3d ns\t Clk = %b\t nReset = %1b\t Enable = %1b\t CounterInput= %1d\t PT = %1d:%1d%1d\t", $time, Clk, nReset, CounterEnable, CounterInput, PresentTime[11:8], PresentTime[7:4], PresentTime[3:0]);
	
endmodule 