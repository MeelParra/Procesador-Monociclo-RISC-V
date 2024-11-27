module CU(
    input [6:0] OpCode,    
    input [2:0] Funct3,  
    input [6:0] Funct7, 
  	output reg [2:0] ImmSrc, //Determina qué tipo de inmediato
    output reg ALUASrc,
    output reg ALUBSrc,       
 	output reg [3:0] ALUOp,  //Indica la operación que debe realizar la ALU
 	output reg [1:0] RUDataWrSrc, //Fuente de datos para escribir en registros
    output reg RUWr,  //Habilita la escritura en el banco de registros.
 	output reg [4:0] BrOp  //Controla operaciones de ramas y saltos.
);

always @(*) begin
    // Valores por defecto para evitar latches
    ImmSrc = 3'b000;
    ALUASrc = 1'b0;
    ALUBSrc = 1'b0;
    ALUOp = 4'b0000;
    RUDataWrSrc = 2'b00;
    RUWr = 1'b0;
    BrOp = 5'b00000;

    case (OpCode)
        7'b0110011: begin // Tipo R
            ImmSrc = 3'b000;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b0;
            ALUOp = {Funct7[5], Funct3};
            RUDataWrSrc = 2'b00;
            RUWr = 1'b1;
            BrOp = 5'b00000;
        end

        7'b0010011: begin // Tipo I (inmediato aritmético y lógico)
            ImmSrc = 3'b000;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b1;
            ALUOp = (Funct3 == 3'b101) ? {Funct7[5], Funct3} : {1'b0, Funct3};
            RUDataWrSrc = 2'b00;
            RUWr = 1'b1;
            BrOp = 5'b00000;
        end

        7'b1100011: begin // Tipo B (ramas condicionales)
            ImmSrc = 3'b101;
            ALUASrc = 1'b1;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000; // Comparaciones típicas
            RUDataWrSrc = 2'b00;
            RUWr = 1'b0;
            BrOp = {2'b01, Funct3};
        end

        7'b0000011: begin // Tipo I (cargas)
            ImmSrc = 3'b000;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000; // Suma para calcular dirección
            RUDataWrSrc = 2'b01;
            RUWr = 1'b1;
            BrOp = 5'b00000;
        end

        7'b0100011: begin // Tipo S (almacenamiento)
            ImmSrc = 3'b001;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000; // Suma para calcular dirección
            RUDataWrSrc = 2'b00;
            RUWr = 1'b0;
            BrOp = 5'b00000;
        end

        7'b1100111: begin // Tipo I (JALR)
            ImmSrc = 3'b000;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000;
            RUDataWrSrc = 2'b10;
            RUWr = 1'b1;
            BrOp = 5'b10000;
        end

        7'b1101111: begin // JAL
            ImmSrc = 3'b110;
            ALUASrc = 1'b1;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000;
            RUDataWrSrc = 2'b10;
            RUWr = 1'b1;
            BrOp = 5'b10000;
        end

        7'b0110111: begin // LUI
            ImmSrc = 3'b010;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b1;
            ALUOp = 4'b1111; // Lógica para LUI
            RUDataWrSrc = 2'b00;
            RUWr = 1'b1;
            BrOp = 5'b00000;
        end

        7'b0010111: begin // AUIPC
            ImmSrc = 3'b010;
            ALUASrc = 1'b1;
            ALUBSrc = 1'b1;
            ALUOp = 4'b0000;
            RUDataWrSrc = 2'b10;
            RUWr = 1'b1;
            BrOp = 5'b00000;
        end

        default: begin // Caso por defecto
            ImmSrc = 3'b000;
            ALUASrc = 1'b0;
            ALUBSrc = 1'b0;
            ALUOp = 4'b0000;
            RUDataWrSrc = 2'b00;
            RUWr = 1'b0;
            BrOp = 5'b00000;
        end
    endcase
end

endmodule