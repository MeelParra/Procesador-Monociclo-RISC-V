//Sumador: Suma la dirección del PC con 4 para obtener la dirección de la siguiente instrucción, permitiendo la ejecución secuencial del programa.

module Sumador(
  input logic [31:0] PC,       // Entrada: valor actual del PC
  output logic [31:0] Suma     // Salida: valor del PC + 4
);

  always_comb begin
    Suma = PC + 32'd4;         // Incrementa el PC en 4   
    						   //d: decimal
                               // h para hexadecimal.
                               // b para binario.

  end

endmodule