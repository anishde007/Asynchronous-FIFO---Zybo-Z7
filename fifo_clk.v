`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 12:14:49
// Design Name: 
// Module Name: tenhz_gen
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
module fifoclock(
    input clk_100MHz,
    input reset,
    output reg clk_10Hz,
    output reg clk_25Hz
    );
    
    reg [23:0] counter_reg = 0;
    
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset) begin
            counter_reg <= 0;
            clk_10Hz <= 0;
            clk_25Hz <= 0;
        end
        else begin
            if(counter_reg == 9_999_999) begin
                counter_reg <= counter_reg + 1;
                clk_10Hz <= ~clk_10Hz;
            end
            else if(counter_reg == 2_499_999) begin
                counter_reg <= counter_reg + 1;
                clk_25Hz <= ~clk_25Hz;
            end
            else begin
                counter_reg <= counter_reg + 1;
            end
        end
    end
endmodule
