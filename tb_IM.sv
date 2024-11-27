`timescale 1ns/1ps

module IM_tb;

  // Inputs
  logic [31:0] addrIM;

  // Outputs
  logic [31:0] inst;

  // Instantiate the Unit Under Test (UUT)
  IM uut (
    .addrIM(addrIM),
    .inst(inst)
  );

  // Testbench procedure
  initial begin
    // Encabezado de la tabla
    $display("Time\taddrIM\t\tinst");

    // Test 1: Leer desde la dirección 0
    addrIM = 0;
    #10 $display("%0t\t%0d\t\t%b", $time, addrIM, inst);

    // Test 2: Leer desde la dirección 4
    addrIM = 4;
    #10 $display("%0t\t%0d\t\t%b", $time, addrIM, inst);

    // Test 3: Leer desde la dirección 8
    addrIM = 8;
    #10 $display("%0t\t%0d\t\t%b", $time, addrIM, inst);

    // Test 4: Leer desde la dirección 12
    addrIM = 12;
    #10 $display("%0t\t%0d\t\t%b", $time, addrIM, inst);

    // Test 5: Leer desde la dirección 16
    addrIM = 16;
    #10 $display("%0t\t%0d\t\t%b", $time, addrIM, inst);

    // Fin de la simulación
    $stop;
  end

  // Inicialización para generar el archivo VCD
  initial begin
    $dumpfile("IM_tb.vcd");  // Nombre del archivo VCD
    $dumpvars(0, IM_tb);     // Dump de todas las señales del módulo
  end
endmodule
