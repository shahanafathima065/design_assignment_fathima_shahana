`include "env.sv"
class test;

  environment env;

  virtual apb_if.DRIVER  drv_vif;
  virtual apb_if.MONITOR mon_vif;

  function new(
    virtual apb_if.DRIVER  drv_vif,
    virtual apb_if.MONITOR mon_vif
  );

    this.drv_vif = drv_vif;
    this.mon_vif = mon_vif;

    env = new(drv_vif, mon_vif);

  endfunction

  virtual task run();

    env.gen.count = 10;

    env.run();

    #500;

    env.report();

  endtask

endclass


class write_test extends test;

  write_testcase tc;

  function new(
    virtual apb_if.DRIVER  drv_vif,
    virtual apb_if.MONITOR mon_vif
  );
    super.new(drv_vif, mon_vif);
  endfunction

  virtual task run();

    tc = new();

    env.gen.tr = tc;
    env.gen.count = 10;

    super.run();

  endtask

endclass


class read_test extends test;

  read_testcase tc;

  function new(
    virtual apb_if.DRIVER  drv_vif,
    virtual apb_if.MONITOR mon_vif
  );
    super.new(drv_vif, mon_vif);
  endfunction

  virtual task run();

    tc = new();

    env.gen.tr = tc;
    env.gen.count = 10;

    super.run();

  endtask

endclass
