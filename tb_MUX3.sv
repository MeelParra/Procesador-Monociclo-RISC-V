module tb_MUX3;
  reg [31:0] Sumador;
  reg [31:0] ALURes;
  reg NextPCSrc;
  wire [31:0] MUX3Res;

  MUX3 mux3_inst (
    .Sumador(Sumador),
    .ALURes(ALURes),
    .NextPCSrc(NextPCSrc),
    .MUX3Res(MUX3Res)
  );
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_MUX3);  

    Sumador = 32'h00000004;
    ALURes = 32'h00000008;
    NextPCSrc = 0;
    #10; 

    NextPCSrc = 1;
    #10;

    Sumador = 32'h0000000C;
    ALURes = 32'h00000010;
    NextPCSrc = 0;
    #10;

    NextPCSrc = 1;
    #10;
    $finish;
  end
endmodule

