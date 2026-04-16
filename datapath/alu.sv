`timescale 1ns / 1ps

module alu(
    input wire signed [15:0] ALU_A, //16 bit signed input A
    input wire signed [15:0] ALU_B, //16 bit signed input B
    input wire [2:0] ALU_select, //3 bit alu operation select (from control unit)
    output reg signed [15:0] ALU_out //16 bit signed output of ALU
);

// Define readable names for the ALU operations
    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam AND = 3'b010;
    localparam OR  = 3'b011;
    localparam NOT = 3'b100;
    

always_comb begin
    case (ALU_select)
        ADD: ALU_out = ALU_A + ALU_B;
        SUB: ALU_out = ALU_A - ALU_B;
        AND: ALU_out = ALU_A & ALU_B;
        OR: ALU_out = ALU_A | ALU_B;
        NOT: ALU_out = ~ALU_A;
        default: ALU_out = 16'b0;
    endcase
end

endmodule