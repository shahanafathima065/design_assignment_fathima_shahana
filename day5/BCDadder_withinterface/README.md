# BCD Adder Verification Using SystemVerilog Interface

## 1. Verification Overview

This project focuses on the functional verification of a 4-Bit Binary Coded Decimal (BCD) Adder using SystemVerilog. The verification environment was developed using a SystemVerilog interface and directed test cases to validate the correctness of the design.

The objective is to ensure that the BCD Adder correctly performs decimal addition, generates carry outputs, and applies BCD correction logic whenever required.

---

## 2. Design Under Test (DUT)

The Design Under Test (DUT) is a 4-Bit BCD Adder implemented using Ripple Carry Adders and correction logic.

### Inputs

- A_BCD [3:0] : First BCD digit
- B_BCD [3:0] : Second BCD digit
- cin_BCD : Carry input

### Outputs

- S_BCD [3:0] : BCD Sum
- cout_BCD : Carry output

The DUT performs binary addition and automatically adds the correction value (0110) whenever the result exceeds the valid BCD range (0–9).

---

## 3. Verification Objectives

The verification environment was developed to validate:

- Correct BCD addition
- Carry generation
- BCD correction logic
- Boundary conditions
- Overflow scenarios
- Functional correctness of DUT outputs

---

## 4. Verification Methodology

A SystemVerilog Interface-based testbench was developed for verification.

The verification flow consists of:

1. Applying directed input stimulus.
2. Driving DUT inputs through the interface.
3. Capturing DUT outputs.
4. Comparing actual outputs with expected outputs.
5. Reporting PASS or FAIL status.
6. Maintaining pass and fail counters.

The simulation was executed using Xilinx Vivado Simulator.

---

## 5. SystemVerilog Interface

The interface groups all DUT signals into a single communication block.

### Interface Signals

#### Inputs

- A_BCD [3:0]
- B_BCD [3:0]
- cin_BCD

#### Outputs

- S_BCD [3:0]
- cout_BCD

The interface simplifies signal management and improves testbench readability.

---

## 6. Test Cases

The following directed test cases were applied.

### Test Case 1

Input:

- A = 3
- B = 4
- Cin = 0

Expected Output:

- Sum = 7
- Cout = 0

Status: PASS

---

### Test Case 2

Input:

- A = 5
- B = 6
- Cin = 0

Expected Output:

- Sum = 1
- Cout = 1

Status: PASS

---

### Test Case 3

Input:

- A = 8
- B = 7
- Cin = 1

Expected Output:

- Sum = 6
- Cout = 1

Status: PASS

---

### Test Case 4

Input:

- A = 9
- B = 9
- Cin = 1

Expected Output:

- Sum = 9
- Cout = 1

Status: PASS

---

## 7. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator.

The waveform verifies:

- Correct BCD addition
- Proper carry generation
- Successful correction logic operation
- Correct DUT response for all test cases

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5edd9cb7-e352-4d3e-8be5-ea085473cc27" />


---

## 8. Verification Results

| Test Case | Status |
|------------|---------|
| TC1 | PASS |
| TC2 | PASS |
| TC3 | PASS |
| TC4 | PASS |

### Summary

```text
BCD ADDER VERIFICATION COMPLETED

Total PASS = 4
Total FAIL = 0
```

All verification test cases passed successfully.

---

## 9. Observations

During simulation:

- The DUT correctly generated BCD sums.
- Carry outputs matched expected values.
- BCD correction logic operated correctly.
- Actual outputs matched expected outputs.
- No functional mismatches were observed.

---

## 10. Conclusion

The 4-Bit BCD Adder was successfully verified using a SystemVerilog Interface-based verification environment.

The DUT produced correct outputs for all test scenarios, including normal addition, carry generation, and BCD correction cases. The verification objectives were achieved successfully, and all test cases passed.

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
