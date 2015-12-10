`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:15 12/07/2015 
// Design Name: 
// Module Name:    SegDisplay 
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
module SegDisplay(output [6:0] seg, output [3:0] AN, input [3:0] bin0, input [3:0] bin1, input [3:0] bin2, input [3:0] bin3, input clk);

	wire[3:0] small_bin;
	seven_alternate sa3 (.bin0(bin0), .bin1(bin1), .bin2(bin2), .bin3(bin3), .small_bin(small_bin), .AN(AN), .clk(clk));
	
	binary_to_segment b2s3(.bin(small_bin),.seven(seg));

endmodule
