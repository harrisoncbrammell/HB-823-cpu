module immediate_gen (
    input  logic [15:0] inst,    // full 16-bit instruction
    input  logic        imm_sel, // 0 for i-type (8-bit), 1 for b/m-type (4-bit)
    output logic [15:0] imm_out  // 16-bit sign-extended output
);

    always_comb begin
        if (imm_sel == 1'b0) begin
            // i-type: grab bottom 8 bits and sign extend to 16 bits
            // we copy the sign bit (inst[7]) 8 times
            imm_out = {{8{inst[7]}}, inst[7:0]};
        end else begin
            // b/m-type: grab bottom 4 bits and sign extend to 16 bits
            // we copy the sign bit (inst[3]) 12 times
            imm_out = {{12{inst[3]}}, inst[3:0]};
        end
    end

endmodule