`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 08:36:43 PM
// Design Name: 
// Module Name: tb_Time_Counter
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
module tb_Time_Counter;
reg clk;
reg reset;
reg enable;
wire [15:0] clock_time;
Time_Counter DUT (.clk(clk),.reset(reset),.enable(enable),.clock_time(clock_time));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    @(posedge clk) reset = 'b1; enable = 'b1;
    @(posedge clk) reset = 'b0;
    for(int x = 0; x < 10000; x++) begin
        @(posedge clk);
    end
    #60 $finish;
end
endmodule
