// ALU CONTROL DECODER
`include "macros.sv"

module aludec (
    input  logic [10:0] funct,  
    input  logic [1:0]  aluop,  
    output logic [3:0]  alucontrol
);
    /* always_comb
        if (aluop == 2'b00) alucontrol = `A_PLUS_B;          // LDUR or STUR		
        else if (aluop == 2'b01) alucontrol = `PASS_INPUT_B; //CBZ
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `ADD)) alucontrol = `A_PLUS_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `SUB)) alucontrol = `A_MINUS_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `AND)) alucontrol = `A_AND_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `ORR)) alucontrol = `A_OR_B;
        else alucontrol = 4'b0000; */

    always_comb
        case(aluop)
            // LDUR or STUR
            2'b00: alucontrol = `A_PLUS_B;
            
            // CBZ
            2'b01: alucontrol = `PASS_INPUT_B;
            
            // [R]
            2'b10:
                // See Opcode
                case(funct)
                    `ADD   : alucontrol = `A_PLUS_B;
                    `SUB   : alucontrol = `A_MINUS_B;
                    `AND   : alucontrol = `A_AND_B;
                    `ORR   : alucontrol = `A_OR_B;
                    default: alucontrol = 4'b0000;
                endcase

            // [I, IM]
            2'b11:
                // See Opcode
                casez(funct)
                    `ADDI:  alucontrol = `A_PLUS_B;
                    `ANDI:  alucontrol = `A_AND_B;
                    `ORRI:  alucontrol = `A_OR_B;
                    `SUBI:  alucontrol = `A_MINUS_B;
                    `MOVZ:  case(funct[1:0]) // lsl: Instruction[22:21]
                                2'b00  : alucontrol = `MOVZ_B_00;
                                2'b01  : alucontrol = `MOVZ_B_01;
                                2'b10  : alucontrol = `MOVZ_B_10;
                                default: alucontrol = `MOVZ_B_11;
                            endcase
                    default: alucontrol = 4'b0000;
                endcase

            default: alucontrol = 4'b0000;
        endcase

endmodule
