`include "datamem.v"
`timescale 1ns/1ns // Time scale

module datamem_tb(); 

    // Declaring inputs and outputs for testbench
    reg clk;
    reg [31:0] address;      
    reg [31:0] write_data;   
    reg MemRead;             
    reg MemWrite;            
    wire [31:0] read_data;   

    
    Datamem datamem(clk, address, write_data, MemRead, MemWrite, read_data);

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units (100 MHz clock period)
    end


    initial begin
        $dumpfile("datamem.vcd");  
        $dumpvars(0, datamem_tb);  

        // Initialize inputs
        clk = 0;
        address = 32'h00000000;
        write_data = 32'hDEADBEEF;
        MemRead = 0;
        MemWrite = 0;
        
        #10;
        // Write to memory
        address = 32'h00000004;   // Write to address 0x00000004
        write_data = 32'hDAFEEDBE; 
        MemWrite = 1;
        MemRead = 0;
        #10;
        MemWrite = 0;             // Turn off MemWrite after writing

        // Read from memory
        #10;
        address = 32'h00000004;   // Read from address 0x00000004
        MemWrite = 0;
        MemRead = 1;
        #10;
        MemRead = 0;              // Turn off MemRead after reading

        // Another write operation
        #10;
        address = 32'h00000008;   // Write to address 0x00000008
        write_data = 32'h12345678;
        MemWrite = 1;
        MemRead = 0;
        #10;
        MemWrite = 0;

        // Read back from the newly written address
        #10;
        address = 32'h00000008;   // Read from address 0x00000008
        MemWrite = 0;
        MemRead = 1;
        #10;
        MemRead = 0;

        // End simulation
        #10;
        $finish;
    end

endmodule
