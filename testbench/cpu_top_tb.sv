`timescale 1ns / 1ps

// Generic debugger script for any program.mem file
// Displays the instruction and a brief description of the action it SHOULD have take
// If that action is not taken, that indicates an issue with the CPU
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

        $display("\n===========================================================");
        $display("          CPU EXECUTION TRACE (DEBUGGER MODE)              ");
        $display("===========================================================");
        $display("  Time |  PC  | Inst | Action Taken");
        $display("-----------------------------------------------------------");

        // Initialize
        clk = 0;
        reset = 1;
        inr = 0; 
        
        // Hold reset for a few cycles
        #15;
        reset = 0;
    end

    // --- DYNAMIC STATE MONITOR ---
    // We check on the negative edge to see what the combinational logic decided
    // right before the next rising clock edge commits it to memory/registers.
    always @(negedge clk) begin
        if (!reset) begin
            // 1. Print current Time, PC, and Raw Instruction
            $write("%6t | %4d | %4h | ", $time, uut.PC, uut.inst);

            // 2. Check for HALT Instruction
            if (uut.inst == 16'hF000) begin
                $display("HALT DETECTED. Stopping execution.");
                $display("===========================================================\n");
                $finish;
            end
            
            // 3. Track state changes dynamically
            // Check for Memory Writes (SW)
            else if (uut.MemWrite) begin
                $display("MEM WRITE: Mem[%0d] gets %0d", uut.Mem_Address, uut.Mem_WriteData);
            end
            
            // Check for Register Writes (ADD, SUB, LI, LW, etc.)
            // uut.inst[11:8] extracts the 'rd' (destination register) field
            else if (uut.RegWEn) begin
                // Special flag for Jump and Link since it writes to R1
                if (uut.inst[15:12] == 4'hC) 
                    $display("JUMP & LINK: R1 gets Return Address %0d. Next PC -> %0d", uut.dataW, uut.PC_write);
                else
                    $display("REG WRITE: R%0d gets %0d", uut.inst[11:8], uut.dataW);
            end
            
            // Check for successful Branches (PC_write changes to target)
            else if (uut.PC_write != uut.PC + 16'd1) begin
                $display("BRANCH TAKEN: Next PC -> %0d", uut.PC_write);
            end
            
            // If nothing above happened, it's either a failed branch or NOP
            else begin
                $display("NO STATE CHANGE (Branch not taken or NOP)");
            end
        end
    end

endmodule