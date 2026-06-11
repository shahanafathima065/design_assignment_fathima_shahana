`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:45:52
// Design Name: 
// Module Name: ram
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

module ram (
    input        clk,
    input        arstn,      // asynchronous reset, active LOW
    input        wrenb,      // 1 = write, 0 = read
    input  [2:0] wr_addr,    // 3-bit write address (8 locations)
    input  [2:0] rd_addr,    // 3-bit read address
    input  [7:0] data_in,    // 8-bit data input
    output reg [7:0] data_out // 8-bit data output
);

    // 8 x 8 memory array
    (* ram_style = "block" *)
reg [7:0] mem [0:7];
    

    integer i;

    always @(negedge clk or negedge arstn) begin
        if (!arstn) begin
            // Asynchronous reset: clear all memory and output
            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'b0;
            data_out <= 8'b0;
        end
        else begin
            if (wrenb) begin
                // Write operation
                mem[wr_addr] <= data_in;
            end
            else begin
                // Read operation
                data_out <= mem[rd_addr];
            end
        end
    end

endmodule
