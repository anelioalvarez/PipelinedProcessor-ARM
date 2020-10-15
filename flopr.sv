/*
-Practico 1
-Ejercicio 1

Flip-Flop D

reset: asincrono, activo por alto

*/

module flopr
	#(parameter N = 64) (
	input  logic         clk, reset,
	input  logic [N-1:0] d,
	output logic [N-1:0] q
);
	always_ff @(posedge clk, posedge reset)
	begin
		if (reset) q <= '0; // FF is reset
		else       q <= d;
	end
endmodule