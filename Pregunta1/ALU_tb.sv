module alu_tb;

    // Declarar señales de entrada y salida
    logic [3:0] a, b;                         
    logic [3:0] alu_op;                       
    logic [3:0] result;                     
    logic N, Z, C, V;							

    // Declarar señales esperadas para la comprobación
    logic [3:0] expected_result;             
    logic expected_N, expected_Z, expected_C, expected_V;
    string operation_name;

    // Instancia del módulo ALU
    alu uut (
        .a(a),
        .b(b),
        .opcode(alu_op),                     
        .result(result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );

    // Procedimiento de prueba
    initial begin
        $display("======================================");
        $display("   INICIO DE LA SIMULACION DE LA ALU  ");
        $display("======================================");

        // Prueba de suma
        operation_name = "Suma";
        a = 4'b0011; b = 4'b0010; alu_op = 4'b0000;
        expected_result = 4'b0101;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b1100; b = 4'b0100; alu_op = 4'b0000;
        expected_result = 4'b0000;  
        expected_N = 0; expected_Z = 1; expected_C = 1; expected_V = 0;
        #10;
        check_result();

        // Prueba de resta
        operation_name = "Resta";
        a = 4'b0111; b = 4'b0011; alu_op = 4'b0001;
        expected_result = 4'b0100;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b0010; b = 4'b0100; alu_op = 4'b0001;
        expected_result = 4'b1110;
        expected_N = 1; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        // Prueba de multiplicación
        operation_name = "Multiplicación";
        a = 4'b0010; b = 4'b0011; alu_op = 4'b0010;
        expected_result = 4'b0110;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b0110; b = 4'b0010; alu_op = 4'b0010;
        expected_result = 4'b1100;
        expected_N = 1; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        // Prueba de AND
        operation_name = "AND";
        a = 4'b1111; b = 4'b1110; alu_op = 4'b0101;
        expected_result = 4'b1110;
        expected_N = 1; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b1010; b = 4'b0101; alu_op = 4'b0101;
        expected_result = 4'b0000;
        expected_N = 0; expected_Z = 1; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        // Prueba de OR
        operation_name = "OR";
        a = 4'b1111; b = 4'b0000; alu_op = 4'b0110;
        expected_result = 4'b1111;
        expected_N = 1; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b0001; b = 4'b0010; alu_op = 4'b0110;
        expected_result = 4'b0011;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        // Prueba de XOR
        operation_name = "XOR";
        a = 4'b1100; b = 4'b0011; alu_op = 4'b0111;
        expected_result = 4'b1111;
        expected_N = 1; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b1010; b = 4'b1010; alu_op = 4'b0111;
        expected_result = 4'b0000;
        expected_N = 0; expected_Z = 1; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        // Prueba de shift left
        operation_name = "Shift Left";
        a = 4'b0001; b = 4'b0010; alu_op = 4'b1000;
        expected_result = 4'b0100;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b1000; b = 4'b0001; alu_op = 4'b1000;
        expected_result = 4'b0000;
        expected_N = 0; expected_Z = 1; expected_C = 1; expected_V = 0;
        #10;
        check_result();

        // Prueba de shift right
        operation_name = "Shift Right";
        a = 4'b1000; b = 4'b0010; alu_op = 4'b1001;
        expected_result = 4'b0010;
        expected_N = 0; expected_Z = 0; expected_C = 0; expected_V = 0;
        #10;
        check_result();

        a = 4'b1010; b = 4'b0001; alu_op = 4'b1001;
        expected_result = 4'b0101;
        expected_N = 0; expected_Z = 0; expected_C = 1; expected_V = 0;
        #10;
        check_result();

        $display("======================================");
        $display("   FIN DE LA SIMULACION DE LA ALU  ");
        $display("======================================");
        $finish;
    end

    // Tarea para verificar e imprimir los resultados
    task check_result;
        begin
            $display("\nOperacion: %s | alu_op = %b | a = %b | b = %b", 
                     operation_name, alu_op, a, b);
            $display("Esperado: result = %b | N = %b | Z = %b | C = %b | V = %b", 
                     expected_result, expected_N, expected_Z, expected_C, expected_V);
            $display("Obtenido: result = %b | N = %b | Z = %b | C = %b | V = %b", 
                     result, N, Z, C, V);

            if (result !== expected_result) $display("Error: resultado incorrecto!");
            if (N !== expected_N) $display("Error: bandera N incorrecta!");
            if (Z !== expected_Z) $display("Error: bandera Z incorrecta!");
            if (C !== expected_C) $display("Error: bandera C incorrecta!");
            if (V !== expected_V) $display("Error: bandera V incorrecta!");
        end
    endtask

endmodule
