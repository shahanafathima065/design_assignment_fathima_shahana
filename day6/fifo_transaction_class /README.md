# FIFO Transaction Class

## 1. Verification Overview

This project implements a SystemVerilog transaction class for FIFO verification. The transaction class is used to generate randomized FIFO input stimulus and store FIFO response information.

The main objective is to create reusable transaction-level data for verifying FIFO reset, write, read, full, and empty conditions.

---

## 2. Purpose of Transaction Class

A transaction class represents one FIFO operation. Instead of manually applying input values every time, the transaction class helps generate randomized values for FIFO verification.

This is the first step in building a complete SystemVerilog verification environment.

---

## 3. Transaction Class Signals

### Randomized Signals

| Signal | Description |
|--------|-------------|
| rst_tb | Reset signal |
| wrenb_tb | Write enable signal |
| rdenb_tb | Read enable signal |
| data_in_tb[7:0] | FIFO input data |

### Response Signals

| Signal | Description |
|--------|-------------|
| data_out_tb[7:0] | FIFO output data |
| full | FIFO full flag |
| empty | FIFO empty flag |

---

## 4. Constraints Used

The transaction class uses constraints to control random stimulus generation.

### Reset Constraint

```systemverilog
rst_tb dist {0 := 8, 1 := 2};
```

This means reset is inactive most of the time and active occasionally.

### Write Enable Constraint

```systemverilog
wrenb_tb dist {0 := 2, 1 := 8};
```

This gives higher probability to write operation.

### Read Enable Constraint

```systemverilog
rdenb_tb dist {0 := 8, 1 := 2};
```

This gives lower probability to read operation.

### Data Constraint

```systemverilog
data_in_tb dist {
    8'hFF := 10,
    8'hAA := 5,
    8'h55 := 5
};
```

This gives higher probability to selected data patterns such as `FF`, `AA`, and `55`.

---

## 5. Display Method

The transaction class includes a display method to print randomized values during simulation.

```systemverilog
function void display();
  $display("rst_tb=%0d wrenb_tb=%0b rdenb_tb=%0b din=%0h dout=%0h full=%0b empty=%0b",
            rst_tb, wrenb_tb, rdenb_tb, data_in_tb, data_out_tb, full, empty);
endfunction
```

This helps in debugging and observing generated transaction values.

---

## 6. Verification Methodology

The transaction class is verified by creating an object and calling the `randomize()` method.

Verification flow:

1. Create an object of the transaction class.
2. Randomize the transaction object.
3. Display generated values.
4. Check whether values follow the defined constraints.

Example:

```systemverilog
trans_f tr;

initial begin
    tr = new();

    repeat(10) begin
        if(tr.randomize())
            tr.display();
        else
            $display("Randomization Failed");
    end
end
```

---

## 7. Expected Output

The simulation generates randomized FIFO transactions based on the given constraints.

Example output:

```text
rst_tb=0 wrenb_tb=1 rdenb_tb=0 din=ff dout=0 full=0 empty=0
rst_tb=0 wrenb_tb=1 rdenb_tb=0 din=aa dout=0 full=0 empty=0
rst_tb=1 wrenb_tb=0 rdenb_tb=0 din=55 dout=0 full=0 empty=0
```

The output values may change on every simulation run because randomization is used.

---

## 8. Results

The transaction class successfully generated randomized FIFO input stimulus. The display method printed the generated values clearly in the simulation console.

The generated transactions can be used in later stages of verification such as generator, driver, monitor, and scoreboard.

---

## 9. Conclusion

A FIFO transaction class was successfully created using SystemVerilog. The class supports constrained-random generation of reset, write enable, read enable, and input data signals.

This transaction class forms the foundation for developing a complete FIFO verification environment.

---

## Tools Used

- SystemVerilog
- Xilinx Vivado 2023.2
- GitHub

---

## Author

**Fathima Shahana C K**

B.Tech Electronics and Communication Engineering

TKM College of Engineering
