# Sequence Detector 1110

## 1. System Overview

This project implements a Sequence Detector for the binary sequence **1110** using Verilog HDL. The design uses a Finite State Machine (FSM) to monitor a serial input stream and generate an output whenever the sequence 1110 is detected.

The detector continuously checks the input data and asserts the detection signal when the required sequence appears.

---

## 2. Working Principle

The Sequence Detector uses four states to track the progress of the input sequence.

State Transitions:

- Idle State → Waiting for first '1'
- State S1 → First '1' detected
- State S2 → Two consecutive '1's detected
- State S3 → Three consecutive '1's detected
- Detection occurs when a '0' follows the sequence '111'

When the sequence **1110** is received, the output signal `detected` becomes HIGH for one clock cycle.

---

## 3. Design Features

- Verilog HDL implementation
- Finite State Machine (FSM) based design
- Detects binary sequence 1110
- Clock-driven sequential circuit
- Reset functionality
- Real-time serial data monitoring
- Functional verification using Vivado
- Waveform validation

---

## 4. Testbench Stimulus Profiles

The verification file (`sequence_1110_tb.v`) applies a serial bit stream to validate the functionality of the Sequence Detector.

### Test Case 1

Input Sequence:

- 0

Expected Output:

- detected = 0

### Test Case 2

Input Sequence:

- 1110

Expected Output:

- detected = 1

Purpose:

- Verify successful detection of the target sequence.

---

## 5. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies the correct detection of the sequence **1110**.

<img width="817" height="396" alt="image" src="https://github.com/user-attachments/assets/3c0a1c2c-f328-4fb7-8154-758a8ed14c68" />


---

## 6. Results

The simulation results confirm that:

- The FSM correctly tracks input transitions.
- The sequence 1110 is detected successfully.
- The detection signal is asserted at the correct time.
- Reset functionality operates correctly.
- All test cases pass successfully.

---

## 7. Conclusion

A Sequence Detector for the binary sequence 1110 was successfully designed and verified using Verilog HDL. The simulation waveform validates the correct operation of the FSM and confirms accurate sequence detection.

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
