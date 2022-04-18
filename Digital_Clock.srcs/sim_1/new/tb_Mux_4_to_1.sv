`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 05:34:14 PM
// Design Name: 
// Module Name: tb_Mux_4_to_1
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


module tb_Mux_4_to_1;
parameter WL = 8;
reg [1:0] mux_select;
reg [WL-1:0] input_1, input_2, input_3, input_4;
wire [WL-1:0] mux_output;

Mux_4_to_1 #(.WL(WL)) DUT (.mux_select(mux_select),.input_1(input_1),.input_2(input_2),.input_3(input_3),.input_4(input_4),.mux_output(mux_output));
initial begin
    input_1 = 'd8;
    input_2 = 'd4;
    input_3 = 'd2;
    input_4 = 'd1;
    mux_select = 'd0;
    #10  mux_select = 'd1;
    #10  mux_select = 'd2;
    #10  mux_select = 'd3;
    #20 $finish;
end
endmodule
