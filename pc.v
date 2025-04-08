module Pc (
    input wire [31:0] addr,         // 32-bit address input (current address)
    input wire clk,                 // Clock signal
    input wire reset,               // Reset signal to set PC to 0
    output reg [31:0] next_addr     // 32-bit next address output (incremented address)
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            next_addr <= 0;     // Reset the PC to 0
        end else begin
            next_addr <= addr;  
        end
    end

endmodule