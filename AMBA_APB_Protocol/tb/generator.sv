class generator;

  apb_transaction tr;
  mailbox #(apb_transaction) gen2drv;

  int count = 10;

  function new(mailbox #(apb_transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task run();

    repeat(count) begin

      if(tr == null)
        tr = new();

      assert(tr.randomize());

      tr.display();

      gen2drv.put(tr);

      tr = null;

    end

  endtask

endclass
