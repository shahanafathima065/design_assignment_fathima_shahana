# 4x2 Encoder

## 1. System Overview

This project implements a 4x2 Encoder using Verilog HDL. An encoder is a combinational circuit that converts multiple input lines into a smaller number of output lines.

A 4x2 Encoder accepts four input lines and generates a 2-bit binary code corresponding to the active input.

---

## 2. Working Principle

The encoder converts one active input among four possible inputs into a 2-bit binary output.

Truth Table:

| Input | Output |
|--------|--------|
| 0001 | 00 |
| 0010 | 01 |
| 0100 | 10 |
| 1000 | 11 |

Only one input should be active at a time for proper operation.

---

## 3. Design Features

- Verilog HDL implementation
- Combinational logic design
- 4 input lines
- 2 output lines
- Binary encoding functionality
- Functional verification using Vivado
- Waveform validation

---

## 4. Testbench Stimulus Profiles

The verification file applies various input combinations to validate the encoder functionality.

### Test Case 1

Input:

- I = 0001

Expected Output:

- Y = 00

---

### Test Case 2

Input:

- I = 0010

Expected Output:

- Y = 01

---

### Test Case 3

Input:

- I = 0100

Expected Output:

- Y = 10

---

### Test Case 4

Input:

- I = 1000

Expected Output:

- Y = 11

---

## 5. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies the correct encoding operation of the 4x2 Encoder.

<img width="1917" height="1003" alt="encoder" src="https://github.com/user-attachments/assets/b21c7b24-5805-4d83-aa76-b26a6b71353f" />


---

## 6. Results

The simulation results confirm that:

- Each active input is correctly encoded.
- Binary output matches the corresponding input.
- Combinational logic operates correctly.
- All test cases pass successfully.

---

## 7. Conclusion

The 4x2 Encoder was successfully designed and verified using Verilog HDL. The simulation waveform validates the correct binary encoding functionality for all input combinations.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2023.2
- GitHub

---

## Author

**Fathima Shahana C K**

B.Tech Electronics and Communication Engineering

TKM College of Engineering
