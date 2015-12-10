`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:03:40 12/09/2015 
// Design Name: 
// Module Name:    doomsday 
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
module doomsday(output reg [6:0] seg, output reg [3:0] AN, input countup, input countdown, input timercount, input increase, input timerset, input alarmset, input alarmcount, input clk, input reset);
	reg upstart = 0;
	reg downstart = 0;
	reg timerstart = 0;
	reg alarmstart = 0;
	reg [3:0] bin0, bin1, bin2, bin3 = 0;
	wire [6:0] segtemp00, segtemp0, segtemp1, segtemp2, segtemp3;
	wire [3:0] ANtemp00, ANtemp0, ANtemp1, ANtemp2, ANtemp3;


		always @ (posedge clk) begin
			if (countup) begin
				upstart = 1;
				AN = ANtemp0;
				seg = segtemp0;
			end
			else if (countdown) begin
				downstart = 1;
				AN = ANtemp1;
				seg = segtemp1;
			end
			else if (timerset) begin
				AN = ANtemp2;
				seg = segtemp2;
				if (timercount) begin
					timerstart = 1;
				end
			end
			else if (alarmset) begin
				AN = ANtemp3;
				seg = segtemp3;
				if (alarmcount) begin
					alarmstart = 1;
				end
			end
			else begin
				upstart = 0;
				downstart = 0;
				timerstart = 0;
				alarmstart = 0;
				AN = ANtemp00;
				seg = segtemp00;
			end
		end

	//SegDisplay(segtemp00, ANtemp00, bin0, bin1, bin2, bin3, clk);
	//showclock showclk0(segtemp00, ANtemp00, bin3, bin2, bin1, bin0, clk);
	countingup clockfunction(segtemp00, ANtemp00, clk, 0, 1);
	countingup up1(segtemp0, ANtemp0, clk, reset, upstart);
	countingdown down1(segtemp1, ANtemp1, clk, reset, downstart);
	timer timer1(.seg(segtemp2), .AN(ANtemp2), .clk(clk), .reset(reset), .start(timerstart), .increase(increase), .mode(timerset));
	alarm alarm1(.seg(segtemp3), .AN(ANtemp3), .clk(clk), .reset(reset), .start(alarmstart), .increase(increase), .mode(alarmset));


	
endmodule
