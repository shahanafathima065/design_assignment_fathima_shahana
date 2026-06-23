# Face Detection System Using FIFO and FSM

## 1. System Overview

This project implements a simplified Face Detection Data Processing System using Verilog HDL. The design consists of three modules: a Face Module, a FIFO buffer, and an Output Controller based on a Finite State Machine (FSM). The system receives input data, temporarily stores it in a FIFO, and generates the final output through controlled data transfer.

---

## 2. Working Principle

The Face Module receives input data and forwards it to the FIFO. The FIFO stores incoming data sequentially and provides temporary buffering between the input and output stages. The Output Controller uses an FSM to read data from the FIFO and generate the final output.

The FSM continuously cycles through three states:

* IDLE
* S1
* S2

The final output is updated only during the S2 state.

---

## 3. Design Features

* Verilog HDL implementation
* FIFO-based data buffering
* FSM-controlled output transfer
* Full and Empty FIFO status flags
* Synchronous clock operation
* Modular architecture for easy integration

---

## 4. Module Description

### Face Module

The Face Module receives the input data stream and forwards it to the FIFO.

* Input: s_in
* Output: face_out

### FIFO Module

The FIFO stores incoming data temporarily.

#### Write Operation

Data is written when:

* wrenb = 1

#### Read Operation

Data is read when:

* rdenb = 1

#### FIFO Status Flags

* full : FIFO is full
* empty : FIFO is empty

### Output Controller (FSM)

The Output Controller reads data from the FIFO using a three-state FSM.

#### States

* IDLE : Waiting state
* S1 : Intermediate delay state
* S2 : Reads FIFO data and updates output

---

## 5. Testbench Stimulus Profiles

The verification file applies a sequence of input values to validate FIFO storage and FSM-based output generation.

### Test Case

Input Data Sequence:

* 11
* 22
* 33
* 44
* 55
* 66
* 77

Expected Output Sequence:

* 11
* 22
* 33
* 44
* 55
* 66
* 77

Purpose:

* Verify FIFO write and read operations.
* Validate FSM state transitions.
* Confirm correct output update timing.
* Check proper operation of full and empty status flags.

---

## 6. Simulation Waveform

The behavioral simulation was performed using Vivado Simulator. The waveform below verifies the correct operation of the Face Detection System, FIFO buffer, and FSM-controlled output generation.

<img width="811" height="412" alt="image" src="https://github.com/user-attachments/assets/683ddc70-596c-4726-b9e9-b947e707caa8" />

The waveform confirms:

* Correct FIFO data storage
* Proper FIFO read operation
* Successful FSM state transitions
* Correct final output generation

---

## 7. Results

The simulation results confirm that:

* Input data is successfully stored in the FIFO.
* FIFO data is correctly transferred to the output controller.
* FSM transitions occur as expected.
* Final output values match the input sequence.
* All test cases pass successfully.

---

## 8. Conclusion

The Face Detection System Using FIFO and FSM was successfully implemented and verified using Verilog HDL. Simulation results demonstrate correct FIFO operation, proper FSM control, and accurate output generation. The design achieves reliable data transfer and meets all verification objectives.

---

## Tools Used

* Verilog HDL
* Xilinx Vivado 2023.2
* GitHub

---

## Author

**Fathima Shahana C K**

B.Tech Electronics and Communication Engineering

TKM College of Engineering
