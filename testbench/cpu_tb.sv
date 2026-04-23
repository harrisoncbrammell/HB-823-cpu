`timescale 1ns / 1ps

module cpu_tb;

    logic clk;
    logic reset;
    logic [3:0] inr;

    logic [15:0] outvalue;

    logic [15:0] PC;
    logic [15:0] inst;

    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [10:0] Mem_Address;
    logic MemWrite;

    cpu_top uut_cpu (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .inst(inst),
        .Mem_ReadData(Mem_ReadData),
        .Mem_WriteData(Mem_WriteData),
        .Mem_Address(Mem_Address),
        .MemWrite(MemWrite),
        .inr(inr),
        .outvalue(outvalue)
    );

    instruction_mem uut_imem (
        .PC(PC),
        .inst(inst)
    );

    data_mem uut_dmem (
        .clk(clk),
        .MemWrite(MemWrite),
        .addr({5'b0, Mem_Address}),
        .dataW(Mem_WriteData),
        .dataR(Mem_ReadData)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        inr = 4'b0000; 

        #20;
        reset = 0;

        #400;
        $finish;
    end

    initial begin
        $dumpfile("cpu_tb_waves.vcd");
        $dumpvars(0, cpu_tb);
    end

endmodule