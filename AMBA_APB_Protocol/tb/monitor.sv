class monitor;

  apb_transaction tr;
  mailbox #(apb_transaction) mon2scb;

  virtual apb_if.MONITOR vif;

  function new(
    mailbox #(apb_transaction) mon2scb,
    virtual apb_if.MONITOR vif
  );
    this.mon2scb = mon2scb;
    this.vif     = vif;
  endfunction

  task run();

    forever begin

      @(vif.mon_cb);

      if(vif.mon_cb.PSEL && vif.mon_cb.PENABLE && vif.mon_cb.PREADY) begin

        tr = new();

        tr.rw      = vif.mon_cb.rw;
        tr.addr    = vif.mon_cb.addr;
        tr.data    = vif.mon_cb.wdata;

        tr.PSEL    = vif.mon_cb.PSEL;
        tr.PENABLE = vif.mon_cb.PENABLE;
        tr.PWRITE  = vif.mon_cb.PWRITE;
        tr.PADDR   = vif.mon_cb.PADDR;
        tr.PWDATA  = vif.mon_cb.PWDATA;
        tr.PREADY  = vif.mon_cb.PREADY;
        tr.PRDATA  = vif.mon_cb.PRDATA;
        tr.rdata   = vif.mon_cb.rdata;
        tr.done    = vif.mon_cb.done;

        $display("[MON] RW=%0d ADDR=%h DATA=%h PSEL=%0d PENABLE=%0d PWRITE=%0d PREADY=%0d DONE=%0d",
                 tr.rw, tr.addr, tr.data,
                 tr.PSEL, tr.PENABLE, tr.PWRITE,
                 tr.PREADY, tr.done);

        mon2scb.put(tr);

      end

    end

  endtask

endclass
