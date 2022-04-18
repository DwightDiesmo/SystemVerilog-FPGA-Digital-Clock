`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 06:43:51 PM
// Design Name: 
// Module Name: Clock
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


module Clock(
    input clk,
    input reset, 
    input enable,
    output [15:0] clock_time
);
    wire scaled_clk;
    Refresh_Counter #(.WL(27),.MAX(100000000-1)) CLOCK_DELAY (.clk(clk),.flag(scaled_clk));    
    Time_Counter TIMER (.clk(scaled_clk),.reset(reset),.enable(enable),.clock_time(clock_time));
endmodule
