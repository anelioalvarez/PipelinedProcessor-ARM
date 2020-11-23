/*

Flip-Flop D

reset: asincrono, activo por alto, con enable

*/

module flopr_e
    #(parameter N = 64) (
    input  logic         clk, reset,
    input  logic [N-1:0] d,
    input  logic         enable,
    output logic [N-1:0] q
);
    always_ff @(posedge clk, posedge reset)
    begin
        if (reset)       q <= '0;
        else if (enable) q <= d;
    end
    
endmodule