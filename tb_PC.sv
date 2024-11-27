module tb_PC;
  reg CLK;
  reg [31:0] NextPC;
  wire [31:0] Pc;

  PC pc_inst(
    .CLK(CLK),
    .NextPC(NextPC),
    .Pc(Pc)
  );

    parameter PERIODO = 10;
 
  always begin
    CLK = 1'b0;
    #(PERIODO/2);
    CLK = 1'b1;
    #(PERIODO/2);
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_PC); 

  
    NextPC = 32'h00000000;
    #10;
    
    NextPC = 32'h00000004;
    #10;

    NextPC = 32'h00000008;
    #10;

    NextPC = 32'h0000000C;
    #10;
    
    $finish;
  end
endmodule