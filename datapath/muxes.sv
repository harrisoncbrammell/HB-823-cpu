`timescale 1ns/1ps

module pc_write_select(
    input logic PC_Sel, // 1: alu output, 0: pc+2
    input logic [15:0] PC, // current program counter
    input logic [15:0] ALU_out, // alu output (for jumps)
    output logic [15:0] PC_write // next program counter value
);
    always_comb begin
        if (PC_Sel == 1'b1) begin
            PC_write = ALU_out;
        end else begin
            PC_write = PC + 16'b1;
        end
    end
endmodule

module alu_input_select(
    input logic [15:0] PC, //program counter
    input logic [15:0] imm, //immediate generator out
    input logic [15:0] dataR1, //regfile read bus 1
    input logic [15:0] dataR2, // regfile read bus 2
    input logic A_Sel, // a select control logic 1: pc, 0: dataR1
    input logic B_Sel, // b select control logic 1: immediate, 0: dataR2
    output logic [15:0] ALU_A, //alu a input
    output logic [15:0] ALU_B // alu b input
);
    assign ALU_A = (A_Sel == 1'b1) ? PC : dataR1;
    assign ALU_B = (B_Sel == 1'b1) ? imm : dataR2;
endmodule

module regfile_dataW_select(
    input logic [15:0] PC, //program counter
    input logic [15:0] ALU_out, //alu output
    input logic [15:0] dataR, // dataR from data memory
    input logic [1:0] WB_Sel, //WB_Sel from control signal 2: pc+1, 1: alu, 0: dataR from data memory
    output logic [15:0] dataW //dataW to the regfile
);
always_comb begin
    case (WB_Sel)
        2'b00: dataW = ALU_out;    // Default: read from ALU (ADD, SUB, LI, etc.)
        2'b01: dataW = dataR;      // read from data memory (LW)
        2'b10: dataW = PC + 16'b1; // read from PC+1 (JAL)
        default: dataW = 16'b0;    // default case to avoid latches
    endcase
end
endmodule
