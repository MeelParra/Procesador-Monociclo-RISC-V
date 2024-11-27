module MUX2(
  input logic [31:0] ImmExt, 
  input logic [31:0] RUrs2,
  input logic ALUBSrc,
  output logic [31:0] B
);

  always_comb begin 
    if (ALUBSrc == 0)
      B = RUrs2;
    else 
      B = ImmExt; 
  end
endmodule