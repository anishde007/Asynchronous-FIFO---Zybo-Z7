
---

# Asynchronous FIFO Design and Implementation on ZYBO Z7-010 FPGA

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Platform: ZYBO Z7-010](https://img.shields.io/badge/Platform-ZYBO%20Z7--010-orange)
![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog-lightgrey)

## Overview

This project implements an **8-entry asynchronous FIFO** (First-In-First-Out) buffer using **SystemVerilog**, designed to handle clock domain crossing between two distinct clock frequencies for reading and writing. The design was simulated and tested using **Vivado**, then successfully deployed on the **ZYBO Z7-010 FPGA board**. 

The project leverages FPGA resources, such as **buttons**, **DIP switches**, and **tri-color LEDs**, to provide real-time feedback on FIFO status (full, empty) and visual representation of data flow, making it a practical solution for asynchronous data transfer applications.

## Features
- **8-entry asynchronous FIFO** with separate read and write clock domains.
- **Gray code pointer synchronization** to safely transfer data across different clock frequencies.
- **Fully verified in SystemVerilog** testbench simulation in Vivado, ensuring functionality under various operating conditions.
- **Interactive hardware control**: Buttons and DIP switches allow manual control of read and write operations.
- **Real-time FIFO status visualization** using the ZYBO board’s tri-color LEDs for full/empty flags and current data states.
- **Debouncing mechanism** to ensure accurate and glitch-free control input from the board’s buttons.

## Project Details

### Design Architecture

- **FIFO Length**: 8 entries
- **Asynchronous Clocking**: Read and write operations occur at different clock frequencies, making Gray code pointer synchronization crucial for safe cross-domain operation.
- **Full and Empty Condition Detection**: The FIFO’s full and empty states are detected and visualized on the board using tri-color LEDs.

### Hardware Integration

- **ZYBO Z7-010 FPGA Board**: The design is implemented and tested on the ZYBO Z7-010 board.
- **Controls**: Buttons and DIP switches provide real-time control over FIFO operations, including manual write and read commands.
- **LED Visualization**: Tri-color LEDs display the state of the FIFO, including full and empty flags, as well as the presence of data.

### Hardware Deployment (ZYBO Z7-010)
1. Synthesize the project in Vivado and generate the bitstream for the ZYBO Z7-010 FPGA board.
2. Program the FPGA using the generated bitstream.
3. Use the board’s buttons and DIP switches to manually control the FIFO:
   - **Write operation**: Use buttons to enter data.
   - **Read operation**: Use switches to initiate reading.
4. Observe the tri-color LEDs for real-time feedback on FIFO status:
   - **OFF LED**: Indicates data in FIFO.
   - **Red LED**: Indicates FIFO is empty.
   - **Green LED**: Indicates FIFO is empty.

## Files in the Repository
- `TstBench/`: Contains the SystemVerilog testbench for simulation.
- `Constraints/`: XDC file for configuring the ZYBO board’s IO pins.

## Future Enhancements
- Implement further **data visualization techniques** using the ZYBO board’s external display options.
- Expand the FIFO length and optimize the design for **resource efficiency** on larger FPGA boards.
- Develop automated scripts for running testbenches and synthesizing the design.

## License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---

### Screenshots

![FIFO_VIVADO_SIM](https://github.com/user-attachments/assets/0aad7d14-8205-456c-a83e-cf62616b1051)

---

### Notes:
This README gives an overview of the project, highlights key features, and provides instructions for both simulation and hardware implementation. It also includes details on usage, future improvements, and contribution guidelines to make the repository attractive and informative to visitors on GitHub.
