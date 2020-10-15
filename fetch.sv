/*
-Practico 1
-Ejercicio 7

Etapa Fetch

*/

module fetch
    #(parameter N = 64) (
    input  logic         PCSrc_F,
    input  logic         clk, reset,
    input  logic [N-1:0] PCBranch_F,
    output logic [N-1:0] imem_addr_F
);
    // Internal signals
    logic [N-1:0] mux_out;
    logic [N-1:0] add_out;


    // Module instances
    mux2 #(64) MUX(
        .d0(add_out),
        .d1(PCBranch_F),
        .s(PCSrc_F),
        .y(mux_out)
    );

    flopr #(64) PC(
        .clk(clk),
        .reset(reset),
        .d(mux_out),
        .q(imem_addr_F)
    );

    adder #(64) Add(
        .a(imem_addr_F),
        .b(64'd4),
        .y(add_out)
    );

endmodule