//ALU (Arithmetic Logic Unit): Unidad Aritmética Lógica, que realiza operaciones aritméticas y lógicas (suma, resta, AND, OR, etc.) según la instrucción. Es el núcleo del procesamiento de datos.


module ALU(
  input logic signed [31:0] A, 
  input logic signed [31:0] B,
  input logic [3:0] ALUOp, 
  output logic signed [31:0] ALURes
);
  always @(*) begin
    case (ALUOp)
      4'b0000: ALURes = A + B;  // Suma
      4'b1000: ALURes = A - B;  // Resta
      // Shift lógico a la izquierda  A = 0100 (4) B = 1 ALURes = 1000 (8)
      4'b0001: ALURes = A << B;
      4'b0010: ALURes = (A < B) ? 32'b1 : 32'b0;  // Comparación signed -3 < 2 ALURes = 1
      4'b0011: ALURes = ($unsigned(A) < $unsigned(B)) ? 32'b1 : 32'b0;  // Comparación unsigned
      4'b0100: ALURes = A ^ B;       // XOR A = 0101 B = 0011 ALURes = 0110 
      // Shift lógico a la derecha A = 0100 (4) B = 1 ALURes = 0010 (2)
      4'b0101: ALURes = A >> B[4:0];
      // Shift aritmético a la derecha A = 1111 1000 (-8) y B = 2 ALURes = 1111 1110 (-2), manteniendo el signo.
      4'b1101: ALURes = A >>> B[4:0];        
      4'b0110: ALURes = A | B;   	// OR
      4'b0111: ALURes = A & B;      // AND
      4'b1111: ALURes = B;          // Pasar B
      default: ALURes = 32'b0;      // Valor por defecto: 0
    endcase
  end
endmodule