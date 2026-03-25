`timescale 1ns / 1ps

module control_unit_tb;

    // testbench signals
    logic [15:0] inst;
    logic        BrEq;
    logic        BrLT;
    logic        PC_Sel;
    logic        A_Sel;
    logic        B_Sel;
    logic [1:0]  ALU_select;
    logic [1:0]  WB_Sel;
    logic        RegWEn;
    logic        MemWrite;
    logic        imm_sel;

    integer i;
    integer errors;
    int unsigned seed;

    // opcodes from the isa design
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

    // instantiate control unit
    control_unit uut (.*);

    // waveform setup for gtkwave
    initial begin
        $dumpfile("control_unit_waves.vcd");
        $dumpvars(0, control_unit_tb);
    end

    // main test sequence
    initial begin
        // setup random seed
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 32'h1BADB002;
        end
        void'($urandom(seed));
        $display("using random seed: %0d", seed);

        $display("starting comprehensive control unit tests...");

        // init signals
        BrEq = 0;
        BrLT = 0;
        errors = 0;

        // --- test add (opcode 0000) ---
        $display("\n--- testing add (opcode 0000) ---");
        inst = {ADD, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (RegWEn !== 1'b1 || ALU_select !== 2'b00 || WB_Sel !== 2'b00 || 
            A_Sel !== 1'b0 || B_Sel !== 1'b0 || MemWrite !== 1'b0 || imm_sel !== 1'b0 || PC_Sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR add: regwen=%b alu=%b wbsel=%b a_sel=%b b_sel=%b memwrite=%b imm_sel=%b pc_sel=%b",
                     RegWEn, ALU_select, WB_Sel, A_Sel, B_Sel, MemWrite, imm_sel, PC_Sel);
        end else begin
            $display("PASS add: regwen=%b alu=%b", RegWEn, ALU_select);
        end

        // --- test sub (opcode 0001) ---
        $display("\n--- testing sub (opcode 0001) ---");
        inst = {SUB, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b1 || ALU_select !== 2'b01 || WB_Sel !== 2'b00) begin
            errors = errors + 1;
            $display("ERROR sub: regwen=%b alu=%b wbsel=%b", RegWEn, ALU_select, WB_Sel);
        end else begin
            $display("PASS sub: regwen=%b alu=%b", RegWEn, ALU_select);
        end

        // --- test and (opcode 0010) ---
        $display("\n--- testing and (opcode 0010) ---");
        inst = {AND, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b1 || ALU_select !== 2'b10 || WB_Sel !== 2'b00) begin
            errors = errors + 1;
            $display("ERROR and: regwen=%b alu=%b wbsel=%b", RegWEn, ALU_select, WB_Sel);
        end else begin
            $display("PASS and: regwen=%b alu=%b", RegWEn, ALU_select);
        end

        // --- test or (opcode 0011) ---
        $display("\n--- testing or (opcode 0011) ---");
        inst = {OR, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b1 || ALU_select !== 2'b11 || WB_Sel !== 2'b00) begin
            errors = errors + 1;
            $display("ERROR or: regwen=%b alu=%b wbsel=%b", RegWEn, ALU_select, WB_Sel);
        end else begin
            $display("PASS or: regwen=%b alu=%b", RegWEn, ALU_select);
        end

        // --- test li (opcode 0101) ---
        $display("\n--- testing li (opcode 0101) ---");
        inst = {LI, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b1 || B_Sel !== 1'b1 || ALU_select !== 2'b00 || WB_Sel !== 2'b00) begin
            errors = errors + 1;
            $display("ERROR li: regwen=%b bsel=%b alu=%b wbsel=%b", RegWEn, B_Sel, ALU_select, WB_Sel);
        end else begin
            $display("PASS li: regwen=%b bsel=%b", RegWEn, B_Sel);
        end

        // --- test lw (opcode 0110) ---
        $display("\n--- testing lw (opcode 0110) ---");
        inst = {LW, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b1 || B_Sel !== 1'b1 || WB_Sel !== 2'b01 || imm_sel !== 1'b1 || MemWrite !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR lw: regwen=%b bsel=%b wbsel=%b imm_sel=%b memwrite=%b", 
                     RegWEn, B_Sel, WB_Sel, imm_sel, MemWrite);
        end else begin
            $display("PASS lw: regwen=%b bsel=%b wbsel=%b imm_sel=%b", RegWEn, B_Sel, WB_Sel, imm_sel);
        end

        // --- test sw (opcode 0111) ---
        $display("\n--- testing sw (opcode 0111) ---");
        inst = {SW, 12'($urandom)};
        #1;
        if (RegWEn !== 1'b0 || B_Sel !== 1'b1 || MemWrite !== 1'b1 || imm_sel !== 1'b1) begin
            errors = errors + 1;
            $display("ERROR sw: regwen=%b bsel=%b memwrite=%b imm_sel=%b", RegWEn, B_Sel, MemWrite, imm_sel);
        end else begin
            $display("PASS sw: memwrite=%b bsel=%b imm_sel=%b", MemWrite, B_Sel, imm_sel);
        end

        // --- test beq taken (opcode 1000, BrEq=1) ---
        $display("\n--- testing beq taken (opcode 1000, BrEq=1) ---");
        inst = {BEQ, 12'($urandom)};
        BrEq = 1; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b1 || A_Sel !== 1'b1 || B_Sel !== 1'b1 || imm_sel !== 1'b1 || RegWEn !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR beq (taken): pc_sel=%b asel=%b bsel=%b imm_sel=%b regwen=%b", 
                     PC_Sel, A_Sel, B_Sel, imm_sel, RegWEn);
        end else begin
            $display("PASS beq (taken): pc_sel=%b asel=%b bsel=%b", PC_Sel, A_Sel, B_Sel);
        end

        // --- test beq not taken (opcode 1000, BrEq=0) ---
        $display("\n--- testing beq not taken (opcode 1000, BrEq=0) ---");
        inst = {BEQ, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR beq (not taken): pc_sel=%b expected=0", PC_Sel);
        end else begin
            $display("PASS beq (not taken): pc_sel=%b", PC_Sel);
        end

        // --- test bne taken (opcode 1001, BrEq=0) ---
        $display("\n--- testing bne taken (opcode 1001, BrEq=0) ---");
        inst = {BNE, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b1 || A_Sel !== 1'b1 || B_Sel !== 1'b1 || imm_sel !== 1'b1) begin
            errors = errors + 1;
            $display("ERROR bne (taken): pc_sel=%b asel=%b bsel=%b imm_sel=%b", PC_Sel, A_Sel, B_Sel, imm_sel);
        end else begin
            $display("PASS bne (taken): pc_sel=%b", PC_Sel);
        end

        // --- test bne not taken (opcode 1001, BrEq=1) ---
        $display("\n--- testing bne not taken (opcode 1001, BrEq=1) ---");
        inst = {BNE, 12'($urandom)};
        BrEq = 1; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR bne (not taken): pc_sel=%b expected=0", PC_Sel);
        end else begin
            $display("PASS bne (not taken): pc_sel=%b", PC_Sel);
        end

        // --- test blt taken (opcode 1010, BrLT=1) ---
        $display("\n--- testing blt taken (opcode 1010, BrLT=1) ---");
        inst = {BLT, 12'($urandom)};
        BrEq = 0; BrLT = 1;
        #1;
        if (PC_Sel !== 1'b1 || A_Sel !== 1'b1 || B_Sel !== 1'b1 || imm_sel !== 1'b1) begin
            errors = errors + 1;
            $display("ERROR blt (taken): pc_sel=%b asel=%b bsel=%b imm_sel=%b", PC_Sel, A_Sel, B_Sel, imm_sel);
        end else begin
            $display("PASS blt (taken): pc_sel=%b", PC_Sel);
        end

        // --- test blt not taken (opcode 1010, BrLT=0) ---
        $display("\n--- testing blt not taken (opcode 1010, BrLT=0) ---");
        inst = {BLT, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR blt (not taken): pc_sel=%b expected=0", PC_Sel);
        end else begin
            $display("PASS blt (not taken): pc_sel=%b", PC_Sel);
        end

        // --- test bge taken (opcode 1011, BrLT=0) ---
        $display("\n--- testing bge taken (opcode 1011, BrLT=0) ---");
        inst = {BGE, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b1 || A_Sel !== 1'b1 || B_Sel !== 1'b1 || imm_sel !== 1'b1) begin
            errors = errors + 1;
            $display("ERROR bge (taken): pc_sel=%b asel=%b bsel=%b imm_sel=%b", PC_Sel, A_Sel, B_Sel, imm_sel);
        end else begin
            $display("PASS bge (taken): pc_sel=%b", PC_Sel);
        end

        // --- test bge not taken (opcode 1011, BrLT=1) ---
        $display("\n--- testing bge not taken (opcode 1011, BrLT=1) ---");
        inst = {BGE, 12'($urandom)};
        BrEq = 0; BrLT = 1;
        #1;
        if (PC_Sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR bge (not taken): pc_sel=%b expected=0", PC_Sel);
        end else begin
            $display("PASS bge (not taken): pc_sel=%b", PC_Sel);
        end

        // --- test jal (opcode 1100) ---
        $display("\n--- testing jal (opcode 1100) ---");
        inst = {JAL, 12'($urandom)};
        BrEq = 0; BrLT = 0;
        #1;
        if (PC_Sel !== 1'b1 || A_Sel !== 1'b1 || B_Sel !== 1'b1 || RegWEn !== 1'b1 || 
            WB_Sel !== 2'b10 || imm_sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR jal: pc_sel=%b asel=%b bsel=%b regwen=%b wbsel=%b imm_sel=%b", 
                     PC_Sel, A_Sel, B_Sel, RegWEn, WB_Sel, imm_sel);
        end else begin
            $display("PASS jal: pc_sel=%b regwen=%b wbsel=%b", PC_Sel, RegWEn, WB_Sel);
        end

        // --- test halt (opcode 1111) ---
        $display("\n--- testing halt (opcode 1111) ---");
        inst = {HALT, 12'($urandom)};
        #1;
        if (PC_Sel !== 1'b0 || A_Sel !== 1'b0 || B_Sel !== 1'b0 || ALU_select !== 2'b00 || 
            WB_Sel !== 2'b00 || RegWEn !== 1'b0 || MemWrite !== 1'b0 || imm_sel !== 1'b0) begin
            errors = errors + 1;
            $display("ERROR halt: not all 0 pc_sel=%b asel=%b bsel=%b alu=%b wbsel=%b regwen=%b memwrite=%b imm_sel=%b",
                     PC_Sel, A_Sel, B_Sel, ALU_select, WB_Sel, RegWEn, MemWrite, imm_sel);
        end else begin
            $display("PASS halt: all control signals are 0");
        end

        // --- undefined opcode (0100) ---
        $display("\n--- testing undefined opcode (0100) ---");
        inst = {4'b0100, 12'($urandom)};
        #1;
        $display("undefined opcode defaults: all signals: pc_sel=%b asel=%b bsel=%b alu=%b wbsel=%b regwen=%b memwrite=%b imm_sel=%b",
                 PC_Sel, A_Sel, B_Sel, ALU_select, WB_Sel, RegWEn, MemWrite, imm_sel);

        if (errors == 0) begin
            $display("\nall control unit tests passed.");
        end else begin
            $display("\ncontrol unit tests finished with %0d error(s).", errors);
        end

        $finish;
    end

endmodule