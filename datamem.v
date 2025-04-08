module Datamem (
    input wire clk,
    input wire [31:0] address,    // 32-bit memory address input from ALU result
    input wire [31:0] write_data, // 32-bit data to be written to memory
    input wire MemRead,           // Control signal: read enable
    input wire MemWrite,          // Control signal: write enable
    output reg [31:0] read_data  // 32-bit data read from memory
);

    // Memory array: 256 words, each 32 bits wide
    reg [31:0] mem [0:255];

    always @(posedge clk) begin
        if (MemWrite) begin
            mem[address[31:2]] <= write_data; // Write data
        end 
        if (MemRead) begin
            read_data <= mem[address[31:2]];  // Read data
        end 
    end


endmodule
