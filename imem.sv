/*
-Practico 1
-Ejercicio 4

Memoria ROM

direcciona 2^6=64 palabras de N=32 bits

*/

module imem
    #(parameter N = 32) (
    input  logic [5:0]   addr,
    output logic [N-1:0] q
);

    logic [N-1:0] ROM [0:63];

    initial // ROM initialization execute only one time, and sequentially
    begin
        ROM = '{default: '0}; // set all ROM with 0s
        ROM [0:22] ='{
            32'h8b0a03ea,
            32'h8b0b03eb,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'h8b1f03ff,
            32'hf805000a,
            32'hf805800b
        };
    end
    
    assign q = ROM[addr];

endmodule