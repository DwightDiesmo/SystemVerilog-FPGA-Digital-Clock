`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 09:05:31 AM
// Design Name: 
// Module Name: Mux_2_to_1
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


module Mux_2_to_1(
    input clk,
    input mode_sel,
    input [15:0] clock_time, alarm_clock_time,
    output reg [15:0] clock_output,
    output reg [15:0] alarm
    );
    always_ff @(posedge clk) begin
        if (mode_sel) begin
            clock_output <= alarm_clock_time;
        end else begin
            clock_output = clock_time;
            if (clock_time == alarm_clock_time) begin
                alarm <= 'b1111111111111111;
            end else begin
                alarm <= 'b0000000000000000;
            end
        end
    end
endmodule
