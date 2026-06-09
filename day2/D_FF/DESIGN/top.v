`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 21:06:41
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(input d, rst, clk, output reg q, qbar);
always@(posedge clk)
begin
    if(rst) begin          // synchronous reset
        q    <= 1'b0;
        qbar <= 1'b1;
    end
    else begin
        q    <= d;         // output follows D input
        qbar <= ~d;
    end
end
endmodule
