module MUX3(
  input logic [31:0] Sumador, //resultado del sumador de 4 bits
  input logic [31:0] ALURes, //resultado de la ALU
  input logic NextPCSrc, //selector, sale del Branch Unit
  output logic [31:0] MUX3Res //resultado del Multiplexor 3
);

  always_comb begin 
    if (NextPCSrc == 0)
      MUX3Res = Sumador;
    else 
      MUX3Res = ALURes; 
  end
endmodule