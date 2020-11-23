// Macro definitions


// Instruction Mapping: Instruction -> Opcode
`define LDUR 11'b111_1100_0010
`define STUR 11'b111_1100_0000
`define CBZ  11'b101_1010_0???
`define ADD  11'b100_0101_1000
`define SUB  11'b110_0101_1000
`define AND  11'b100_0101_0000
`define ORR  11'b101_0101_0000
`define ADDI 11'b100_1000_100?
`define ANDI 11'b100_1001_000?
`define ORRI 11'b101_1001_000?
`define SUBI 11'b110_1000_100?
`define MOVZ 11'b110_1001_01??

// Operation Mapping: Operation -> ALUControl
`define A_AND_B      4'b0000
`define A_OR_B       4'b0001
`define A_PLUS_B     4'b0010
`define A_MINUS_B    4'b0110
`define PASS_INPUT_B 4'b0111
`define A_NOR_B      4'b1100
`define LSL_B_00     4'b1000
`define LSL_B_01     4'b1001
`define LSL_B_10     4'b1010
`define LSL_B_11     4'b1011

