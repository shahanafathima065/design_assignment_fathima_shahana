`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 07:50:49
// Design Name: 
// Module Name: fifo_tb_interface
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

interface fifo_if;

    logic clk;
    logic rst;
    logic wrenb;
    logic rdenb;
    logic [7:0] data_in;
    logic [7:0] data_out;
    logic full;
    logic empty;

endinterface


module fifo_tb_interface;

    fifo_if intf();

    integer pass_count;
    integer fail_count;

    logic [7:0] expected_data;
    logic [3:0] test_no;
    logic       test_pass;

    FIFO dut (
        .clk      (intf.clk),
        .rst      (intf.rst),
        .wrenb    (intf.wrenb),
        .rdenb    (intf.rdenb),
        .data_in  (intf.data_in),
        .data_out (intf.data_out),
        .full     (intf.full),
        .empty    (intf.empty)
    );

    initial begin
        intf.clk = 0;
        forever #5 intf.clk = ~intf.clk;
    end

    task write_data;
        input [7:0] data;

        begin
            @(posedge intf.clk);
            intf.wrenb   = 1'b1;
            intf.rdenb   = 1'b0;
            intf.data_in = data;

            @(posedge intf.clk);
            intf.wrenb   = 1'b0;

            $display("WRITE: data_in = %0h", data);
        end
    endtask

    task read_check;
        input [7:0] exp_data;

        begin
            test_no = test_no + 1;
            expected_data = exp_data;

            @(posedge intf.clk);
            intf.rdenb = 1'b1;
            intf.wrenb = 1'b0;

            @(posedge intf.clk);
            intf.rdenb = 1'b0;

            #1;

            $display("----------------------------------");
            $display("TEST %0d", test_no);
            $display("Expected Data = %0h", expected_data);
            $display("Actual Data   = %0h", intf.data_out);

            if (intf.data_out == expected_data) begin
                pass_count = pass_count + 1;
                test_pass = 1'b1;
                $display("Status        = PASS");
            end
            else begin
                fail_count = fail_count + 1;
                test_pass = 1'b0;
                $display("Status        = FAIL");
            end

            #10;
            test_pass = 1'b0;
        end
    endtask

    initial begin
        pass_count   = 0;
        fail_count   = 0;
        expected_data = 0;
        test_no      = 0;
        test_pass    = 0;

        intf.rst     = 1'b1;
        intf.wrenb   = 1'b0;
        intf.rdenb   = 1'b0;
        intf.data_in = 8'd0;

        $display("==================================");
        $display("FIFO VERIFICATION STARTED");
        $display("==================================");

        #20;
        intf.rst = 1'b0;

        write_data(8'h11);
        write_data(8'h22);
        write_data(8'h33);
        write_data(8'h44);

        read_check(8'h11);
        read_check(8'h22);
        read_check(8'h33);
        read_check(8'h44);

        $display("==================================");
        $display("FIFO VERIFICATION COMPLETED");
        $display("Total PASS = %0d", pass_count);
        $display("Total FAIL = %0d", fail_count);
        $display("==================================");

        #20;
        $finish;
    end

endmodule

