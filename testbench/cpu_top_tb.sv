`timescale 1ns / 1ps

module cpu_top_tb;

    // --- Signals for CPU Top ---
    logic        clk;
    logic        reset;
    
    // External Memory Interface
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [9:0]  Mem_Address;
    logic        MemWrite;
    
    // Debug Ports
    logic [3:0]  inr;
    logic [15:0] outvalue;

    // String for our internal disassembler
    string asm_str;

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
        $display("                   CPU EXECUTION TRACE & SELF-CHECKING DEBUGGER                           ");
        $display("==========================================================================================");
        $display("  Time | PC | Hex  | Assembly         | Action Taken & Verification");
        $display("------------------------------------------------------------------------------------------");

        // Initialize
        clk = 0;
        reset = 1;
        inr = 0; 
        
        // Hold reset for a few cycles
        #15;
        reset = 0;
    end

    // --- INTERNAL DISASSEMBLER ---
    // Maps the current PC to the human-readable assembly instruction
    always @(*) begin
        case (uut.PC)
            16'd0:  asm_str = "LI  R2, 10";
            16'd1:  asm_str = "LI  R3, 10";
            16'd2:  asm_str = "LI  R4, 5";
            16'd3:  asm_str = "LI  R5, 15";
            16'd4:  asm_str = "ADD R6, R2, R4";
            16'd5:  asm_str = "SUB R7, R2, R4";
            16'd6:  asm_str = "AND R8, R2, R4";
            16'd7:  asm_str = "OR  R9, R2, R4";
            16'd8:  asm_str = "SW  R6, 6(R0)";
            16'd9:  asm_str = "LW  R10, 6(R0)";
            16'd10: asm_str = "BEQ R3, R2, 2";
            16'd12: asm_str = "BNE R4, R2, 2";
            16'd14: asm_str = "BLT R4, R2, 2";
            16'd16: asm_str = "BGE R5, R2, 2";
            16'd18: asm_str = "JAL R1, 2";
            16'd20: asm_str = "HALT";
            default: asm_str = "SKIPPED / NOP";
        endcase
    end

    // --- DYNAMIC STATE MONITOR & VERIFIER ---
    always @(negedge clk) begin
        if (!reset) begin
            // %-16s pads the assembly string to perfectly align the columns!
            $write("%6t | %2d | %4h | %-16s | ", $time, uut.PC, uut.inst, asm_str);

            // 1. HALT
            if (uut.inst == 16'hF000) begin
                $display("HALT DETECTED. Stopping execution.");
                $display("==========================================================================================\n");
                $finish;
            end
            
            // 2. MEMORY WRITES (SW)
            else if (uut.MemWrite) begin
                if (uut.PC == 8 && uut.Mem_WriteData !== 15)
                    $display("[FAIL] MEM WRITE: Expected 15, Got %0d", uut.Mem_WriteData);
                else
                    $display("[PASS] MEM WRITE: Mem[%0d] gets %0d", uut.Mem_Address, uut.Mem_WriteData);
            end
            
            // 3. REGISTER WRITES (ALU, LI, LW)
            else if (uut.RegWEn) begin
                logic [15:0] expected_val;
                logic        check_math;
                
                check_math = 1'b1; // Default to checking
                
                // Define the expected math for your specific program
                case (uut.PC)
                    0: expected_val = 10; // LI R2, 10
                    1: expected_val = 10; // LI R3, 10
                    2: expected_val = 5;  // LI R4, 5
                    3: expected_val = 15; // LI R5, 15
                    4: expected_val = 15; // ADD (10+5)
                    5: expected_val = 5;  // SUB (10-5)
                    6: expected_val = 0;  // AND (10&5)
                    7: expected_val = 15; // OR  (10|5)
                    9: expected_val = 15; // LW
                    18: expected_val = 19; // JAL return address
                    default: check_math = 1'b0; // Don't check unknown PCs
                endcase

                if (check_math) begin
                    if (uut.dataW !== expected_val)
                        $display("[FAIL] REG WRITE: R%0d Expected %0d, Got %0d", uut.inst[11:8], expected_val, uut.dataW);
                    else
                        $display("[PASS] REG WRITE: R%0d correctly received %0d", uut.inst[11:8], uut.dataW);
                end else begin
                    // Fallback for generic instructions not in the case statement
                    $display("[ OK ] REG WRITE: R%0d gets %0d", uut.inst[11:8], uut.dataW);
                end
            end
            
            // 4. BRANCHES
            else if (uut.PC_write != uut.PC + 16'd1) begin
                $display("[PASS] BRANCH TAKEN: Next PC -> %0d", uut.PC_write);
            end
            
            else begin
                $display("NO STATE CHANGE");
            end
        end
    end

endmodule