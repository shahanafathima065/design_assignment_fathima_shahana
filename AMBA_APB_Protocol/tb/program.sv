`include "test.sv";

program automatic test_program(apb_if vif);

  test t;

  initial begin

    $display("");
    $display("======================");
    $display(" PROGRAM STARTED ");
    $display("======================");
    $display("");

    t = new(vif.DRIVER, vif.MONITOR);

    t.run();

    #100;
    $finish;

  end

endprogram
