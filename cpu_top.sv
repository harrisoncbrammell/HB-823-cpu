`timescale 1ns / 1ps;

module cpu_top (
    input logic clk, // clk input
    input logic reset, // async reset input

    input logic [15:0] Mem_ReadData, // value read from data memory
    output logic [15:0] Mem_WriteData, // value to write to data memory
    output logic [9:0] Mem_Address, // data memory address select
    output logic MemWrite, // data memory write enable 1 to write, 0 to read

    input logic [3:0] inr, // debug port: register select
    output logic [15:0] outvalue // debug port: register read out
);

endmodule