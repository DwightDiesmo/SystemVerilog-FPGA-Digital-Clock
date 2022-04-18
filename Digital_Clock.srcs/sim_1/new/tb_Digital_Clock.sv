`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 08:05:52 PM
// Design Name: 
// Module Name: tb_Digital_Clock
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


module tb_Digital_Clock;
reg clk;
reg [15:0] switch;
wire [3:0] display;
wire [3:0] segment;
wire decimal_point;

Digital_Clock DUT (.clk(clk),.switch(switch),.display(display),.segment(segment),.decimal_point(decimal_point));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    switch[15] = 'b1; switch[0] = 'b1;
    @(posedge clk) switch[15] = 'b0;
    for(int i = 0; i < 100000000; i++) begin
        @(posedge clk);
    end
    #60 $finish;
end
endmodule
