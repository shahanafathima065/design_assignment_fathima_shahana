# SR Flip-Flop

## 1. System Overview

This project implements an SR Flip-Flop using Verilog HDL. An SR Flip-Flop is a sequential circuit used to store one bit of data. It has two main inputs, Set (S) and Reset (R), and produces output Q and its complement.

The SR Flip-Flop is commonly used in memory elements, control circuits, and basic sequential logic designs.

---

## 2. Working Principle

The SR Flip-Flop works based on the Set and Reset inputs.

- When S = 1 and R = 0, the output Q is set to 1.
- When S = 0 and R = 1, the output Q is reset to 0.
- When S = 0 and R = 0, the output holds its previous state.
- When S = 1 and R = 1, the condition is invalid.

Truth Table:

| S | R | Q(next) | Operation |
|---|---|----------|------------|
| 0 | 0 | Q(previous) | Hold |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | Invalid | Not Allowed |

---

## 3. Design Features

- Verilog HDL implementation
- Sequential logic design
- Set and Reset functionality
- Memory storage behavior
- Functional verification using Vivado
- Waveform validation

---

## 4. Testbench Stimulus Profiles

The verification file applies different input combinations to validate the functionality of the SR Flip-Flop.

### Test Case 1

Input:

- S = 0
- R = 0

Expected Output:

- Q holds previous value

---

### Test Case 2

Input:

- S = 1
- R = 0

Expected Output:

- Q = 1

---

### Test Case 3

Input:

- S = 0
- R = 1

Expected Output:

- Q = 0

---

### Test Case 4

Input:

- S = 1
- R = 1

Expected Output:

- Invalid condition

---

## 5. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies the Set, Reset, Hold, and Invalid conditions of the SR Flip-Flop.

<img width="1918" height="992" alt="sr flipflop" src="https://github.com/user-attachments/assets/0c51fc46-1cc3-4ff7-9894-c56dc0ed788d" />


---

## 6. Results

The simulation results confirm that:

- The SR Flip-Flop performs set operation correctly.
- The reset operation works correctly.
- The hold condition retains the previous output.
- The invalid input condition is observed during verification.
- All valid test cases pass successfully.

---

## 7. Conclusion

The SR Flip-Flop was successfully designed and verified using Verilog HDL. The waveform results validate the correct operation of set, reset, and hold conditions.

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
