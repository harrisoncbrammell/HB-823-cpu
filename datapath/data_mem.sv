`timescale 1ns/1ps

// no reset lets vivado use block ram instead of building memory with gates
module data_mem(
    input  logic clk,
    input  logic MemWrite, // 1 to write, 0 to read
    input  logic [15:0] addr, // memory address from alu
    input  logic [15:0] dataW, // data to write (from register file)
    output logic [15:0] dataR // data read from memory
);
    //TODO: Make variable size
    (* ram_style = "block" *) reg [15:0] memory [0:1023]; // 1k memory array of 16-bit words

    assign dataR = memory[addr[9:0]];  // it will always output the data at the given address immediately

    always_ff @(posedge clk) begin
        if (MemWrite == 1'b1) begin
            memory[addr[9:0]] <= dataW;
        end
    end
endmodule
