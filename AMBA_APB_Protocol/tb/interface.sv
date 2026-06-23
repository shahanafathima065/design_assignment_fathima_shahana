interface apb_if(input logic PCLK);

  logic PRESETn;

  logic        start;
  logic        rw;
  logic [7:0]  addr;
  logic [31:0] wdata;

  logic        PREADY;
  logic [31:0] PRDATA;

  logic        PSEL;
  logic        PENABLE;
  logic        PWRITE;
  logic [7:0]  PADDR;
  logic [31:0] PWDATA;

  logic [31:0] rdata;
  logic        done;

  clocking drv_cb @(posedge PCLK);
    output start;
    output rw;
    output addr;
    output wdata;
    output PREADY;
    output PRDATA;

    input done;
    input rdata;
  endclocking

  clocking mon_cb @(posedge PCLK);
    input start;
    input rw;
    input addr;
    input wdata;
    input PREADY;
    input PRDATA;

    input PSEL;
    input PENABLE;
    input PWRITE;
    input PADDR;
    input PWDATA;

    input rdata;
    input done;
  endclocking

  modport DRIVER (
    clocking drv_cb,
    input PRESETn
  );

  modport MONITOR (
    clocking mon_cb,
    input PRESETn
  );

endinterface
