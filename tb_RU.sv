module tb_RU;
  logic CLK;
  logic [4:0] rs1 = 0;
  logic [4:0] rs2;
  logic [4:0] rd;
  logic [31:0] DataWr;
  logic RUWr;
  logic [31:0] RUrs1;
  logic [31:0] RUrs2;
  
  RU RU( CLK, rs1, rs2, rd, DataWr, RUWr, RUrs1, RUrs2 );
  
  parameter PERIODO = 20;
 
  always begin
    CLK = 1'b0;
    #(PERIODO/2);
    CLK = 1'b1;
    #(PERIODO/2);
  end
  
  initial begin
    $dumpfile( "dump.vcd" );
    $dumpvars( 1 );
    rs1 = 0; rs2 = 0; rd = 0; DataWr = 12; RUWr = 1;
    #25 rs1 = 0; rs2 = 0; rd = 1; DataWr = 32; RUWr = 1;
    #20 rs1 = 0; rs2 = 0; rd = 2; DataWr = 22; RUWr = 1;
   // #20 rs1 = 0; rs2 = 0; rd = 3; DataWr = 14; RUWr = 1;
   // #20 rs1 = 0; rs2 = 0; rd = 4; DataWr = 23; RUWr = 1;
   // #20 rs1 = 0; rs2 = 0; rd = 5; DataWr = 6; RUWr = 1;
    
    #20 rs1 = 0; rs2 = 1; rd =0; DataWr = 0; RUWr = 0;
    #20 rs1 = 2; rs2 = 3; rd =0; DataWr = 0; RUWr = 0;
    //#20 rs1 = 4; rs2 = 5; rd =0; DataWr = 0; RUWr = 0;
    #20 $finish;
  end
  
endmodule
