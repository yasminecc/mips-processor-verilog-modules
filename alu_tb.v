`include "alu.v"
`timescale 1ns/1ns //time scale

module alu_tb(); 

    reg [3:0] op; //registers inputs
    reg [31:0] a, b;
    wire [31:0] c; //output
    wire zero;

    Alu alu(op, a, b, c, zero); 

    initial begin
        $dumpfile("alu.vcd"); 
        $dumpvars(0, alu_tb);

        a = 5;
        b = 3;

        #10;  //testing all the opcodes, waiting for 10ns between each new opcode
        op = 0;
        #10;
        op = 1;
        #10;
        op = 2;
        #10;
        op = 3;
        #10;
        op = 4;
        #10;
        op = 5;
        #10;
        op = 6;
        #10;
        op = 7;
        #10;
        $finish;

    end

endmodule
