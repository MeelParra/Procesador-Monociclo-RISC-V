`include "PC.sv"
`include "Sumador.sv"
`include "IM.sv"
`include "CU.sv"
`include "RU.sv"
`include "ImmGen.sv"
`include "MUX1.sv"
`include "MUX2.sv"
`include "MUX3.sv"
`include "MUX4.sv"
`include "BranchUnit.sv"
`include "ALU.sv"

module ProcesadorMonociclo(
  input logic CLK             // Señal de reloj
);

  // Declaración de señales internas
  logic [31:0] PC, NextPC, Inst, ImmExt, RUrs1, RUrs2;    // Señales para direcciones y datos
  logic [31:0] A, B, ALURes, MUX3Res, MUX4Res, Suma, DataRd; // Buses de datos internos
  logic ALUASrc, ALUBSrc, RUWr, NextPCSrc;               // Señales de control (booleanas)
  logic [4:0] BrOp;                                      // Operación de salto
  logic [1:0] RUDataWrSrc;                               // Control para datos de escritura en registros
  logic [3:0] ALUOp;                                     // Código de operación de la ALU
  logic [2:0] ImmSrc;                                    // Control para tipo de inmediato

  // Contador de Programa
  PC U0 (
    .CLK(CLK),
    .NextPC(MUX3Res),
    .Pc(PC)
  );

  // Sumador para PC + 4
  Sumador U1 (
    .PC(PC),
    .Suma(Suma)
  );

  // Memoria de Instrucciones
  IM U2 (
    .addrIM(PC),
    .inst(Inst)
  );

  // Unidad de Control
  CU U3 (
    .OpCode(Inst[6:0]),
    .Funct3(Inst[14:12]),
    .Funct7(Inst[31:25]),
    .ImmSrc(ImmSrc),
    .ALUASrc(ALUASrc),
    .ALUBSrc(ALUBSrc),
    .ALUOp(ALUOp),
    .RUDataWrSrc(RUDataWrSrc),
    .RUWr(RUWr),
    .BrOp(BrOp)
  );

  // Unidad de Registros
  RU U4 (
    .CLK(CLK),
    .rs1(Inst[19:15]),
    .rs2(Inst[24:20]),
    .rd(Inst[11:7]),
    .DataWr(MUX4Res),
    .RUWr(RUWr),
    .RUrs1(RUrs1),
    .RUrs2(RUrs2)
  );

  // Generador de Inmediatos
  ImmGen U5 (
    .Inst(Inst),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
  );

  // Multiplexor para entrada A de la ALU
  MUX1 U6 (
    .PC(PC),
    .RUrs1(RUrs1),
    .ALUASrc(ALUASrc),
    .A(A)
  );

  // Multiplexor para entrada B de la ALU
  MUX2 U7 (
    .ImmExt(ImmExt),
    .RUrs2(RUrs2),
    .ALUBSrc(ALUBSrc),
    .B(B)
  );

  // Unidad de Control de Saltos
  BranchUnit U8 (
    .RUrs1(RUrs1),
    .RUrs2(RUrs2),
    .BrOp(BrOp),
    .NextPCSrc(NextPCSrc)
  );

  // ALU
  ALU U9 (
    .A(A),
    .B(B),
    .ALUOp(ALUOp),
    .ALURes(ALURes)
  );

  // Multiplexor para determinar el próximo PC
  MUX3 U10 (
    .Sumador(Suma),
    .ALURes(ALURes),
    .NextPCSrc(NextPCSrc),
    .MUX3Res(MUX3Res)
  );

  // Simulación de Memoria de Datos (DataRd fijo a 0)
  assign DataRd = 32'h0;

  // Multiplexor para determinar el dato a escribir en los registros
  MUX4 U11 (
    .Sumador(Suma),
    .DataRd(DataRd),
    .ALURes(ALURes),
    .RUDataWrSrc(RUDataWrSrc),
    .MUX4Res(MUX4Res)
  );

endmodule


