/**************************************************
*	File	: 				ComplexCounter_3Bit.v
*	Author:				Thomas Lee Arquiza Castro
*	Class: 				CpE 3101L
*	Group/Schedule: 	Group 6 Wed 9:00AM-12NN
*	Description:		HDL Design Entry File
**************************************************/

module ComplexCounter_4Bit(
	input wire			Clk, nReset, Enable,
	input wire [3:0]  Mode,
	output reg [3:0]	Count
);

	reg [3:0]	cState, nState;
	
	always @ (negedge Clk)
	begin
		if (!nReset)
			cState <= 4'b1001; //9
		else
			cState <= nState;
	end
	
	always @ (cState)
	begin
	if (Enable)
	begin
		if (Mode == 4'd9)
		begin
			case (cState)
				4'b1001 : nState <= 4'b1000;  //9
				4'b1000 : nState <= 4'b0111;  //8
				4'b0111 : nState <= 4'b0110;  //7
				4'b0110 : nState <= 4'b0101;  //6
				4'b0101 : nState <= 4'b0100;  //5
				4'b0100 : nState <= 4'b0011;  //4
				4'b0011 : nState <= 4'b0010;  //3
				4'b0010 : nState <= 4'b0001;  //2
				4'b0001 : nState <= 4'b0000;  //1
				default : nState <= 4'b1001;  //0 -> 9
			endcase
		end
		else if (Mode == 4'd5)
		begin
			case (cState)
				4'b0101 : nState <= 4'b0100;  //5
				4'b0100 : nState <= 4'b0011;  //4
				4'b0011 : nState <= 4'b0010;  //3
				4'b0010 : nState <= 4'b0001;  //2
				4'b0001 : nState <= 4'b0000;  //1
				default : nState <= 4'b0101;  //0 -> 5
			endcase
		end
		else if (Mode == 4'd1)
		begin
			case (cState)
				4'b0001 : nState <= 4'b0000;  //1
				default : nState <= 4'b0101;  //0 -> 1
			endcase 
		end
	end
	else 
		nState <= 4'b0000;
	end
	
	always @ (cState)
	begin
			Count <= cState;
	end
	
endmodule 

