`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 06:14:38 PM
// Design Name: 
// Module Name: Time_Counter
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
module Time_Counter(
    input clk,
    input reset,
    input enable,
    output reg [15:0] clock_time = 'b0001_0010_0000_0000
    );
    always_ff @(posedge clk) begin
        if (enable) begin
            if (reset) begin
//                {hour_ten, hour, min_ten, min} <= 'b0001_0010_0000_0000;
                clock_time[15:12] <= 'd1;
                clock_time[11:8] <= 'd2;
                clock_time[7:4] <= 'd0;
                clock_time[3:0] <= 'd0;
            end else begin
                if (clock_time[7:4] == 'd5 && clock_time[3:0] == 'd9) begin
                    if (clock_time[15:12] == 'd1 && clock_time[11:8] == 'd2) begin
                        clock_time[15:12] <= 'd0;
                        clock_time[11:8] <= 'd1;
                    end else if (clock_time[15:12] == 'd0 && clock_time[11:8] == 'd9) begin
                        clock_time[15:12] <= 'd1;
                        clock_time[11:8] <= 'd0;
                    end else begin
                        clock_time[11:8] <= clock_time[11:8] + 'd1;
                    end
                    clock_time[7:4] <= 'd0;
                    clock_time[3:0] <= 'd0;
                end else if (clock_time[3:0] == 'd9) begin
                    clock_time[7:4] <= clock_time[7:4] + 'd1;
                    clock_time[3:0] <= 'd0;
                end else begin
                    clock_time[3:0] <= clock_time[3:0] + 'd1;
                end
            end
        end
    end
endmodule
