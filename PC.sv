//El módulo PC (Program Counter), o Contador de Programa mantiene la dirección de la próxima instrucción a ejecutar.

module PC(
  input logic CLK,
  input logic [31:0] NextPC,
  output reg [31:0] Pc=0);

  always @(posedge CLK) 
    Pc <= NextPC;
endmodule