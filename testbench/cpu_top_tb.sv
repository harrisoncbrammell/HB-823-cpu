`timescale 1ns / 1ps

// A testbench to debug the any program.mem program
// Prints decoded instruction, and actual action taken by CPU

module cpu_top_tb;

    // --- Signals for CPU Top ---
    logic        clk;
    logic        reset;
    // Debug ports
    logic [3:0]  inr;
    logic [15:0] outvalue;

    // External Memory Interface
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [9:0]  Mem_Address;
    logic        MemWrite;
    
    // String for our dynamic disassembler
    string op_name;
    string instr_decoded;

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
        $display("                   GENERIC CPU EXECUTION TRACE & DEBUGGER                                 ");
        $display("==========================================================================================");
        $display("  Time | PC | Hex  | Full Instruction Decode | Action Taken by Hardware");
        $display("------------------------------------------------------------------------------------------");

        // Initialize
        clk = 0;
        reset = 1;
        
        // Hold reset for a few cycles
        #15;
        reset = 0;
    end

    // --- FUNCTION: Decode full instruction with operands ---
    function string decode_instruction(logic [15:0] inst);
        logic [3:0] opcode, rd, rs1, rs2;
        logic [7:0] imm;
        string result;
        
        opcode = inst[15:12];
        rd = inst[11:8];
        rs1 = inst[7:4];
        rs2 = inst[3:0];
        imm = inst[7:0];
        
        case (opcode)
            4'h0: result = $sformatf("ADD R%0d, R%0d, R%0d", rd, rs1, rs2);
            4'h1: result = $sformatf("SUB R%0d, R%0d, R%0d", rd, rs1, rs2);
            4'h2: result = $sformatf("AND R%0d, R%0d, R%0d", rd, rs1, rs2);
            4'h3: result = $sformatf("OR  R%0d, R%0d, R%0d", rd, rs1, rs2);
            4'h5: result = $sformatf("LI  R%0d, 0x%02h", rd, imm);
            4'h6: result = $sformatf("LW  R%0d, R%0d, 0x%02h", rd, rs1, imm);
            4'h7: result = $sformatf("SW  R%0d, R%0d, 0x%02h", rs1, rs2, imm);
            4'h8: result = $sformatf("BEQ R%0d, R%0d, 0x%02h", rs1, rs2, imm);
            4'h9: result = $sformatf("BNE R%0d, R%0d, 0x%02h", rs1, rs2, imm);
            4'hA: result = $sformatf("BLT R%0d, R%0d, 0x%02h", rs1, rs2, imm);
            4'hB: result = $sformatf("BGE R%0d, R%0d, 0x%02h", rs1, rs2, imm);
            4'hC: result = $sformatf("JAL R%0d, 0x%02h", rd, imm);
            4'hF: result = "HALT";
            default: result = "UNKNOWN";
        endcase
        
        return result;
    endfunction

    // --- DYNAMIC HARDWARE DISASSEMBLER ---
    // This reads the live instruction wire and decodes the full instruction on the fly!
    always @(*) begin
        instr_decoded = decode_instruction(uut.inst);
    end

    // --- DYNAMIC STATE MONITOR ---
    always @(negedge clk) begin
        if (!reset) begin
            $write("%6t | %2d | %4h | %-25s | ", $time, uut.PC, uut.inst, instr_decoded);

            // 1. HALT
            if (uut.inst == 16'hF000) begin
                $display("Stopping execution.");
                $display("==========================================================================================\n");
                $finish;
            end
            
            // 2. MEMORY WRITES (SW)
            else if (uut.MemWrite) begin
                $display("MEM WRITE: Mem[%0d] gets %0d", uut.Mem_Address, uut.Mem_WriteData);
            end
            
            // 3. REGISTER WRITES
            else if (uut.RegWEn) begin
                if (uut.inst[15:12] == 4'hC) // Special JAL print
                    $display("REG WRITE: R1 (Return Addr) gets %0d, Jumping to PC %0d", uut.dataW, uut.PC_write);
                else
                    $display("REG WRITE: R%0d gets %0d", uut.inst[11:8], uut.dataW);
            end
            
            // 4. BRANCHES
            else if (uut.PC_write != uut.PC + 16'd1) begin
                $display("BRANCH TAKEN: Jumping to PC %0d", uut.PC_write);
            end
            
            else begin
                $display("NO STATE CHANGE (Branch not taken or NOP)");
            end
        end
    end

endmodule