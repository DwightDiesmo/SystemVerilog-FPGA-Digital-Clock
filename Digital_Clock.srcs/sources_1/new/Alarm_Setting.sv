`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 08:20:44 AM
// Design Name: 
// Module Name: Alarm_Setting
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

module Alarm_Setting(
    input clk, enable, hour_up, min_up,
    output reg [3:0] hour_ten = 'd1, hour ='d2, min_ten ='d0, min ='d0
);
    always_ff @(posedge clk) begin
        if (enable) begin
            if (hour_up) begin
                if (hour_ten == 'd1 && hour =='d2) begin
                    hour_ten <= 'd0;
                    hour <= 'd1;
                end else if (hour == 'd9) begin
                    hour_ten <='d1;
                    hour <= 'd0;
                end else begin
                    hour <= hour + 'd1;
                end
            end
            else if (min_up) begin
                if (min_ten == 'd5 && min =='d9) begin
                    if (hour_ten == 'd1 && hour =='d2) begin
                        hour_ten <= 'd0;
                        hour <= 'd1;
                    end else if (hour == 'd9) begin
                        hour_ten <='d1;
                        hour <= 'd0;
                    end else begin
                        hour <= hour + 'd1;
                    end
                end else if (min =='d9) begin
                    min_ten <= min_ten + 'd1;
                    min <= 'd0;
                end else begin
                    min <= min + 'd1;
                end
            end           
        end
    end
endmodule

//module Alarm_Setting(
//        input enable,
//        input btnU, btnR,
//        output reg [3:0] hour_ten = 'd1, hour ='d2, min_ten = 'd0, min = 'd0
//    );
//    always_comb @(*) begin
//        if (enable) begin
//            if (btnU) begin
//                if (hour_ten == 'd1 && hour == 'd2)
//                    hour_ten = 'd0;
//                    hour = 'd1;
//                end else if (hour_ten == 'd0 && hour == 'd9) begin
//                    hour_ten = 'd1;
//                    hour = 'd0;
//                end else begin
//                    hour += 'd1;
//                end  
//            end else if (btnR) begin
//                if (min_ten == 'd5 && min == 'd9) begin
//                    min_ten = 'd0;
//                    min = 'd0;
//                    if (hour_ten == 'd1 && hour == 'd2)
//                        hour_ten = 'd0;
//                        hour = 'd1;
//                    end else if (hour_ten == 'd0 && hour == 'd9) begin
//                        hour_ten = 'd1;
//                        hour = 'd0;
//                    end else begin
//                        hour += 'd1;
//                    end  
//                end else if (min == 'd9) begin
//                    min_ten += 'd1;
//                    min = 'd0;
//                end else begin
//                    min += 'd1;
//                end
//            end
//        end
//    end
//endmodule
