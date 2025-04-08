`include "imem.v"
`timescale 1ns/1ns // Time scale

module imem_tb(); 

    // Declare inputs and outputs for testbench
reg[31:0] address;
wire [31:0] read_data;   

    // Instantiate the data memory module
Imem imem(address, read_data);

initial begin

    $dumpfile("imem.vcd");   // File to store waveforms for analysis
    $dumpvars(0, imem_tb);   // Dump variables for waveform analysis
    // Initialize address
        address = 32'd0;
        
        //Read instruction at address 0
        #10 address = 32'd0;  // Fetch instruction at mem[0]
        #10;

        //Read instruction at address 4
        #10 address = 32'd4;  // Fetch instruction at mem[1]
        #10;

        //Read instruction at address 8
        #10 address = 32'd8;  // Fetch instruction at mem[2]
        #10;

        //Read instruction at address 8
        #10 address = 32'd12;  // Fetch instruction at mem[3]
        #10;

        //Read instruction at address 8
        #10 address = 32'd16;  // Fetch instruction at mem[4]
        #10;

        //Read instruction at address 8
        #10 address = 32'd20;  // Fetch instruction at mem[5]
        #10;

        //Read instruction at address 24 (loop instruction)
        #10 address = 32'd24; // Fetch instruction at mem[6]
        #10;

        //Read instruction at address 8
        #10 address = 32'd28;  // Fetch instruction at mem[7]
        #10;

        // Test case 3: Read instruction at address 8
        #10 address = 32'd32;  // Fetch instruction at mem[8]
        #10;

        //Read instruction at address 36 (jump to end)
        #10 address = 32'd36; // Fetch instruction at mem[9]
        #10;

        // End simulation
        #10;
        $finish;

    
end

endmodule
