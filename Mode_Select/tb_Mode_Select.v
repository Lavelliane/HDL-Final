//
//Verilog testbench HDL code for a 2-4 Decoder circuit
//
//Author: 				Jhury Kevin P. Lastre
//Course group:		Group 6
//Schedule:				Wednesday, 9AM - 12PM
`timescale 1 ns/ 1 ps

module tb_Mode_Select();

	reg [2:0] Coin;
	reg Enable, isRunning;
	wire [3:0]Mode;
	
	Mode_Select UUT (.Coin(Coin), .Enable(Enable), .isRunning(isRunning), .Mode(Mode));
	
	initial
	begin
	
		Coin = 3'd1; 	Enable = 1'd0;  isRunning = 1'd1; #10	
		Coin = 3'd1; 	Enable = 1'd1;  isRunning = 1'd0; #20
		
	
		$stop;
	end
	
	initial
		$monitor("Time: %3d ns\t Enable = %1b\t Coin = %3d\t isRunning = %1d\t Mode:%4b", $time, Enable, Coin, isRunning, Mode);

endmodule