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
        ROM [0:34] ='{
            32'hf8000000,
            32'hf8008001,
            32'hf8010002,
            32'hd61f0300,
            32'hf8018003,
            32'hf8020004,
            32'hf8028005,
            32'hf8030006,
            32'hf8400007,
            32'hf8408008,
            32'hf8410009,
            32'h1400000b,
            32'hf841800a,
            32'hf842000b,
            32'hf842800c,
            32'hf843000d,
            32'hcb0e01ce,
            32'hb400004e,
            32'hcb01000f,
            32'h8b01000f,
            32'hf803800f,
            32'h14000007,
            32'hf805000a,
            32'h913f800b,
            32'hf805800b,
            32'hd2b9595b,
            32'hf80d801b,
            32'h17fffff1,
            32'h91199c1c,
            32'hd100079c,
            32'h9240039c,
            32'hb240001e,
            32'hb400005e,
            32'hf80e001c,
            32'hb400001f
        };
    end
    
    assign q = ROM[addr];

endmodule