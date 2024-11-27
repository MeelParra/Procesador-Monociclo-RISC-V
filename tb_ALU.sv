`timescale 1ns/1ps

module tb_ALU;

  logic signed [31:0] A;
  logic signed [31:0] B;
  logic [3:0] ALUOp;
  
  logic signed [31:0] ALURes;

  ALU uut (
    .A(A),
    .B(B),
    .ALUOp(ALUOp),
    .ALURes(ALURes)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_ALU);
  end

  initial begin
    $display("Time\t\tA (bin)\t\t\t\tB (bin)\t\t\t\tALUOp\t\tALURes (bin)");

    // Test 1: Suma
    A = 32'b00000000000000000000000000001010; // 10 en binario
    B = 32'b00000000000000000000000000000101; // 5 en binario
    ALUOp = 4'b0000;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 2: Resta
    A = 32'b00000000000000000000000000001010; // 10 en binario
    B = 32'b00000000000000000000000000000101; // 5 en binario
    ALUOp = 4'b1000;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 3: Shift lógico a la izquierda (SLL)
    A = 32'b00000000000000000000000000000001;
    B = 32'b00000000000000000000000000000010;
    ALUOp = 4'b0001;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 4: Comparación signed (A < B)
    A = 32'b00000000000000000000000000000101;
    B = 32'b00000000000000000000000000000001;
    ALUOp = 4'b0010;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 5: Comparación unsigned (A < B)
    A = 32'b00000000000000000000000000000001;
    B = 32'b11111111111111111111111111111111;
    ALUOp = 4'b0011;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 6: XOR
    A = 32'b00000000000000000000000000001010;
    B = 32'b00000000000000000000000000000101;
    ALUOp = 4'b0100;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 7: Shift lógico a la derecha (SRL)
    A = 32'b00000000000000000000000000010000;
    B = 32'b00000000000000000000000000000010;
    ALUOp = 4'b0101;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 8: Shift aritmético a la derecha (SRA)
    A = 32'b11110000000000000000000000000000;
    B = 32'b00000000000000000000000000000100;
    ALUOp = 4'b1101;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 9: OR
    A = 32'b00000000000000000000000000001010;
    B = 32'b00000000000000000000000000000101;
    ALUOp = 4'b0110;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 10: AND
    A = 32'b11111111111111111111111111111111;
    B = 32'b00001111000011110000111100001111;
    ALUOp = 4'b0111;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    // Test 11: Pasar B (mov)
    A = 32'b00000000000000000000000000000001;
    B = 32'b11111111111111111111111111111111;
    ALUOp = 4'b1111;
    #10 $display("%0t\t%b\t%b\t%b\t%b", $time, A, B, ALUOp, ALURes);

    $stop;
  end
endmodule

