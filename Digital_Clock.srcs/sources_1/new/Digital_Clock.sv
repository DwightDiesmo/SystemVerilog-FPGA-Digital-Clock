`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 11:10:33 AM
// Design Name: 
// Module Name: Digital_Clock
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


module Digital_Clock(
    input clk,
    input btnU, btnR,
    input [15:0] switch,
    output [3:0] display,
    output [6:0] segment,
    output [15:0] led,
    output decimal_point
    );
    wire alarm;
    wire [15:0] clock_time, clock_output;
    wire [3:0] alarm_hour_ten, alarm_hour, alarm_min_ten, alarm_min;
    Clock CLOCK (.clk(clk),.reset(switch[15]),.enable(switch[0]),.clock_time(clock_time));
    Alarm_Setting ALARM (.clk(clk),.enable(switch[1]),.hour_up(btnU),.min_up(btnR),.hour_ten(alarm_hour_ten),.hour(alarm_hour),.min_ten(alarm_min_ten),.min(alarm_min));
    Mux_2_to_1 MUX_MODE (.clk(clk),.mode_sel(switch[1]),.clock_time(clock_time),.alarm_clock_time({alarm_hour_ten, alarm_hour, alarm_min_ten, alarm_min}),.clock_output(clock_output),.alarm(led[15:0]));
    Digit_Display FOUR_DIGIT_DISPLAY (.clk(clk),.hour_ten(clock_output[15:12]),.hour(clock_output[11:8]),.min_ten(clock_output[7:4]),.min(clock_output[3:0]),.display(display),.segment(segment),.decimal_point(decimal_point));
endmodule
