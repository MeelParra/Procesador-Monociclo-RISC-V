`timescale 1ns / 1ps

module ControlUnit_tb;

    // Entradas
    reg [6:0] OpCode;
    reg [2:0] Funct3;
    reg [6:0] Funct7;

    // Salidas
    wire [2:0] ImmSrc;
    wire ALUASrc;
    wire ALUBSrc;
    wire [3:0] ALUOp;
    wire [1:0] RUDataWrSrc;
    wire RUWr;
    wire [4:0] BrOp;

    ControlUnit uut (
        .OpCode(OpCode),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .ImmSrc(ImmSrc),
        .ALUASrc(ALUASrc),
        .ALUBSrc(ALUBSrc),
        .ALUOp(ALUOp),
        .RUDataWrSrc(RUDataWrSrc),
        .RUWr(RUWr),
        .BrOp(BrOp)
    );

    // Archivo VCD para guardar la simulación
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ControlUnit_tb);
    end

    initial begin
        // Configuración de la simulación
        $display("Inicio de la prueba de la Unidad de Control");
        $monitor("OpCode=%b, Funct3=%b, Funct7=%b -> ImmSrc=%b, ALUASrc=%b, ALUBSrc=%b, ALUOp=%b, RUDataWrSrc=%b, RUWr=%b, BrOp=%b", 
                 OpCode, Funct3, Funct7, ImmSrc, ALUASrc, ALUBSrc, ALUOp, RUDataWrSrc, RUWr, BrOp);

        // Prueba para una instrucción tipo R (ej. add)
        $display("Prueba de instrucción tipo R (add)");
        OpCode = 7'b0110011; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción tipo I (ej. addi)
        $display("Prueba de instrucción tipo I (addi)");
        OpCode = 7'b0010011; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción tipo B (ej. beq)
        $display("Prueba de instrucción tipo B (beq)");
        OpCode = 7'b1100011; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción tipo I de carga (ej. lw)
        $display("Prueba de instrucción tipo I de carga (lw)");
        OpCode = 7'b0000011; Funct3 = 3'b010; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción tipo S (ej. sw)
        $display("Prueba de instrucción tipo S (sw)");
        OpCode = 7'b0100011; Funct3 = 3'b010; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción tipo I (JALR)
        $display("Prueba de instrucción tipo I (JALR)");
        OpCode = 7'b1100111; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para una instrucción JAL
        $display("Prueba de instrucción JAL");
        OpCode = 7'b1101111; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para LUI
        $display("Prueba de instrucción LUI");
        OpCode = 7'b0110111; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Prueba para AUIPC
        $display("Prueba de instrucción AUIPC");
        OpCode = 7'b0010111; Funct3 = 3'b000; Funct7 = 7'b0000000;
        #10;

        // Fin de la simulación
        $display("Fin de la prueba de la Unidad de Control");
        $stop;
    end

endmodule