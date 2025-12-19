# Parity Detector (Verilog)

## Introduction

A **Parity Detector** is a digital circuit used to determine the parity of a serial data stream. Parity indicates whether the number of logic `1`s in the data stream is **even or odd**.

In this project, a **parity detector** is implemented using **Verilog HDL**. The design processes serial input data synchronously with the clock using a **two-state Finite State Machine (FSM)** and maintains a counter that tracks parity changes during operation.

---

## Parity Detection Concept and Timing

The parity detector operates on a **clocked serial input stream**. At every rising edge of the clock:

- The input data bit is sampled
- The FSM transitions between states based on the input
- The output counter is updated when a parity transition occurs

The design detects parity changes by observing transitions between FSM states.

---

## Parity Detection Sequence Flow

The FSM consists of two states:

- **State A**: Represents one parity condition  
- **State B**: Represents the opposite parity condition  

### State Transition Behavior

- From **State A**:
  - Input `1` → Transition to State B  
  - Input `0` → Remain in State A  

- From **State B**:
  - Input `1` → Transition to State A  
  - Input `0` → Remain in State B  

Each logic `1` in the input stream causes a **state transition**, effectively toggling the parity state.

---

## Design Overview

The parity detector is implemented using the following components:

- **Two-State Finite State Machine**
- **Combinational Next-State Logic**
- **Sequential State Register**
- **Parity Transition Counter**

The FSM tracks parity, while the counter records the number of parity transitions.

---

## Parity Detector Module

### Interface Signals

- **clk**  
  System clock input

- **data**  
  Serial input data bit

- **state**  
  Current parity state of the FSM

- **newstate**  
  Next parity state determined by input data

- **out [5:0]**  
  Counter that increments on each parity state transition

---

## FSM Operation

- The next state (`newstate`) is generated using combinational logic based on the current state and input data.
- On every rising edge of the clock:
  - The current state is updated
  - If `state` and `newstate` are different, the output counter increments

This mechanism ensures that every parity toggle caused by input `1` is counted.

---

## Counter Operation

- The counter increments whenever `state ^ newstate` is true
- This corresponds to a parity change in the input data stream
- The counter width is 6 bits, allowing multiple parity transitions to be tracked

---

## Testbench Overview

A Verilog testbench is used to verify the parity detector functionality.

### Testbench Features

- Generates a periodic clock signal
- Applies a predefined serial input data sequence
- Monitors FSM states and the parity counter
- Verifies correct parity state transitions and counting behavior

The testbench confirms correct operation over multiple input patterns.

---

## Overall System Operation

1. The FSM starts in the initial parity state.
2. Serial input bits are applied on each clock cycle.
3. FSM transitions occur when input `1` is detected.
4. The parity counter increments on each state transition.
5. The system continues processing until simulation ends.

This confirms correct parity detection and tracking.

---

## Summary

This project demonstrates a **parity detector implemented using a two-state FSM** in Verilog. The design accurately tracks parity changes in a serial data stream and counts each transition.

The simple FSM structure and synchronous operation make this design easy to understand, simulate, and integrate into larger digital systems.

<img width="1548" height="782" alt="Screenshot 2025-12-17 172901" src="https://github.com/user-attachments/assets/2038d8ad-87ec-42f8-8e05-1682f83fb2f8" />
