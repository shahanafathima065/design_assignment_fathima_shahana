class apb_transaction;

  // Generated transaction fields
  rand bit        rw;
  rand bit [7:0]  addr;
  rand bit [31:0] data;

  // Observed APB output/control signals
  bit        PSEL;
  bit        PENABLE;
  bit        PWRITE;
  bit [7:0]  PADDR;
  bit [31:0] PWDATA;
  bit        PREADY;
  bit [31:0] PRDATA;
  bit [31:0] rdata;
  bit        done;

  constraint addr_c {
    addr inside {8'h00, 8'h04, 8'h08, 8'h0C};
  }

  constraint rw_c {
    rw dist {0 := 50, 1 := 50};
  }

  function void display();
    $display("[TRANS] RW=%0d ADDR=%h DATA=%h", rw, addr, data);
  endfunction

endclass


class write_testcase extends apb_transaction;

  constraint write_c {
    rw == 1;
  }

endclass


class read_testcase extends apb_transaction;

  constraint read_c {
    rw == 0;
  }

endclass
