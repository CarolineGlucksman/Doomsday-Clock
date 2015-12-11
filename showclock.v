`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:37 12/10/2015 
// Design Name: 
// Module Name:    showclock 
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
module showclock(output [6:0] seg, output [3:0] AN, output reg [3:0] bin3, output reg [3:0] bin2, output reg [3:0] bin1, output reg [3:0] bin0, input clk
    );
	wire slowclock;
	wire reset = 0;
	wire start = 1;
	reg [3:0] d0, d1, d2, d3 = 0;
	
	clock_divider #(.COUNTER_DIV(26)) clkdiv8(slowclock, clk, reset, start);
	
	initial begin
	bin0 <= 4'b000;
	bin1 <= 4'b000;
	bin2 <= 4'b000;
	bin3 <= 4'b000;
	end
	
	always @ (posedge clk)
	if (slowclock)
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
	
	always @ (*) begin
		d0 <= bin0;
		d1 <= bin1;
		d2 <= bin2;
		d3 <= bin3;
		end

	SegDisplay sg1(seg, AN, d0, d1, d2, d3, clk);
	

endmodule
