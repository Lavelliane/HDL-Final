`timescale 1 ns/1 ps
module tb_Controller();

	reg [3:0]Mode;
	reg [11:0]PresentTime;
	wire [3:0]CounterInput;
	wire CounterEnable, isRunning;
	
	Controller UUT(.Mode(Mode), .PresentTime(PresentTime), .CounterInput(CounterInput), .CounterEnable(CounterEnable), .isRunning(isRunning));
	
	initial begin
	
		$display("Starting Simulation at %0d ns...",$time);
		
		Mode = 4'b0000; PresentTime = 12'd0; 		#10
		Mode = 4'b0010; PresentTime = 12'd1024; 	#20
		Mode = 4'b1010; PresentTime = 12'd1024; 	#20
		
		$display("Finished Simulation at %0d ns...",$time);
		$stop;

	end
	
	initial begin
		$monitor("Time = %2d ns \t Mode = %b \t PresentTime = %b \tC_Input = %b \t C_En = %d \t \t isRunning = %b", $time, Mode, PresentTime, CounterInput, CounterEnable, isRunning);
	end
	
endmodule