`timescale 1ns/1ps

/*`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"  */
`include "program.sv"

module testbench;

  logic PCLK;

  initial begin
    PCLK = 0;
    forever #5 PCLK = ~PCLK;
  end

  apb_if vif(PCLK);

  initial begin
    vif.PRESETn = 0;
    #20;
    vif.PRESETn = 1;
  end

  apb_master dut(
    .PCLK    (PCLK),
    .PRESETn (vif.PRESETn),
    .start   (vif.start),
    .rw      (vif.rw),
    .addr    (vif.addr),
    .wdata   (vif.wdata),
    .PREADY  (vif.PREADY),
    .PRDATA  (vif.PRDATA),
    .PSEL    (vif.PSEL),
    .PENABLE (vif.PENABLE),
    .PWRITE  (vif.PWRITE),
    .PADDR   (vif.PADDR),
    .PWDATA  (vif.PWDATA),
    .rdata   (vif.rdata),
    .done    (vif.done)
  );

  test_program TEST(vif);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end

endmodule
