`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:05 11/09/2015 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	input clk,
	input PB,
	input mode,
	output [7:0] Y,
	wire PB_state,
	wire PB_down, PB_up
);

	 PushButton_Debouncer pbd0(clk, PB, PB_state, PB_down, PB_up);
	 
	 trigcount tc0(PB_state, mode, Y);
	 


endmodule
