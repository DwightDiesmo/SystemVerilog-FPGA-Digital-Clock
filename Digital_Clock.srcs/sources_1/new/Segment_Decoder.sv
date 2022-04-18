`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 11:15:31 AM
// Design Name: 
// Module Name: Segment_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Segment_Decoder(
    input [3:0] bcd_value,
    output reg [6:0] segment
    );
    always @(*) begin
        case(bcd_value)
            'd0:
                segment = 'b1000000;
            'd1:
                segment = 'b1111001;
            'd2:
                segment = 'b0100100;
            'd3:
                segment = 'b0110000;
            'd4:
                segment = 'b0011001;
            'd5:
                segment = 'b0010010;
            'd6:
                segment = 'b0000010;
            'd7:
                segment = 'b1111000;
            'd8:
                segment = 'b0000000;
            'd9:
                segment = 'b0011000;
            'd10:
                segment = 'b0001000;
            'd11:
                segment = 'b0000011;
            'd12:
                segment = 'b1000110;
            'd13:
                segment = 'b0100001;
            'd14:
                segment = 'b0000110;
            'd15:
                segment = 'b0001110;
            default:
                segment = segment;
        endcase
    end
endmodule
