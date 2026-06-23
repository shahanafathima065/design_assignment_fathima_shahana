`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
//`include "env.sv"
//`include "test.sv"

class environment;

  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;

  mailbox #(apb_transaction) gen2drv;
  mailbox #(apb_transaction) mon2scb;

  virtual apb_if.DRIVER  drv_vif;
  virtual apb_if.MONITOR mon_vif;

  function new(
    virtual apb_if.DRIVER  drv_vif,
    virtual apb_if.MONITOR mon_vif
  );

    this.drv_vif = drv_vif;
    this.mon_vif = mon_vif;

    gen2drv = new();
    mon2scb = new();

    gen = new(gen2drv);
    drv = new(gen2drv, drv_vif);
    mon = new(mon2scb, mon_vif);
    scb = new(mon2scb);

  endfunction

  task run();

    $display("[ENV] Environment Started");

    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_none

  endtask

  task report();

    scb.report();

  endtask

endclass
