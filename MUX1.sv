module MUX1(
  input logic [31:0] PC, 
  input logic [31:0] RUrs1,
  input logic ALUASrc,
  output logic [31:0] A
);


  always_comb begin 
  
  if (ALUASrc == 0)
    A = RUrs1;
  else 
    A = PC; 
 
  end
endmodule