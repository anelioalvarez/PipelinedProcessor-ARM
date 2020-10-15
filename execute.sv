/*
-Practico 1
-Ejercicio 8

Etapa Execute

*/

module execute
    #(parameter N = 64) (
    input  logic         AluSrc,
    input  logic [3:0]   AluControl,
    input  logic [N-1:0] PC_E,
    input  logic [N-1:0] signImm_E,
    input  logic [N-1:0] readData1_E,
    input  logic [N-1:0] readData2_E,
    output logic [N-1:0] PCBranch_E,
    output logic [N-1:0] aluResult_E,
    output logic [N-1:0] writeData_E,
    output logic         zero_E
);
    // Internal signals
    logic [N-1:0] mux_out;
    logic [N-1:0] shift_left_2_out;


    // Module instances
    mux2 #(64) MUX(
        .d0(readData2_E),
        .d1(signImm_E),
        .s(AluSrc),
        .y(mux_out)
    );

    alu ALU(
        .a(readData1_E),
        .b(mux_out),
        .ALUControl(AluControl),
        .result(aluResult_E),
        .zero(zero_E)
    );

    sl2 #(64) Shift_left_2(
        .a(signImm_E),
        .y(shift_left_2_out)
    );

    adder #(64) Add(
        .a(PC_E),
        .b(shift_left_2_out),
        .y(PCBranch_E)
    );

    assign writeData_E = readData2_E;

endmodule