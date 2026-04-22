`timescale 1ns / 1ps

//TODO: Implement load support?
// could allow for program editing on the fly, binary unpacking

module instruction_mem(
    input logic [15:0] PC, // program counter/instruction pointer (memory select)
    output logic [15:0] inst // selected instruction out (memory read out)
);
    //TODO: make variable size
    (* rom_style = "distributed" *) logic [15:0] memory [0:1023]; // 1k async ROM, implemented in LUTs

    initial begin
        $readmemh("../program.mem", memory); // load hex machine code program from mem file
    end

    assign inst = memory[PC[9:0]];
endmodule
