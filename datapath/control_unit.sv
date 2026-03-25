`timescale 1ns / 1ps

module control_unit(
    input  logic [15:0] inst,
    input  logic       BrEq,
    input  logic       BrLT,
    output logic       PC_Sel,
    output logic       A_Sel,
    output logic       B_Sel,
    output logic [1:0] ALU_select,
    output logic [1:0] WB_Sel,
    output logic       RegWEn,
    output logic       MemWrite,
    output logic       imm_sel
);

    // extract the 4-bit opcode from the top of the instruction
    logic [3:0] opcode;
    assign opcode = inst[15:12];

    // opcodes from the part 1 isa design
    localparam ADD  = 4'b0000;
    localparam SUB  = 4'b0001;
    localparam AND  = 4'b0010;
    localparam OR   = 4'b0011;
    localparam LI   = 4'b0101;
    localparam LW   = 4'b0110;
    localparam SW   = 4'b0111;
    localparam BEQ  = 4'b1000;
    localparam BNE  = 4'b1001;
    localparam BLT  = 4'b1010;
    localparam BGE  = 4'b1011;
    localparam JAL  = 4'b1100;
    localparam HALT = 4'b1111;

    always_comb begin
        // set defaults first to prevent inferred latches
        PC_Sel     = 1'b0;
        A_Sel      = 1'b0;
        B_Sel      = 1'b0;
        ALU_select = 2'b00; 
        WB_Sel      = 2'b00;
        RegWEn     = 1'b0;
        MemWrite   = 1'b0;
        imm_sel    = 1'b0;

        case (opcode)
            ADD: begin
                RegWEn = 1'b1;
            end
            SUB: begin
                RegWEn = 1'b1;
                ALU_select = 2'b01;
            end
            AND: begin
                RegWEn = 1'b1;
                ALU_select = 2'b10;
            end
            OR: begin
                RegWEn = 1'b1;
                ALU_select = 2'b11;
            end
            LI: begin
                // li uses 8 bit immediate
                RegWEn = 1'b1;
                B_Sel = 1'b1; 
            end
            LW: begin
                RegWEn = 1'b1;
                B_Sel = 1'b1; 
                WB_Sel = 2'b01; // write back from data memory
                imm_sel = 1'b1; // use 4 bit immediate
            end
            SW: begin
                MemWrite = 1'b1;
                B_Sel = 1'b1; 
                imm_sel = 1'b1; 
            end
            BEQ: begin
                PC_Sel = BrEq;
                A_Sel = 1'b1; // use pc for target address addition
                B_Sel = 1'b1; 
                imm_sel = 1'b1; 
            end
            BNE: begin
                PC_Sel = !BrEq;
                A_Sel = 1'b1;
                B_Sel = 1'b1;
                imm_sel = 1'b1;
            end
            BLT: begin
                PC_Sel = BrLT;
                A_Sel = 1'b1;
                B_Sel = 1'b1;
                imm_sel = 1'b1;
            end
            BGE: begin
                PC_Sel = !BrLT;
                A_Sel = 1'b1;
                B_Sel = 1'b1;
                imm_sel = 1'b1;
            end
            JAL: begin
                PC_Sel = 1'b1; // jump is always taken
                A_Sel = 1'b1; 
                B_Sel = 1'b1; 
                RegWEn = 1'b1; // save return address
                WB_Sel = 2'b10; // write back pc plus 1
                imm_sel = 1'b0; // jump uses 8 bit immediate
            end
            HALT: begin
                // leave all enables at 0 so state stops changing
            end
            default: begin
                // catches anything weird
            end
        endcase
    end
endmodule