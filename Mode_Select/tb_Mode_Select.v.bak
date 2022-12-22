//
//Verilog testbench HDL code for a 2-4 Decoder circuit
//
//Author: 				Jhury Kevin P. Lastre
//Course group:		Group 6
//Schedule:				Wednesday, 9AM - 12PM
`timescale 1 ns/ 1 ps

module tb_Decoder24();

	reg [1:0] a;
	reg en;
	
	wire [3:0] d;
	
	Decoder24 UUT (en, a, d);
	
	initial
	begin
	
		en = 0; 	a = 2'b00;  #10	
		en = 1;	a = 2'b00;  #10		
		en = 1;	a = 2'b01;  #10		
		en = 1;	a = 2'b01;  #10			
		en = 1;	a = 2'b11;  #10	
	
		$stop;
	end

endmodule