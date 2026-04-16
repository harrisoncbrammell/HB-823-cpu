`timescale 1ns / 1ps

module cpu_top (
    input logic clk, // clk input
    input logic reset, // async reset input

    output logic [15:0] PC,
    input logic [15:0] inst,

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

    // Register file address selects
    logic [3:0] rsR1_addr;
    logic [3:0] rsR2_addr;
    logic [3:0] rdW_addr;

    // decoded opcode
    logic [3:0] opcode;

    assign opcode = inst[15:12];

    // --- Register address selection ---
    // R-type default:
    //   rd  = inst[11:8]
    //   rs1 = inst[7:4]
    //   rs2 = inst[3:0]
    //
    // Branch format:
    //   [15:12] opcode | [11:8] rA | [7:4] rB | [3:0] imm4
    // so branches must compare rA and rB, not [7:4] and [3:0]
    //
    // LW/SW format:
    //   [15:12] opcode | [11:8] rA | [7:4] rB | [3:0] imm4
    // LW  rA, imm4(rB): rA = destination, rB = base
    // SW  rA, imm4(rB): rA = store data,  rB = base
    always_comb begin
        // defaults for R-type instructions
        rsR1_addr = inst[7:4];
        rsR2_addr = inst[3:0];
        rdW_addr  = inst[11:8];

        case (opcode)
            4'h6: begin // LW
                rsR1_addr = inst[7:4]; // base register rB
                rsR2_addr = 4'd0;      // unused
                rdW_addr  = inst[11:8]; // destination rA
            end

            4'h7: begin // SW
                rsR1_addr = inst[7:4];  // base register rB
                rsR2_addr = inst[11:8]; // store data register rA
                rdW_addr  = 4'd0;       // unused
            end

            4'h8, 4'h9, 4'hA, 4'hB: begin // BEQ, BNE, BLT, BGE
                rsR1_addr = inst[11:8]; // rA
                rsR2_addr = inst[7:4];  // rB
                rdW_addr  = 4'd0;       // unused
            end

            default: begin
                // keep R-type / current default behavior
            end
        endcase
    end

    // --- Component Modules Instantiations ---
    // automatic connections (all same port names)
    pc pc_inst (.*);
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
        .rsR1(rsR1_addr),
        .rsR2(rsR2_addr),
        .rdW(rdW_addr),
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
    assign Mem_Address   = ALU_out[9:0]; // alu calculates target memory address
    assign Mem_WriteData = dataR2;       // for SW, rsR2 now correctly selects rA (store data)

endmodule