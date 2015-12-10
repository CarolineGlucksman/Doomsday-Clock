`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:00 12/07/2015 
// Design Name: 
// Module Name:    countingup 
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
module countingup(output [6:0] seg, output [3:0] AN, input clk, input reset, input start);
	wire slowclock;
	reg [3:0] bin0, bin1, bin2, bin3;
	reg [15:0] big_bin;
	
	clock_divider #(.COUNTER_DIV(26)) clkdiv (slowclock, clk, reset, start);
	
	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			begin
			bin0 <= 0;
			bin1 <= 0;
			bin2 <= 0;
			bin3 <= 0;
			end
	else if (slowclock)
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
	end

	SegDisplay sg1(seg, AN, bin0, bin1, bin2, bin3, clk);
	


endmodule
