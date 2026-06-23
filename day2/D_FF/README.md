# D Flip-Flop

## 1. System Overview

This project implements a D (Data) Flip-Flop using Verilog HDL. A D Flip-Flop is a sequential circuit that stores one bit of data and updates its output on the active edge of the clock signal.

The D Flip-Flop is one of the fundamental memory elements used in digital systems, registers, counters, and finite state machines.

---

## 2. Working Principle

The D Flip-Flop samples the input data (D) at the active clock edge and transfers it to the output (Q).

Operation:

- When the clock edge occurs, Q takes the value of D.
- Between clock edges, Q retains its previous value.
- The Flip-Flop acts as a 1-bit memory element.

Truth Table:

| Clock Edge | D | Q(next) |
|------------|---|----------|
| ↑ | 0 | 0 |
| ↑ | 1 | 1 |

---

## 3. Design Features

- Verilog HDL implementation
- Edge-triggered operation
- Single-bit data storage
- Sequential logic design
- Functional verification using Vivado
- Waveform validation

---

## 4. Testbench Stimulus Profiles

The verification file applies various input combinations to verify correct Flip-Flop operation.

### Test Case 1

- D = 0
- Clock Rising Edge

Expected Output:

- Q = 0

### Test Case 2

- D = 1
- Clock Rising Edge

Expected Output:

- Q = 1

### Test Case 3

- D changes between clock edges

Expected Output:

- Q retains previous value until next clock edge

---

## 5. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies correct data capture and storage operation of the D Flip-Flop.

<img width="1918" height="985" alt="d flipflop" src="https://github.com/user-attachments/assets/eae64800-610b-492e-89e4-8bfde64f0983" />


---

## 6. Results

The simulation results confirm that:

- Input data is captured correctly.
- Output changes only on the clock edge.
- Stored value is retained between clock transitions.
- All test cases pass successfully.

---

## 7. Conclusion

The D Flip-Flop was successfully designed and verified using Verilog HDL. The simulation waveform confirms correct sequential behavior and data storage functionality.

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
