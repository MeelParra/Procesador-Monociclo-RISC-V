//Registers Unit: Banco de registros, que contiene un conjunto de registros accesibles para almacenar valores temporales. Aquí, los operandos de la instrucción se leen y se escribe el resultado, si es necesario.

module RU(
  input logic CLK, 
  input logic [4:0] rs1, //direccion del 1er dato
  input logic [4:0] rs2, //direccion del 2do dato
  input logic [4:0] rd, //direccion destino
  input logic [31:0] DataWr, //dato que voy a guardar
  input logic RUWr, //habilitador 0=no guardar 1=guardar 
  
  output logic [31:0] RUrs1, //valor del dato guardado 
  output logic [31:0] RUrs2
);
  
  logic [31:0] RU [31:0];
  
  initial begin 
    $readmemb( "registros.txt", RU); // archivo y alias
  end
  
  assign RUrs1 = RU[rs1];
  assign RUrs2 = RU[rs2];
  
  always @( posedge CLK ) begin //flanco de subida
    if ( RUWr == 1 && rd != 0) begin
      RU[rd]= DataWr;
  end
    RU[0] = 32'b0; //32 ceros
 end

endmodule




