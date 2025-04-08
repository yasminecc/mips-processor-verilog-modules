module Alu(op, a, b, c, zero);

input wire [3:0] op;
input wire [31:0] a;
input wire [31:0] b;

output reg [31:0] c; //result
output wire zero;

always @* begin
    case (op)
        0 : c <= a + b; //addition
        1 : c <= a - b; //subtraction
        2 : c <= a * b; //multiplication
        3 : c <= a / b; //division
        4 : c <= a & b; //and
        5 : c <= a | b; //or
        6 : c <= a ^ b; //xor
        default: c <= 0; //of no opcode is given assign 0 to c
    endcase
end

assign zero = !c; 

endmodule