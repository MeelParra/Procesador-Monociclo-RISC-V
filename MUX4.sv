module MUX4(
  input logic [31:0] Sumador,   // Resultado del sumador de 4 bits
  input logic [31:0] DataRd,    // Resultado de Data Memory
  input logic [31:0] ALURes,    // Resultado de la ALU
  input logic [1:0] RUDataWrSrc,  // Selector: 2'b00, 2'b01, 2'b10
  output logic [31:0] MUX4Res   // Resultado del MUX4 (DataWr)
);

  always_comb begin 
    case (RUDataWrSrc)
      2'b00: MUX4Res = ALURes;     // Selección ALU
      2'b01: MUX4Res = DataRd;     // Selección Data Memory
      2'b10: MUX4Res = Sumador;    // Selección Sumador
      default: MUX4Res = 32'b0;    // Valor por defecto
    endcase
  end
endmodule
