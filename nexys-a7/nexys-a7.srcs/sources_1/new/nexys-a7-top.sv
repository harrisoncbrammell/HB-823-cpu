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
    
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [15:0] Mem_Address;
    logic MemWrite;

    block_mem_data block_mem_data_instance (
        .clka(CLK100MHZ),
        .wea(MemWrite),
        .addra(Mem_Address),
        .dina(Mem_WriteData),
        .douta(Mem_ReadData)
    );

    cpu_top hb823 (
        .clk(CLK100MHZ),
        .reset(BTNU),
        .Mem_ReadData(Mem_ReadData),
        .Mem_WriteData(Mem_WriteData),
        .Mem_Address(Mem_Address),
        .MemWrite(MemWrite),
        .inr(SW[3:0]),
        .outvalue(LED[15:0])
    );
    
endmodule
