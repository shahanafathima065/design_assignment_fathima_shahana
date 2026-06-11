`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:48:05
// Design Name: 
// Module Name: ram_tb
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


module ram_tb;

    reg        clk;
    reg        arstn;
    reg        wrenb;
    reg  [2:0] wr_addr;
    reg  [2:0] rd_addr;
    reg  [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate DUT
    ram uut (
        .clk(clk),
        .arstn(arstn),
        .wrenb(wrenb),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock: 10ns period, negedge triggered
    initial clk = 1;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars(0, ram_tb);

        // Apply reset
        arstn = 0; wrenb = 0;
        wr_addr = 0; rd_addr = 0; data_in = 0;
        #15;

        arstn = 1;  // Release reset

        // --- Write operations ---
        @(negedge clk); wrenb = 1; wr_addr = 3'd0; data_in = 8'hAA;
        @(negedge clk); wr_addr = 3'd1; data_in = 8'hBB;
        @(negedge clk); wr_addr = 3'd2; data_in = 8'hCC;
        @(negedge clk); wr_addr = 3'd3; data_in = 8'hDD;

        // --- Read operations ---
        @(negedge clk); wrenb = 0; rd_addr = 3'd0;
        @(negedge clk); $display("Read addr 0: %h (expected AA)", data_out);

        @(negedge clk); rd_addr = 3'd1;
        @(negedge clk); $display("Read addr 1: %h (expected BB)", data_out);

        @(negedge clk); rd_addr = 3'd2;
        @(negedge clk); $display("Read addr 2: %h (expected CC)", data_out);

        @(negedge clk); rd_addr = 3'd3;
        @(negedge clk); $display("Read addr 3: %h (expected DD)", data_out);

        // --- Test reset mid-operation ---
        @(negedge clk); arstn = 0;
        @(negedge clk); arstn = 1;
        @(negedge clk); rd_addr = 3'd0;
        @(negedge clk); $display("After reset, addr 0: %h (expected 00)", data_out);

        #20;
        $finish;
    end

endmodule

