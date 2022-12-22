`timescale 1 ns / 1 ps
module tb_ChargingStation ();
	
	reg [2:0]Coin;
	reg Enable, Clk, nReset;
	wire [11:0]PresentTime;
	
	ChargingStation UUT ( .Clk(Clk), .nReset(nReset), .Enable(Enable), .Coin(Coin), .PresentTime(PresentTime));
	
	initial
		Clk = 1'b0;
		
	always
		#5		Clk = ~Clk;
		
	initial begin
		$display("Starting simulation at %d ns...", $time);
		nReset = 1'b0;		            #10
		nReset = 1'b1;	
							Enable = 1'd1;            
													Coin = 3'd1;	#2000
		$display("Finished simulation at %d ns.", $time);
		$stop;
	end
	
	initial
		$monitor("Time: %3d ns\t Clk = %b\t nReset = %1b\t Enable = %1b\t Coin = %1d\t PT = %1d:%1d%1d\t", $time, Clk, nReset, Enable, Coin, PresentTime[11:8], PresentTime[7:4], PresentTime[3:0]);
	
endmodule 