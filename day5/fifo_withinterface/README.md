# FIFO Verification Using SystemVerilog Interface

## 1. Verification Overview

This project focuses on the functional verification of an 8-bit FIFO design using SystemVerilog. The verification environment was developed using a SystemVerilog interface and directed test cases to validate FIFO write and read operations.

The objective is to ensure that the FIFO correctly stores input data and reads the data back in First-In First-Out order.

---

## 2. Design Under Test (DUT)

The Design Under Test (DUT) is an 8-location FIFO memory.

### Inputs

- clk : Clock signal
- rst : Reset signal
- wrenb : Write enable
- rdenb : Read enable
- data_in [7:0] : Input data

### Outputs

- data_out [7:0] : Output data
- full : FIFO full flag
- empty : FIFO empty flag

---

## 3. Verification Objectives

The verification environment was developed to validate:

- FIFO reset operation
- Write operation
- Read operation
- FIFO data ordering
- Full and empty flag behavior
- Functional correctness of output data

---

## 4. Verification Methodology

A SystemVerilog interface-based testbench was developed for verification.

The verification flow consists of:

1. Applying reset to initialize the FIFO.
2. Writing data into the FIFO.
3. Reading data from the FIFO.
4. Comparing actual output data with expected data.
5. Displaying PASS or FAIL result.
6. Maintaining pass and fail counters.

The simulation was executed using Xilinx Vivado Simulator.

---

## 5. SystemVerilog Interface

The interface groups all FIFO signals into a single communication block.

### Interface Signals

- clk
- rst
- wrenb
- rdenb
- data_in [7:0]
- data_out [7:0]
- full
- empty

The interface improves testbench readability and makes signal management easier.

---

## 6. Test Cases

The following directed test cases were applied.

### Write Operations

| Write Order | Data Written |
|------------|--------------|
| 1 | 11 |
| 2 | 22 |
| 3 | 33 |
| 4 | 44 |

### Read and Check Operations

| Test Case | Expected Data | Actual Data | Status |
|----------|---------------|-------------|--------|
| TC1 | 11 | 11 | PASS |
| TC2 | 22 | 22 | PASS |
| TC3 | 33 | 33 | PASS |
| TC4 | 44 | 44 | PASS |

---

## 7. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator.

The waveform verifies:

- Correct FIFO write operation
- Correct FIFO read operation
- First-In First-Out data ordering
- Correct expected data comparison
- Successful pass/fail checking

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6819e879-bc11-40a6-a946-01a84d2f775f" />

---

## 8. Verification Results

### Summary

```text
FIFO VERIFICATION COMPLETED

Total PASS = 4
Total FAIL = 0
```

All verification test cases passed successfully.

---

## 9. Observations

During simulation:

- Data values were written into the FIFO successfully.
- Data was read back in the same order in which it was written.
- Actual output data matched expected output data.
- The pass counter reached 4.
- The fail counter remained 0.
- No functional mismatches were observed.

---

## 10. Conclusion

The FIFO design was successfully verified using a SystemVerilog interface-based testbench. The DUT correctly performed write and read operations and preserved First-In First-Out ordering. All directed test cases passed, confirming the functional correctness of the FIFO design.

---

## Tools Used

- Verilog HDL
- SystemVerilog
- Xilinx Vivado 2023.2
- GitHub

---

## Author

**Fathima Shahana C K**

B.Tech Electronics and Communication Engineering

TKM College of Engineering
