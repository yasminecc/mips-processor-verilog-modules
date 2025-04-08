# Verilog MIPS Component Suite – ALU, PC, Register File, Instruction & Data Memory

This project contains Verilog implementations and testbenches for fundamental components of a MIPS-style processor. The modules were simulated using ModelSim and tested with individual verification scripts.

---

## Components

| Module             | Description                                              |
|--------------------|----------------------------------------------------------|
| `alu.v`            | Arithmetic Logic Unit supporting add, sub, and, or       |
| `datamem.v`        | Data memory module with read/write operations            |
| `imem.v`           | Instruction memory initialized from file                 |
| `pc.v`             | Program counter with synchronous update and reset        |
| `registerfile.v`   | Register file with read/write ports and clocking         |

---

## Testbenches

Each component includes a dedicated testbench:

- `alu_tb.v`  
- `datamem_tb.v`  
- `imem_tb.v`  
- `pc_tb.v`  
- `registerfile_tb.v`

---

## How to Simulate

1. Open ModelSim or another Verilog simulator.
2. Compile a module and its testbench. Example:
   ```sh
   vlog alu.v alu_tb.v
   vsim work.alu_tb
   run -all
   ```
3. View the waveform or console output to verify functionality.

---

## Directory Structure

```
verilog-mips-component-suite/
├── alu.v / alu_tb.v
├── datamem.v / datamem_tb.v
├── imem.v / imem_tb.v
├── pc.v / pc_tb.v
├── registerfile.v / registerfile_tb.v
└── README.md
```

---

## Author

**Yasmine Elsisi**  
Computer Engineering @ NYU Abu Dhabi  
[GitHub](https://github.com/YasmineElsisi)
