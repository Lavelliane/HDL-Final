`timescale 1 ns / 1 ps
module tb_ChargingStation ();
	
	reg [2:0]Coin;
	reg Enable, Clk, nReset;
	wire [11:0]PresentTime;
	
	ChargingStation UUT ( .Clk(Clk), .nReset(nReset), .ModeEnable(Enable), .Coin(Coin), .PresentTime(PresentTime));
	
	initial
		Clk = 1'b0;
		
	always
		#5		Clk = ~Clk;
		
	initial begin
		$display("Charging Phone at %d ns...", $time);
		nReset = 1'b0;		                              #10
		nReset = 1'b1;	                 
							Enable = 1'd1;							
													Coin = 4'b0001;	#500
													
		$display("\nINSERTING COIN AGAIN at %d ns...\n", $time);
		
													Coin = 4'b0001;	#100//Inserting Coin again
													
		$display("\nREJECTED at %d ns...\n", $time);			
									
													Coin = 4'b0001;	#600
													
		$display("Finished Charging Phone. Insert Coin Again at %d ns.", $time);
		$stop;
	end
	
	initial
		$monitor("Time: %3d ns\t Clk = %b\t nReset = %1b\t Enable = %1b\t Coin = %1d\t Time Remaining = %1d:%1d%1d\t", $time, Clk, nReset, Enable, Coin, PresentTime[11:8], PresentTime[7:4], PresentTime[3:0]);
	
endmodule 