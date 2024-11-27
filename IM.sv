module IM(addrIM, inst);
  input logic [31:0] addrIM;
  output logic [31:0] inst;

  // Memoria para almacenar las instrucciones (1024 bytes, cada celda de 8 bits)
  logic [7:0] im [0:1023];
  
  initial begin  
    $readmemb("mem.txt", im);

    // Iterar a través de la memoria para mostrar su contenido agrupado en palabras de 32 bits
    for(int i = 0; i < $size(im); i = i + 4) begin
      // Combinar cuatro celdas de 8 bits para formar una palabra de 32 bits y mostrarla en consola
      $display("%d -->    %b", i, {im[i], im[i+1], im[i+2], im[i+3]});
    end
  end
  
  // Bloque siempre activo para leer instrucciones desde la memoria
  always @(*) begin
    // Combinar 4 bytes consecutivos a partir de la dirección dada para formar una instrucción de 32 bits
    inst <= {im[addrIM], im[addrIM + 1], im[addrIM + 2], im[addrIM + 3]};
  end
endmodule
