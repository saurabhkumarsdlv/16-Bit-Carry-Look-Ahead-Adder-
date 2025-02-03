# 16-bit Carry Look-Ahead Adder

## Overview
This project implements a **16-bit Carry Look-Ahead Adder (CLA)** in Verilog. Unlike a traditional ripple-carry adder, the CLA reduces propagation delay by computing carry signals in advance, making it much faster for large bit-width additions.

## Project Structure
- **CLA.v** - The main module that implements the 16-bit CLA using four 4-bit CLA modules.
- **CLA_4bit.v** - A 4-bit CLA module used as a building block for the 16-bit adder.
- **CLA_tb.v** - The testbench file to verify the functionality of the CLA.

## How It Works
The CLA consists of:
- **4-bit CLA Modules:** These compute partial sums and generate carry signals efficiently.
- **Carry Propagation Logic:** Determines carry outputs ahead of time instead of waiting for ripple effects.
- **Sum Computation:** Uses XOR logic to determine final sum bits.

## Running the Simulation
To test the implementation in **Vivado** or any Verilog simulator:
1. Load the project files into your preferred simulator.
2. Compile the **CLA.v**, **CLA_4bit.v**, and **CLA_tb.v** files.
3. Run the testbench to observe outputs for different test cases.

## Test Cases
The testbench provides a set of predefined input cases, such as:
- Adding **3 + 2**
- Adding **7 + 5** with carry-in
- Adding **15 + 10**
- Adding **20 + 25** with carry-in
- Checking behavior with **100 + 200**, **255 + 255**, etc.

## Why Use a Carry Look-Ahead Adder?
- **Speed:** Faster than ripple-carry adders.
- **Scalability:** Easily extended to larger bit-widths.
- **Efficiency:** Optimized for high-speed arithmetic operations.

## Future Improvements
- Implement a **32-bit CLA** for larger operations.
- Explore **FPGA implementation** for real-world applications.
- Optimize power consumption for embedded systems.

### Contributors
This project was developed as part of an exploration into efficient digital arithmetic design. Feel free to contribute and improve upon it!

---
Hope this helps! If you have any questions, drop an issue on GitHub. 🚀
