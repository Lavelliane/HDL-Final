/**************************************************
*	File	: 				Counter.v
*	Author:				Thomas Lee Arquiza Castro
*	Class: 				CpE 3101L
*	Group/Schedule: 	Group 6 Wed 9:00AM-12NN
*	Description:		HDL Design Entry File
**************************************************/

module Counter(
	input wire [3:0]  Input,
	input wire 			Clk, nReset, Enable,
	output reg [3:0]	PresentTime
);

	always @(posedge Clk, posedge nReset)
	begin
		if (!nReset)
			Count_out <= 4'd0;
		else if (Count_out == 4'd9)
			Count_out <= 4'd0;
		else if (Enable)
			Count_out <= Count_out + 4'd1;
	end

endmodule 
