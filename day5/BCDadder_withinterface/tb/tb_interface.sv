`timescale 1ns / 1ps

interface bcd_if;

    logic [3:0] A_BCD;
    logic [3:0] B_BCD;
    logic       cin_BCD;
    logic [3:0] S_BCD;
    logic       cout_BCD;

endinterface


module bcd_tb_interface;

    bcd_if intf();

    integer pass_count;
    integer fail_count;

    logic [3:0] expected_sum;
    logic       expected_cout;
    logic [3:0] test_no;
    logic       test_pass;

    BCD_adder_using_ripplecarryadder dut (
        .A_BCD    (intf.A_BCD),
        .B_BCD    (intf.B_BCD),
        .cin_BCD  (intf.cin_BCD),
        .S_BCD    (intf.S_BCD),
        .cout_BCD (intf.cout_BCD)
    );

    task apply_test;
        input [3:0] a;
        input [3:0] b;
        input       cin;
        input [3:0] exp_sum;
        input       exp_cout;

        begin
            test_no = test_no + 1;

            intf.A_BCD   = a;
            intf.B_BCD   = b;
            intf.cin_BCD = cin;

            expected_sum  = exp_sum;
            expected_cout = exp_cout;

            #10;

            if ((intf.S_BCD == expected_sum) &&
                (intf.cout_BCD == expected_cout)) begin

                test_pass  = 1'b1;
                pass_count = pass_count + 1;

                $display("--------------------------------------------------");
                $display("TEST %0d : PASS", test_no);
                $display("A=%0d B=%0d Cin=%0d | Sum=%0d Cout=%0d",
                         a, b, cin, intf.S_BCD, intf.cout_BCD);
            end
            else begin

                test_pass  = 1'b0;
                fail_count = fail_count + 1;

                $display("--------------------------------------------------");
                $display("TEST %0d : FAIL", test_no);
                $display("A=%0d B=%0d Cin=%0d", a, b, cin);
                $display("Expected: Sum=%0d Cout=%0d", expected_sum, expected_cout);
                $display("Actual  : Sum=%0d Cout=%0d", intf.S_BCD, intf.cout_BCD);
            end

            #10;
            test_pass = 1'b0;
        end
    endtask


    initial begin
        pass_count = 0;
        fail_count = 0;

        test_no       = 0;
        test_pass     = 0;
        expected_sum  = 0;
        expected_cout = 0;

        intf.A_BCD   = 4'd0;
        intf.B_BCD   = 4'd0;
        intf.cin_BCD = 1'b0;

        $display("==================================================");
        $display("BCD ADDER VERIFICATION STARTED");
        $display("==================================================");

        #10;

        apply_test(4'd3, 4'd4, 1'b0, 4'd7, 1'b0);
        apply_test(4'd5, 4'd6, 1'b0, 4'd1, 1'b1);
        apply_test(4'd8, 4'd7, 1'b1, 4'd6, 1'b1);
        apply_test(4'd9, 4'd9, 1'b1, 4'd9, 1'b1);

        #10;

        $display("==================================================");
        $display("BCD ADDER VERIFICATION COMPLETED");
        $display("Total PASS = %0d", pass_count);
        $display("Total FAIL = %0d", fail_count);
        $display("==================================================");

        #20;
        $finish;
    end

endmodule
