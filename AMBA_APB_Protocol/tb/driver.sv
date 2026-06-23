class driver;

  apb_transaction tr;
  mailbox #(apb_transaction) gen2drv;

  virtual apb_if.DRIVER vif;

  function new(
    mailbox #(apb_transaction) gen2drv,
    virtual apb_if.DRIVER vif
  );
    this.gen2drv = gen2drv;
    this.vif     = vif;
  endfunction

  task reset();

    vif.drv_cb.start  <= 0;
    vif.drv_cb.rw     <= 0;
    vif.drv_cb.addr   <= 0;
    vif.drv_cb.wdata  <= 0;
    vif.drv_cb.PREADY <= 1;
    vif.drv_cb.PRDATA <= 32'h12345678;

  endtask

  task drive();

    gen2drv.get(tr);

    @(vif.drv_cb);

    vif.drv_cb.addr   <= tr.addr;
    vif.drv_cb.wdata  <= tr.data;
    vif.drv_cb.rw     <= tr.rw;
    vif.drv_cb.PREADY <= 1;

    if(tr.rw == 0)
      vif.drv_cb.PRDATA <= 32'hA5A50000 + tr.addr;
    else
      vif.drv_cb.PRDATA <= 32'h12345678;

    vif.drv_cb.start <= 1;

    @(vif.drv_cb);
    vif.drv_cb.start <= 0;

    do begin
      @(vif.drv_cb);
    end while(vif.drv_cb.done != 1);

    $display("[DRV] RW=%0d ADDR=%h DATA=%h", tr.rw, tr.addr, tr.data);

  endtask

  task run();

    reset();

    wait(vif.PRESETn == 1);

    @(vif.drv_cb);
    @(vif.drv_cb);

    forever begin
      drive();
    end

  endtask

endclass
