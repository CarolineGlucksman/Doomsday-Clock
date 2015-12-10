`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:43 12/08/2015 
// Design Name: 
// Module Name:    seven_alternate 
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
module seven_alternate (bin0, bin1, bin2, bin3, small_bin, AN, clk);	
	input[3:0] bin0, bin1, bin2, bin3;		// This receives a huge 16 bit number
	output reg [3:0] small_bin;	// And returns one 4-bit number at a time (this goes into bin2bcd7)
	output reg [3:0] AN;		// While synchronizing it with the Anode signal
	input clk;  				// 1kHz clk	

	localparam N = 18;
	reg [N-1:0]count;
	always @ (posedge clk)
	begin
				count <= count + 1;
	end  			// we need to iterate through the displays	

	initial begin // Initial block, used for correct simulations	
		AN = 0;
		small_bin = 0;	
	end	

	always @ (*) begin	
		case (count[N-1:N-2])	
			2'b00: begin
				AN = 4'b1110;	
				small_bin = bin0;
			end	
			2'b01: begin
				AN = 4'b1101;	
				small_bin = bin1;
			end	
			2'b10: begin
				AN = 4'b1011;
				small_bin = bin2;
			end
			2'b11: begin	
				AN = 4'b0111;
				small_bin = bin3;
			end
			default: begin
				AN = 4'b0000;
				small_bin = 4'b0000;
			end
		endcase	
	end
endmodule	