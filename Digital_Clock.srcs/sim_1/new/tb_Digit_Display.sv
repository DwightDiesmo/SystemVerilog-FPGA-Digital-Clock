`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 09:52:00 PM
// Design Name: 
// Module Name: tb_Digit_Display
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


module tb_Digit_Display;
parameter display_count = 4;
reg clk;
reg [3:0] hour_ten, hour, min_ten, min;
wire [display_count-1:0] display;
wire [6:0] segment;
wire decimal_point;

initial clk = 0;
always #5 clk = ~clk;

Digit_Display #(.display_count(4)) FOUR_DIGIT_DISPLAY (.clk(clk),.hour_ten(hour_ten),.hour(hour),.min_ten(min_ten),.min(min),.display(display),.segment(segment),.decimal_point(decimal_point));
initial begin
    @(posedge clk) hour_ten <= 'd1; hour <= 'd2; min_ten<='d0; min <= 'd0; 
    @(posedge clk) min <= 'd1;
    @(posedge clk) min <= 'd2;
    @(posedge clk) min <= 'd3;
    @(posedge clk) min <= 'd4;
    #60 $finish;
end

endmodule
