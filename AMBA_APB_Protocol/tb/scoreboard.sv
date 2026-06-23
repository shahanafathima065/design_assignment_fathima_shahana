class scoreboard;

  apb_transaction tr;
  mailbox #(apb_transaction) mon2scb;

  int pass_count = 0;
  int fail_count = 0;

  function new(mailbox #(apb_transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task check(apb_transaction tr);

    $display("--------------------------------");
    $display(" SCOREBOARD CHECK");
    $display("--------------------------------");

    // Check APB ACCESS phase
    if(tr.PSEL == 1 && tr.PENABLE == 1 && tr.PREADY == 1) begin
      pass_count++;
      $display("[PASS] APB ACCESS PHASE CORRECT");
    end
    else begin
      fail_count++;
      $display("[FAIL] APB ACCESS PHASE WRONG");
      $display("Expected: PSEL=1 PENABLE=1 PREADY=1");
      $display("Actual  : PSEL=%0b PENABLE=%0b PREADY=%0b",
                tr.PSEL, tr.PENABLE, tr.PREADY);
    end

    // Check write/read control
    if(tr.PWRITE == tr.rw) begin
      pass_count++;
      $display("[PASS] PWRITE MATCHED");
    end
    else begin
      fail_count++;
      $display("[FAIL] PWRITE MISMATCH");
      $display("Expected PWRITE=%0b, Actual PWRITE=%0b", tr.rw, tr.PWRITE);
    end

    // Check address
    if(tr.PADDR == tr.addr) begin
      pass_count++;
      $display("[PASS] ADDRESS MATCHED");
    end
    else begin
      fail_count++;
      $display("[FAIL] ADDRESS MISMATCH");
      $display("Expected Address=%0h, Actual Address=%0h", tr.addr, tr.PADDR);
    end

    // Check write data
    if(tr.rw == 1) begin
      if(tr.PWDATA == tr.data) begin
        pass_count++;
        $display("[PASS] WRITE DATA MATCHED");
      end
      else begin
        fail_count++;
        $display("[FAIL] WRITE DATA MISMATCH");
        $display("Expected Data=%0h, Actual PWDATA=%0h", tr.data, tr.PWDATA);
      end
    end

    // Check read data
    if(tr.rw == 0) begin
      if(tr.rdata == tr.PRDATA) begin
        pass_count++;
        $display("[PASS] READ DATA MATCHED");
      end
      else begin
        fail_count++;
        $display("[FAIL] READ DATA MISMATCH");
        $display("Expected PRDATA=%0h, Actual rdata=%0h", tr.PRDATA, tr.rdata);
      end
    end

  endtask

  task run();

    forever begin
      mon2scb.get(tr);
      check(tr);
    end

  endtask

  task report();

    $display("--------------------------------");
    $display(" SCOREBOARD REPORT");
    $display("--------------------------------");
    $display("PASS COUNT = %0d", pass_count);
    $display("FAIL COUNT = %0d", fail_count);
    $display("--------------------------------");

  endtask

endclass
