/*
-Practico 1
-Ejercicio 3

ALU (Unidad Aritmetica Logica)

flags: zero

*/
`include "macros.sv"

module alu (
	input  logic [63:0] a, b,
	input  logic [3:0]  ALUControl,
	output logic [63:0] result,
	output logic        zero
);

	always_comb
	begin
		case(ALUControl)
			`A_AND_B     : result = a & b;
			`A_OR_B      : result = a | b;
			`A_PLUS_B    : result = a + b;
			`A_MINUS_B   : result = a - b;
			`PASS_INPUT_B: result = b;
			`A_NOR_B     : result = ~(a | b);
			`MOVZ_B_00   : result = b << (2'b00 * 16);
			`MOVZ_B_01   : result = b << (2'b01 * 16);
			`MOVZ_B_10   : result = b << (2'b10 * 16);
			`MOVZ_B_11   : result = b << (2'b11 * 16);
			default      : result = 64'b0;
		endcase

		zero = result ? 1'b0 : 1'b1;
	end

endmodule