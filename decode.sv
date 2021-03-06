// Etapa: DECODE

module decode
    #(parameter N = 64) (
    input  logic         regWrite_D, reg2loc_D, clk,
    input  logic [N-1:0] writeData3_D,
    input  logic [31:0]  instr_D,
    output logic [N-1:0] signImm_D, readData1_D, readData2_D, 
    input  logic [4:0]   wa3_D, // Eliminar para single cycle processor
    output logic [4:0]   ra1_D, ra2_D
); 

    assign ra1_D = instr_D[9:5];
    
    mux2 #(5) ra2mux(
        .d0(instr_D[20:16]),
        .d1(instr_D[4:0]),
        .s(reg2loc_D),
        .y(ra2_D)
    );
    
    regfile registers(
        .clk(clk),
        .we3(regWrite_D),
        .ra1(ra1_D),
        .ra2(ra2_D),
        .wa3(wa3_D),           // En single cycle processor: .wa3(instr_D[4:0])
        .wd3(writeData3_D),
        .rd1(readData1_D),
        .rd2(readData2_D)
    );
                             
    signext ext(
        .a(instr_D),
        .y(signImm_D)
    );
    
endmodule
