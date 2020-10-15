/*
-Practico 1
-Ejercicio 2

Extension de Signo del Inmediato

*/
`include "macros.sv"

module signext (
	input  logic [31:0] a,
	output logic [63:0] y
);
	
	always_comb
	begin
		casez(a[31:21]) // take 11 bits most significant (opcode)
			`LDUR  : y = {{55{a[20]}}, a[20:12]}; // [D]
			`STUR  : y = {{55{a[20]}}, a[20:12]}; // [D]
			`CBZ   : y = {{45{a[23]}}, a[23:5]};  // [CB]
			`ADDI  : y = {52'b0, a[21:10]};       // [I]  unsigned!
			`ANDI  : y = {52'b0, a[21:10]};       // [I]  unsigned!
			`ORRI  : y = {52'b0, a[21:10]};       // [I]  unsigned!
			`SUBI  : y = {52'b0, a[21:10]};       // [I]  unsigned!
			`MOVZ  : y = {48'b0, a[20:5]};        // [IM] unsigned!
			default: y = 64'b0;                   // [R]  not Immediate
		endcase
	end
		
endmodule