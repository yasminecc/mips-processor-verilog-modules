`include "registerfile.v"
`timescale 1ns/1ns //time scale

module registerfile_tb(); 


reg clk;
reg [4:0] rs_address;
reg [4:0] rt_address;
reg [4:0] rd_address;
reg [31:0] rd_value;
reg reg_write;
wire [31:0] rs_value;
wire [31:0] rt_value;


Registerfile registerfile(clk, rs_address, rt_address, rd_address, rd_value, reg_write, rs_value, rt_value); 


// Clock generation
always begin
    #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
end

initial begin
    $dumpfile("registerfile.vcd"); 
    $dumpvars(0, registerfile_tb);

    // Initialize signals
    clk = 0;
    reg_write = 0;
    rs_address = 0;   // Initialize register addresses
    rt_address = 0;
    rd_address = 0;
    rd_value = 0;    // Initialize write value

    // Write to register and read
    #10 rd_address = 5'd2;   // Write to register 2
    rd_value = 32'd10;       // Value to write
    reg_write = 1;           // Enable write
    #10 reg_write = 0;       // Disable write after one clock cycle
    
    //Read from registers
    #10 rs_address = 5'd2;   // Read from register 2
    rt_address = 5'd3;       // Read from register 3 (initially undefined)
    
    // Write another value to a different register
    #10 rd_address = 5'd3;   // Write to register 3
    rd_value = 32'd20;       // Value to write
    reg_write = 1;           // Enable write
    #10 reg_write = 0;       // Disable write after one clock cycle

    //Verify the values read from registers
    #10 rs_address = 5'd3;   // Read from register 3
    rt_address = 5'd2;       // Read from register 2
    
    // Finish simulation
    #10 $finish;
end
endmodule
