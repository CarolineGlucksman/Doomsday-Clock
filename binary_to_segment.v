`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:14 12/08/2015 
// Design Name: 
// Module Name:    binary_to_segment 
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
module binary_to_segment(bin,seven);    
input [3:0] bin;
output reg [6:0] seven; //Assume MSB is A, and LSB is G

initial //Initial block, used for correct simulations   
    seven=0;

always @ (*)
    case(bin)
		  // Seven = ABCDEFG
        4'b0000:  seven = 7'b0000001;
        4'b0001:  seven = 7'b1001111;
        4'b0010:  seven = 7'b0010010;
        4'b0011:  seven = 7'b0000110;
        4'b0100:  seven = 7'b1001100;
        4'b0101:  seven = 7'b0100100;
        4'b0110:  seven = 7'b0100000;
        4'b0111:  seven = 7'b0001111;
        4'b1000:  seven = 7'b0000000;
        4'b1001:  seven = 7'b0001100;
        4'b1010: seven = 7'b0001000;
        4'b1011: seven = 7'b0100000;
        4'b1100: seven = 7'b0110001;
        4'b1101: seven = 7'b1000010;
        4'b1110: seven = 7'b0110000;
        4'b1111: seven = 7'b0111000;  // This will show F
        //remember 0 means "light up"
        default:
                seven = 7'b0110000;
    endcase
endmodule