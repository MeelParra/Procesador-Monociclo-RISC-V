module tb_MUX1;

  logic [31:0] PC;
  logic [31:0] RUrs1;
  logic ALUASrc;
  
  logic [31:0] A;

  MUX1 uut (
    .PC(PC),
    .RUrs1(RUrs1),
    .ALUASrc(ALUASrc),
    .A(A)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_MUX1);

    // Inicializar entradas
    PC = 32'h00000001;  // Ejemplo de valor para PC
    RUrs1 = 32'h00000002;  // Ejemplo de valor para RUrs1
    ALUASrc = 0;  // Selecciona RUrs1
    #10;

    // Cambiar ALUASrc para seleccionar PC
    ALUASrc = 1;  
    #10;

    // Probar con otros valores
    RUrs1 = 32'h00000003;  // Cambiar RUrs1
    ALUASrc = 0;  // Seleccionar RUrs1
    #10;

    ALUASrc = 1;  // Seleccionar PC
    #10;
    $finish;
  end

endmodule