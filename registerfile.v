module Registerfile(

    input wire clk,                // Clock signal
    input wire [4:0] rs_address,   // Address of the source register rs
    input wire [4:0] rt_address,   // Address of the source register rt
    input wire [4:0] rd_address,   // Address of the destination register rd
    input wire [31:0] rd_value,    // Value to be written to the destination register
    input wire reg_write,          // Control signal for register write

    output wire [31:0] rs_value,   // Output value from the source register rs
    output wire [31:0] rt_value    // Output value from the source register rt

);

    reg [31:0] mem [0:31];

    // Initialize register 0 to 0 
    initial begin
        mem[0] <= 0;
    end

    // Write to the destination register on the rising edge of the clock
    // Only if reg_write is enabled and rd_address is not zero (to avoid writing to register 0)
    always @(posedge clk) begin
        if (reg_write && rd_address != 0) begin
            mem[rd_address] <= rd_value;
        end
    end

    // Read values from the source registers 
    assign rs_value = mem[rs_address]; 
    assign rt_value = mem[rt_address];

endmodule
