module tb_MUX2;

  logic [31:0] ImmExt;
  logic [31:0] RUrs2;
  logic ALUBSrc;
  logic [31:0] B;

  // Instanciar el módulo MUX2
  MUX2 uut (
    .ImmExt(ImmExt),
    .RUrs2(RUrs2),
    .ALUBSrc(ALUBSrc),
    .B(B)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_MUX2);

    // Inicializar entradas
    ImmExt = 32'h00000005;  // Ejemplo de valor para ImmExt
    RUrs2 = 32'h00000010;    // Ejemplo de valor para RUrs2
    ALUBSrc = 0;             // Selecciona RUrs2

    #10;
    ALUBSrc = 1;  
    
    #10;

    // Probar con otros valores
    RUrs2 = 32'h00000020;    // Cambiar RUrs2
    ALUBSrc = 0;             // Seleccionar RUrs2
    #10;

    ALUBSrc = 1;             // Seleccionar ImmExt
    #10;
    $finish;
  end

endmodule
