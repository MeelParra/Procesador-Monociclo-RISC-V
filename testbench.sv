module Testbench;

  // Declaración de señales
  logic CLK;
  ProcesadorMonociclo procesador(CLK);

  // Generador de reloj
  always #20 CLK = ~CLK; // Genera un pulso de reloj con un periodo de 10 unidades de tiempo

  // Inicialización
  initial begin

    $dumpfile("dump.vcd");       // Nombre del archivo VCD
    $dumpvars(0, Testbench);     // Niveles de jerarquía a rastrear

    // Inicialización de señales
    CLK = 0;
    
    // Simulación durante 1000 unidades de tiempo
    #1000; 
    $finish;
  end

endmodule


