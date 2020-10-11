// SHIFT LEFT 2

module sl2
    #(parameter N = 64) (
    input  logic [N-1:0] a,
    output logic [N-1:0] y
);
    assign y = {a[N-3:0], 2'b00};
endmodule