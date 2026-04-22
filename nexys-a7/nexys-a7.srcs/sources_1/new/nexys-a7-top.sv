`timescale 1ns / 1ps

module nexys_a7_top(
    input logic CLK100MHZ,
    input logic BTNU, // reset
    input logic [15:0] SW, // SW[15] is manual clock, SW[3:0] selects debug register
    output logic [15:0] LED,
    output logic CA,
    output logic CB,
    output logic CC,
    output logic CD,
    output logic CE,
    output logic CF,
    output logic CG,
    output logic DP,
    output logic [7:0] AN
);
    logic clk;
    logic [15:0] PC;
    logic [15:0] inst;
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [15:0] Mem_Address;
    logic MemWrite;

    assign clk = SW[15];

    instruction_mem instruction_mem_instance (
        .PC(PC),
        .inst(inst)
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

    sev_seg_driver pc_display (
        .clk(CLK100MHZ),
        .value(PC),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG),
        .DP(DP),
        .AN(AN)
    );

endmodule
