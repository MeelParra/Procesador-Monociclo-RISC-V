//Branch Unit: Unidad de ramificación que determina si se debe realizar un salto condicional o no, basándose en los valores de los registros y la señal de control de ramificación (BrOp).

module BranchUnit(
  input signed [31:0] RUrs2,
  input signed [31:0] RUrs1,
  input [4:0] BrOp,
  output reg NextPCSrc
);
  
  always @* begin
    case (BrOp)
      5'b00000: NextPCSrc = 0;
      5'b10000: NextPCSrc = 1; 
      5'b01000: NextPCSrc = (RUrs2 == RUrs1); // BEQ (=)
      5'b01001: NextPCSrc = (RUrs2 != RUrs1); // BNE (x=)
      5'b01100: NextPCSrc = ($signed(RUrs2) < $signed(RUrs1));  // BLT signed (menor que)
      5'b01101: NextPCSrc = ($signed(RUrs2) >= $signed(RUrs1)); // BGE signed (mayor o igual que)
      5'b01110: NextPCSrc = ($unsigned(RUrs2) < $unsigned(RUrs1));  // BLTU unsigned (menor que (U)) 
      5'b01111: NextPCSrc = ($unsigned(RUrs2) >= $unsigned(RUrs1)); // BGEU unsigned (mayor o igual que (U))
      default: NextPCSrc = 0;
    endcase
  end
  
endmodule
