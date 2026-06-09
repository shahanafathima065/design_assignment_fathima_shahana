`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 21:10:48
// Design Name: 
// Module Name: d_flipflop_tb
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


module d_flipflop_tb();
    reg d_tb, rst_tb, clk_tb;
    wire q_tb, qbar_tb;
    
    d_flipflop dut(d_tb, rst_tb, clk_tb, q_tb, qbar_tb);
    
    initial
    begin
        {d_tb, rst_tb, clk_tb} = 0;
    end
    
    always #5 clk_tb = ~clk_tb;   // 10ns clock period
    
    initial
    begin
        rst_tb = 1;
        #10;
        rst_tb = 0;
        d_tb = 0;
        #10;
        d_tb = 1;
        #10;
        d_tb = 0;
        #10;
        d_tb = 1;
        #10;
        rst_tb = 1;        // reset in between
        #10;
        rst_tb = 0;
        d_tb = 1;
        #10;
        d_tb = 0;
        #10;
        $finish;
    end
endmodule
