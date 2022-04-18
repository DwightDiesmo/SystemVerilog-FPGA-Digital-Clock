`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 08:14:13 PM
// Design Name: 
// Module Name: tb_Clock
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


module tb_Clock;
reg clk;
reg reset; 
reg enable;
wire [15:0] clock_time;
Clock DUT (.clk(clk),.reset(reset),.enable(enable),.clock_time(clock_time));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    @(posedge clk) reset = 'b1; enable = 'b1;
    @(posedge clk) reset = 'b0;
    for(int i = 0; i < 10000; i++) begin
        @(posedge clk);
    end
    #60 $finish;
end
endmodule
