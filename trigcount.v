`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:51 11/09/2015 
// Design Name: 
// Module Name:    trigcount 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module trigcount(trigger, mode, Y); 
    input trigger;
	 input mode;
	 output reg [7:0] Y;
	 reg [3:0] bin0, bin1, bin2, bin3;
	 
	 //mode = 1 is countdown mode
	 
	 /*initial
		Y = 8'b0;
	
	always @ (posedge trigger)
	 if mode == 1 begin
		Y = Y + 4'b0001;
		end
		else begin
			Y = Y - 4'b001;*/

	always @ (posedge trigger)
	begin
		if (mode == 1)
			begin
		if(bin0 == 4'b000)
		begin  
			bin0 <= 4'b1001;
			if (bin1 == 4'b0000)
			begin  
				bin1 <= 4'b0101;
				if (bin2 == 4'b000) 
				begin 
					bin2 <= 4'b1001;
					if(bin3 == 4'b0000) 
						bin3 <= 4'b0101;
					else
						bin3 <= bin3 - 4'b0001;
				end
				else
					bin2 <= bin2 - 4'b0001;
			end
			else
				bin1 <= bin1 - 4'b0001;
		end
		else 
			bin0 <= bin0 - 4'b0001;
	end
	
	else if (mode == 0)
	begin
		if(bin0 == 4'b1001)
		begin  
			bin0 <= 0;
			if (bin1 == 4'b0101)
			begin  
				bin1 <= 0;
				if (bin2 == 4'b1001) 
				begin 
					bin2 <= 0;
					if(bin3 == 4'b0101) 
						bin3 <= 0;
					else
						bin3 <= bin3 + 4'b0001;
				end
				else
					bin2 <= bin2 + 4'b0001;
			end
			else
				bin1 <= bin1 + 4'b0001;
		end
		else 
			bin0 <= bin0 + 4'b0001;
	end
	
	Y = {{bin3}, {bin2}, {bin1}, {bin0}};

endmodule
