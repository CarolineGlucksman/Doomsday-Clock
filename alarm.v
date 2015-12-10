`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:51 12/09/2015 
// Design Name: 
// Module Name:    timer 
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
module alarm(output [6:0] seg, output [3:0] AN, input clk, input reset, input start, input increase
    );
	wire slowclock, ignore, push, pushdown, pushup;
	reg [3:0] bin0, bin1, bin2, bin3;
	reg [3:0] b0, b1, b2, b3;
	
	//RESET STILL NEEDS TO BE FIXED
	
	clock_divider #(.COUNTER_DIV(26)) clkdivalarm (slowclock, clk, reset, start);
	
	PushButton_Debouncer pbd1(clk, increase, push, pushdown, pushup);
	
	always @ (posedge push)
	begin
		if(b0 == 4'b1001)
		begin  
			b0 <= 0;
			if (b1 == 4'b0101)
			begin  
				b1 <= 0;
				if (b2 == 4'b1001) 
				begin 
					b2 <= 0;
					if(b3 == 4'b0101) 
						b3 <= 0;
					else
						b3 <= b3 + 4'b0001;
				end
				else
					b2 <= b2 + 4'b0001;
			end
			else
				b1 <= b1 + 4'b0001;
		end
		else 
			b0 <= b0 + 4'b0001;
	end
	
	always @ (posedge clk)
	begin
	if (reset)
	begin
		bin0 <= 4'b0;
		bin1 <= 4'b0;
		bin2 <= 4'b0;
		bin3 <= 4'b0;
	end
	else if (pushdown)
	begin
		bin0 <= b0;
		bin1 <= b1;
		bin2 <= b2;
		bin3 <= b3;
	end
else if (slowclock)
	begin
		if (bin3 == b3 && bin2 == b2 && bin1 == b1 && bin0 == b0) begin
			bin0 <= b0;
			bin1 <= b1;
			bin2 <= b2;
			bin3 <= b3;
		end		
		else if(bin0 == 4'b1001)
		begin  
			bin0 <= 0;
			if (bin1 == 4'b0101)
			begin  
				bin1 <= 0;
				if (bin2 == 4'b1001) 
				begin 
					bin2 <= 0;
					if(bin3 == 4'b0101) begin
						bin0 <= b0;
						bin1 <= b1;
						bin2 <= b2;
						bin3 <= b3;
						end
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
	


	SegDisplay sg4(seg, AN, bin0, bin1, bin2, bin3, clk);

endmodule
