module tb_Sumador;

  logic [31:0] PC;      // Entrada del sumador (PC)
  logic [31:0] Suma;    // Salida del sumador (PC + 4)

  // Instancia del módulo Sumador
  Sumador uut (
    .PC(PC),
    .Suma(Suma)
  );


  initial begin
    $dumpfile("dump.vcd");     // Nombre del archivo VCD
    $dumpvars(0, Sumador_tb);  // Volcar todas las señales del módulo Sumador_tb
  end

  initial begin
    
    // Test 1: PC = 0
    PC = 32'h00000000;
    #10; 

    // Test 2: PC = 4
    PC = 32'h00000004;
    #10;

    // Test 3: PC = 8
    PC = 32'h00000008;
    #10;

    $stop;
  end

endmodule