`timescale 1ns / 1ps

module cpu_top_tb;

    // --- Signals for CPU Top ---
    logic        clk;
    logic        reset;
    
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [9:0]  Mem_Address;
    logic        MemWrite;
    logic [3:0]  inr;
    logic [15:0] outvalue;

    // --- Component Instantiations ---
    cpu_top uut (.*);

    data_mem dmem (
        .clk(clk),
        .MemWrite(MemWrite),
        .addr({6'b0, Mem_Address}), 
        .dataW(Mem_WriteData),
        .dataR(Mem_ReadData)
    );

    // --- Clock Generator (100MHz) ---
    always #5 clk = ~clk;

    // --- Main Test Sequence ---
    initial begin
        $dumpfile("cpu_top_waves.vcd");
        $dumpvars(0, cpu_top_tb);

        $display("\n==========================================================================================");
        $display("                          CPU INSTRUCTION VERIFICATION REPORT                             ");
        $display("==========================================================================================");

        // --- INSTRUCTION INJECTION ---
        // 1. Load Immediates
        uut.imem.memory[0]  = 16'h520A; // LI R2, 10
        uut.imem.memory[1]  = 16'h530A; // LI R3, 10
        uut.imem.memory[2]  = 16'h5405; // LI R4, 5
        uut.imem.memory[3]  = 16'h550F; // LI R5, 15
        
        // 2. ALU Operations
        uut.imem.memory[4]  = 16'h0624; // ADD R6, R2, R4  (10 + 5 = 15)
        uut.imem.memory[5]  = 16'h1724; // SUB R7, R2, R4  (10 - 5 = 5)
        uut.imem.memory[6]  = 16'h2824; // AND R8, R2, R4  (10 & 5 = 0)
        uut.imem.memory[7]  = 16'h3924; // OR  R9, R2, R4  (10 | 5 = 15)
        
        // 3. Memory Access (Offset 6 aligns with reading R6)
        uut.imem.memory[8]  = 16'h7006; // SW R6, 6(R0)    (Saves 15 into Mem[6])
        uut.imem.memory[9]  = 16'h6A06; // LW R10, 6(R0)   (Loads 15 into R10)
        
        // 4. Branching (Offset 2 aligns with reading R2)
        uut.imem.memory[10] = 16'h8032; // BEQ R3, R2, 2   (10 == 10 -> Jump to 12)
        uut.imem.memory[11] = 16'hF000; // HALT            (SKIPPED)
        
        uut.imem.memory[12] = 16'h9042; // BNE R4, R2, 2   (5 != 10 -> Jump to 14)
        uut.imem.memory[13] = 16'hF000; // HALT            (SKIPPED)
        
        uut.imem.memory[14] = 16'hA042; // BLT R4, R2, 2   (5 < 10 -> Jump to 16)
        uut.imem.memory[15] = 16'hF000; // HALT            (SKIPPED)
        
        uut.imem.memory[16] = 16'hB052; // BGE R5, R2, 2   (15 >= 10 -> Jump to 18)
        uut.imem.memory[17] = 16'hF000; // HALT            (SKIPPED)
        
        // 5. Unconditional Jump
        uut.imem.memory[18] = 16'hC102; // JAL R1, 2       (Jump to 20, R1 gets PC+1=19)
        uut.imem.memory[19] = 16'hF000; // HALT            (SKIPPED)
        
        // 6. Finish
        uut.imem.memory[20] = 16'hF000; // HALT            (Execution stops)

        // Initialize
        clk = 0;
        reset = 1;
        inr = 0; 
        
        #15;
        reset = 0;
    end

    // --- AUTOMATED VERIFICATION LOGGER ---
    // We sample on the negative edge, right after combinational logic evaluates, 
    // but right before the clock actually writes it to the registers!
    always @(negedge clk) begin
        if (!reset) begin
            case (uut.PC)
                16'd0:  $display("PC: %2d | [LI  R2, 10]    | Inputs: imm=10             | Output: dataW=%2d     | Expected: 10", uut.PC, uut.dataW);
                16'd1:  $display("PC: %2d | [LI  R3, 10]    | Inputs: imm=10             | Output: dataW=%2d     | Expected: 10", uut.PC, uut.dataW);
                16'd2:  $display("PC: %2d | [LI  R4, 5]     | Inputs: imm=5              | Output: dataW=%2d     | Expected:  5", uut.PC, uut.dataW);
                16'd3:  $display("PC: %2d | [LI  R5, 15]    | Inputs: imm=15             | Output: dataW=%2d     | Expected: 15", uut.PC, uut.dataW);
                16'd4:  $display("PC: %2d | [ADD R6, R2, R4]| Inputs: R2=%0d, R4=%0d        | Output: dataW=%2d     | Expected: 15", uut.PC, uut.dataR1, uut.dataR2, uut.dataW);
                16'd5:  $display("PC: %2d | [SUB R7, R2, R4]| Inputs: R2=%0d, R4=%0d        | Output: dataW=%2d     | Expected:  5", uut.PC, uut.dataR1, uut.dataR2, uut.dataW);
                16'd6:  $display("PC: %2d | [AND R8, R2, R4]| Inputs: R2=%0d, R4=%0d        | Output: dataW=%2d     | Expected:  0", uut.PC, uut.dataR1, uut.dataR2, uut.dataW);
                16'd7:  $display("PC: %2d | [OR  R9, R2, R4]| Inputs: R2=%0d, R4=%0d        | Output: dataW=%2d     | Expected: 15", uut.PC, uut.dataR1, uut.dataR2, uut.dataW);
                16'd8:  $display("PC: %2d | [SW  R6, 6(R0)] | Inputs: R6=%0d, addr=6       | Output: Mem[%0d]=%0d   | Expected: Mem[6]=15", uut.PC, uut.Mem_WriteData, uut.Mem_Address, uut.Mem_WriteData);
                16'd9:  $display("PC: %2d | [LW  R10,6(R0)] | Inputs: addr=6             | Output: dataW=%2d     | Expected: 15", uut.PC, uut.dataW);
                16'd10: $display("PC: %2d | [BEQ R3, R2, 2] | Inputs: R3=%0d, R2=%0d (Eq)    | Output: NextPC=%2d    | Expected: 12", uut.PC, uut.dataR1, uut.dataR2, uut.PC_write);
                16'd12: $display("PC: %2d | [BNE R4, R2, 2] | Inputs: R4=%0d, R2=%0d (Neq)   | Output: NextPC=%2d    | Expected: 14", uut.PC, uut.dataR1, uut.dataR2, uut.PC_write);
                16'd14: $display("PC: %2d | [BLT R4, R2, 2] | Inputs: R4=%0d, R2=%0d (Less)  | Output: NextPC=%2d    | Expected: 16", uut.PC, uut.dataR1, uut.dataR2, uut.PC_write);
                16'd16: $display("PC: %2d | [BGE R5, R2, 2] | Inputs: R5=%0d, R2=%0d (GTE)   | Output: NextPC=%2d    | Expected: 18", uut.PC, uut.dataR1, uut.dataR2, uut.PC_write);
                16'd18: $display("PC: %2d | [JAL R1, 2]     | Inputs: PC=18, imm=2       | Out: NxtPC=%0d, R1=%0d| Exp: NxtPC=20, R1=19", uut.PC, uut.PC_write, uut.dataW);
                16'd20: begin
                        $display("PC: %2d | [HALT]          | Inputs: none               | Output: RegWEn=%b     | Expected: 0", uut.PC, uut.RegWEn);
                        $display("==========================================================================================");
                        $finish;
                end
            endcase
        end
    end

endmodule


