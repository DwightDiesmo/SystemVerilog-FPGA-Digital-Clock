`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 05:27:30 PM
// Design Name: 
// Module Name: Mux_4_to_1
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


module Mux_4_to_1 #(parameter WL = 4)(
    input [1:0] mux_select, 
    input [WL-1:0] input_1, input_2, input_3, input_4,
    output reg [WL-1:0] mux_output
    );
    
    always_comb begin
        case (mux_select)
            0: begin
                mux_output = input_1;
            end
            1: begin
                mux_output = input_2;
            end
            2: begin
                mux_output = input_3;
            end
            3: begin
                mux_output = input_4;
            end
        endcase
    end
endmodule
