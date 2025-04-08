`include "pc.v"
`timescale 1ns/1ns // Time scale

module pc_tb(); 

    // Declaring inputs and outputs for the testbench
    reg [31:0] addr;         
    reg clk;                
    reg reset;              
    wire [31:0] next_addr;   

    
    Pc pc (addr, clk, reset, next_addr);

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end

    
    initial begin
        $dumpfile("pc.vcd");   
        $dumpvars(0, pc_tb);   

        // Initialize signals
        clk = 0;             
        reset = 1;           // Start with reset
        addr = 32'd4;        // Start address at 4

        #10 reset = 0;       
    
        // Increment address
        #10 addr = 32'd8;    // Set address to 8
        #10 addr = 32'd12;    // Set address to 12
        #10 addr = 32'd16;   // Set address to 16

       
        #10 reset = 1;  //reset again
        #10 reset = 0;  

        //address after reset
        #10 addr = 32'd20;   // Set address to 20

        // Finish simulation
        #10 $finish;
    end

endmodule