# Universal Shift Register (4-Bit)

## 1. System Overview

This project implements a 4-Bit Universal Shift Register using Verilog HDL. It is a multi-mode sequential circuit capable of performing Serial-In Serial-Out (SISO), Serial-In Parallel-Out (SIPO), Parallel-In Serial-Out (PISO), and Parallel-In Parallel-Out (PIPO) operations.

The operation is controlled using a 2-bit mode selector, allowing the register to perform different data transfer functions within a single design.

---

## 2. Working Principle

The Universal Shift Register performs different operations based on the selected mode.

| Mode | Operation |
|--------|-----------|
| 00 | SISO |
| 01 | SIPO |
| 10 | PISO |
| 11 | PIPO |

In SISO mode, serial data is shifted through the register and observed at the serial output. In SIPO mode, serial data is stored and made available as parallel output. In PISO mode, parallel data is loaded and shifted out serially. In PIPO mode, parallel data is directly transferred to the output.

---

## 3. Design Features

- Verilog HDL implementation
- 4-bit register design
- Supports SISO operation
- Supports SIPO operation
- Supports PISO operation
- Supports PIPO operation
- Mode-based operation control
- Serial and parallel data handling
- Clock-driven sequential circuit
- Reset support
- Functional verification using Vivado
- Waveform validation

---

## 4. Testbench Stimulus Profiles

The verification file (Testbench.v) applies various test cases to validate the functionality of the Universal Shift Register.

**Test Case 1:** Mode = 00 (SISO) → Serial data shifted through the register and observed at the serial output.

**Test Case 2:** Mode = 01 (SIPO) → Serial data stored in the register and displayed as parallel output.

**Test Case 3:** Mode = 10 (PISO) → Parallel data loaded into the register and shifted out serially.

**Test Case 4:** Mode = 11 (PIPO) → Parallel data directly transferred to the output.

---

## 5. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies the correct operation of the Universal Shift Register and confirms proper shifting and loading functionality in all four modes.

<img width="1262" height="515" alt="image" src="https://github.com/user-attachments/assets/0fee6085-3733-4f4d-a063-fb5506362868" />


---

## 6. Results

The simulation results confirm that:

- SISO operation works correctly.
- SIPO operation converts serial data into parallel output.
- PISO operation shifts parallel data serially.
- PIPO operation performs direct parallel transfer.
- Reset functionality operates correctly.
- All test cases pass successfully.

---

## 7. Conclusion

A 4-Bit Universal Shift Register was successfully designed and verified using Verilog HDL. The waveform results validate the correctness of the implemented architecture and demonstrate successful operation in SISO, SIPO, PISO, and PIPO modes.

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
