`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 05:56:02 PM
// Design Name: 
// Module Name: Digit_Display
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


module Digit_Display (
    input clk,
    input [3:0] hour_ten, hour, min_ten, min,
    output [3:0] display,
    output [6:0] segment,
    output decimal_point
    );
    assign decimal_point = 'b1;
    wire delay_signal;
    wire [1:0] mux_select;
    wire [3-1:0] display_value;
    wire [3:0] segment_value;
    
    Refresh_Counter #(.WL(19),.MAX(500000-1)) DELAY (.clk(clk),.flag(delay_signal));
    
    Refresh_Counter #(.WL(2),.MAX(3)) OUTPUT_COUNTER (.clk(delay_signal),.counter(mux_select));

    Mux_4_to_1 #(.WL(8)) DUT (
        .mux_select(mux_select),
        .input_1({'b0111,hour_ten}),
        .input_2({'b1011,hour}),
        .input_3({'b1101,min_ten}),
        .input_4({'b1110,min}),
        .mux_output({display_value, segment_value})
    );
    
    Display_Decoder DISPLAY_DECODER (
    .select(display_value),
    .display(display)
    );
    
    Segment_Decoder SEGMENT_DECODER (
    .bcd_value(segment_value),
    .segment(segment)
    );
endmodule
