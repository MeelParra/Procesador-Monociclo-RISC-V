module tb_MUX4;
  
  logic [31:0] Sumador;
  logic [31:0] DataRd;
  logic [31:0] ALURes;
  logic [1:0] RUDataWrSrc;

  logic [31:0] MUX4Res;

  MUX4 uut (
    .Sumador(Sumador),
    .DataRd(DataRd),
    .ALURes(ALURes),
    .RUDataWrSrc(RUDataWrSrc),
    .MUX4Res(MUX4Res)
  );

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_MUX4);   
  end


  initial begin
    
    Sumador = 32'h00000A; 
    DataRd = 32'h00000B; 
    ALURes = 32'h00000C; 
    
    // Test 1: RUDataWrSrc = 2'b00 (Debe seleccionar ALURes)
    RUDataWrSrc = 2'b00;
    #10;  
    
    
    // Test 2: RUDataWrSrc = 2'b01 (Debe seleccionar DataRd)
    RUDataWrSrc = 2'b01;
    #10;
    

    // Test 3: RUDataWrSrc = 2'b10 (Debe seleccionar Sumador)
    RUDataWrSrc = 2'b10;
    #10;
  

    // Test 4: RUDataWrSrc = 2'b11 (Debe devolver el valor por defecto)
    RUDataWrSrc = 2'b11;
    #10;
 
    $stop;  
  end

endmodule
