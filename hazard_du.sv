/* 
Data Hazard Detection Unit

*/

module hazard_du (
    input  logic [4:0] Instr_Ra1, Instr_Ra2,
    input  logic [4:0] ID_EX_Rd, EX_MEM_Rd, MEM_WB_Rd,
    input  logic       MEM_WB_MemRead,
    input  logic       ID_EX_RegWrite,
    input  logic       EX_MEM_RegWrite,
    output logic       PCWrite,
    output logic       IF_ID_Write,
    output logic       stall
);

    always_comb
        if (ID_EX_RegWrite & (ID_EX_Rd !== 5'd31) & (ID_EX_Rd == Instr_Ra1 | ID_EX_Rd == Instr_Ra2)) begin
            IF_ID_Write = 1'b0;
            PCWrite     = 1'b0;
            stall       = 1'b1;
        end

        else if (EX_MEM_RegWrite & (EX_MEM_Rd !== 5'd31) & (EX_MEM_Rd == Instr_Ra1 | EX_MEM_Rd == Instr_Ra2)) begin
            IF_ID_Write = 1'b0;
            PCWrite     = 1'b0;
            stall       = 1'b1;
        end

        else if (MEM_WB_MemRead & (MEM_WB_Rd !== 5'd31) & (MEM_WB_Rd == Instr_Ra1 | MEM_WB_Rd == Instr_Ra2)) begin
            IF_ID_Write = 1'b0;
            PCWrite     = 1'b0;
            stall       = 1'b1;
        end

        // No data hazard, normal work
        else begin
            IF_ID_Write = 1'b1;
            PCWrite     = 1'b1;
            stall       = 1'b0;
        end


endmodule