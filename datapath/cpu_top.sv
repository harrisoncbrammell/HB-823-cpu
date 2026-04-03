`timescale 1ns / 1ps

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

// --- Internal Wires ---
// PC & Instruction
    logic [15:0] PC_write;
    logic [15:0] PC;
    logic [15:0] inst; 

    // Control Signals
    logic        BrEq;
    logic        BrLT;
    logic        PC_Sel;
    logic        A_Sel;
    logic        B_Sel;
    logic [1:0]  ALU_select;
    logic [1:0]  WB_Sel;
    logic        RegWEn;
    logic        imm_sel;

    // Register File Data
    logic [15:0] dataR1;
    logic [15:0] dataR2;
    logic [15:0] dataW;

    // Immediate and ALU Data
    logic [15:0] imm;
    logic [15:0] ALU_A;
    logic [15:0] ALU_B;
    logic [15:0] ALU_out;

// --- Component Modules Instaniations---
// automatic connections (all same port names)
pc pc_inst (.*);
instruction_mem imem (.*);
control_unit ctrl (.*);
immediate_gen imm_gen (.*);
alu main_alu (.*);
pc_write_select next_pc_mux (.*);
alu_input_select alu_input_select_instance (.*);

// manual connections
reg_file reg_file_instance (
    .clk(clk),
    .reset(reset),
    .RegWEn(RegWEn),
    .rsR1(inst[7:4]),
    .rsR2(inst[3:0]),
    .rdW(inst[11:8]),
    .dataW(dataW),
    .inr(inr),
    .dataR1(dataR1),
    .dataR2(dataR2),
    .outvalue(outvalue)
);

branch_comp branch_comp_instance (
    .A(dataR1),
    .B(dataR2),
    .BrEq(BrEq),
    .BrLT(BrLT)
);

regfile_dataW_select regfile_dataW_select_instance (
    .PC(PC),
    .ALU_out(ALU_out),
    .dataR(Mem_ReadData),
    .WB_Sel(WB_Sel),
    .dataW(dataW)
);

// external data memory driver
assign Mem_Address = ALU_out[9:0]; // alu calculates target memory address
assign Mem_WriteData = dataR2; // value in rsR2 gets stored in memory
// note: mem write connected via control unit already


endmodule