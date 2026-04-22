`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 06:22:15 PM
// Design Name: 
// Module Name: nexys-a7-top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nexys_a7_top(
    input logic CLK100MHZ,
    input logic BTNU, //reset
    input logic [3:0] SW, //debug: select register to display on lights (cpu_top inr)
    output logic [15:0] LED //debug: register value out (cpu_top outvalue)
    );
    logic clk;
    logic [15:0] PC;
    logic [15:0] inst;
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [15:0] Mem_Address;
    logic MemWrite;

    //assign clk = CLK100MHZ;

    instruction_mem instruction_mem_instance (
        .PC(PC),
        .inst(inst)
    );

    clk_64_mhz clk_64 (
        .clk_in1(CLK100MHZ),
        .clk_out1(clk)
    );

    data_mem data_mem_instance (
        .clk(clk),
        .MemWrite(MemWrite),
        .addr(Mem_Address),
        .dataW(Mem_WriteData),
        .dataR(Mem_ReadData)
    );

    cpu_top hb823 (
        .clk(clk),
        .reset(BTNU),
        .PC(PC),
        .inst(inst),
        .Mem_ReadData(Mem_ReadData),
        .Mem_WriteData(Mem_WriteData),
        .Mem_Address(Mem_Address),
        .MemWrite(MemWrite),
        .inr(SW[3:0]),
        .outvalue(LED[15:0])
    );
    
endmodule
