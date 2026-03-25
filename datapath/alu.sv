`timescale 1ns / 1ps

module alu(
    input wire signed [15:0] A, //16 bit signed input A
    input wire signed [15:0] B, //16 bit signed input B
    input wire [1:0] ALU_select, //2 bit alu operation select (from control unit)
    output reg signed [15:0] ALU_out //16 bit signed output of ALU
);

// Define readable names for the ALU operations
    localparam ADD = 2'b00;
    localparam SUB = 2'b01;
    localparam AND = 2'b10;
    localparam OR  = 2'b11;

always_comb begin
    case (ALU_select)
        ADD: ALU_out = A + B;
        SUB: ALU_out = A - B;
        AND: ALU_out = A & B;
        OR: ALU_out = A | B;
        default: ALU_out = 16'b0;
    endcase
end

endmodule