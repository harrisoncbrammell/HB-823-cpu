`timescale 1ns / 1ps

module cpu_top_tb;

    // --- Signals for CPU Top ---
    logic        clk;
    logic        reset;
    logic [15:0] PC;
    logic [15:0] inst;

    // Debug ports
    logic [3:0]  inr;
    logic [15:0] outvalue;

    // External Memory Interface
    logic [15:0] Mem_ReadData;
    logic [15:0] Mem_WriteData;
    logic [9:0]  Mem_Address;
    logic        MemWrite;

    // Trace registers so the printed line corresponds to the instruction
    // that just executed, including the very first one.
    logic [15:0] trace_PC;
    logic [15:0] trace_inst;

    // --- Component Instantiations ---
    cpu_top uut (.*);

    instruction_mem imem (.*);

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

        clk = 0;
        reset = 1;
        inr = 4'd0;

        trace_PC = 16'd0;
        trace_inst = 16'd0;

        #15;
        reset = 0;
    end

    // --- FUNCTION: Decode full instruction with operands ---
    function string decode_instruction(input logic [15:0] inst_in);
        logic [3:0] opcode, rA, rB, rC;
        logic [7:0] imm8;
        logic [3:0] imm4;
        string result;

        opcode = inst_in[15:12];
        rA     = inst_in[11:8];
        rB     = inst_in[7:4];
        rC     = inst_in[3:0];
        imm8   = inst_in[7:0];
        imm4   = inst_in[3:0];

        case (opcode)
            4'h0: result = $sformatf("ADD R%0d, R%0d, R%0d", rA, rB, rC);
            4'h1: result = $sformatf("SUB R%0d, R%0d, R%0d", rA, rB, rC);
            4'h2: result = $sformatf("AND R%0d, R%0d, R%0d", rA, rB, rC);
            4'h3: result = $sformatf("OR  R%0d, R%0d, R%0d", rA, rB, rC);
            4'h4: result = $sformatf("NOT R%0d, R%0d", rA, rB);
            4'h5: result = $sformatf("LI  R%0d, 0x%02h", rA, imm8);

            // B/M format: [15:12] opcode | [11:8] rA | [7:4] rB | [3:0] imm4
            4'h6: result = $sformatf("LW  R%0d, 0x%0h(R%0d)", rA, imm4, rB);
            4'h7: result = $sformatf("SW  R%0d, 0x%0h(R%0d)", rA, imm4, rB);
            4'h8: result = $sformatf("BEQ R%0d, R%0d, 0x%0h", rA, rB, imm4);
            4'h9: result = $sformatf("BNE R%0d, R%0d, 0x%0h", rA, rB, imm4);
            4'hA: result = $sformatf("BLT R%0d, R%0d, 0x%0h", rA, rB, imm4);
            4'hB: result = $sformatf("BGE R%0d, R%0d, 0x%0h", rA, rB, imm4);

            4'hC: result = $sformatf("JAL R%0d, 0x%02h", rA, imm8);
            4'hD: result = $sformatf("JALR R%0d, R%0d", rA, rB);
            4'hF: result = "HALT";
            default: result = "UNKNOWN";
        endcase

        return result;
    endfunction

    // Capture the instruction/PC that are about to execute on this cycle.
    always @(posedge clk) begin
        if (!reset) begin
            trace_PC   <= PC;
            trace_inst <= inst;
        end
    end

    // --- DYNAMIC STATE MONITOR ---
    always @(negedge clk) begin
        if (!reset) begin
            $write("%6t | %2d | %4h | %-25s | ",
                   $time, trace_PC, trace_inst, decode_instruction(trace_inst));

            // 1. HALT
            if (trace_inst == 16'hF000) begin
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
                if (trace_inst[15:12] == 4'hC)
                    $display("REG WRITE: R%0d gets return addr %0d, Jumping to PC %0d",
                             trace_inst[11:8], uut.dataW, uut.PC_write);
                else
                    $display("REG WRITE: R%0d gets %0d", trace_inst[11:8], uut.dataW);
            end

            // 4. BRANCH / JUMP TAKEN
            else if (uut.PC_write != uut.PC + 16'd1) begin
                $display("BRANCH/JUMP TAKEN: Jumping to PC %0d", uut.PC_write);
            end

            else begin
                $display("NO STATE CHANGE (Branch not taken or NOP)");
            end
        end
    end

endmodule