`timescale 1ns / 1ps

module branch_comp (
    input  logic signed [15:0] A,
    input  logic signed [15:0] B,
    output logic               BrEq,
    output logic               BrLT
);

    assign BrEq = (A == B);
    assign BrLT = (A < B);

endmodule