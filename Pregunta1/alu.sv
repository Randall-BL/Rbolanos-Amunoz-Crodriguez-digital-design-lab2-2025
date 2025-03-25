module alu #(
    parameter WIDTH = 4  // Parámetro para definir el ancho de los buses (por defecto es 4 bits)
)(
    input logic [WIDTH-1:0] a, b,                // Entradas de WIDTH bits (operandos)
    input logic [WIDTH-1:0] opcode,              // Código de operación de WIDTH bits
    output logic [WIDTH-1:0] result,             // Resultado de WIDTH bits
    output logic N, Z, C, V                      // Banderas de estado (Negativo, Cero, Acarreo, Desbordamiento)
);

    // Señales internas para almacenar resultados parciales
    logic [WIDTH-1:0] sum, diff, prod;           // Resultados de suma, resta y multiplicación
    logic [WIDTH-1:0] and_res, or_res, xor_res;  // Resultados de operaciones lógicas
    logic [WIDTH-1:0] shl_res, shr_res;          // Resultados de desplazamientos
    logic carry_out, overflow_sum, overflow_diff; // Acarreo y desbordamiento de suma y resta

    // Instancias de módulos estructurales
    // Sumador
    adder #(.WIDTH(WIDTH)) add_unit(
        .a(a),
        .b(b),
        .result(sum),               // Resultado de la suma
        .carry(carry_out),          // Acarreo de salida
        .overflow(overflow_sum)     // Desbordamiento de la suma
    );

    // Restador
    subtractor #(.WIDTH(WIDTH)) sub_unit(
        .a(a),
        .b(b),
        .result(diff),              // Resultado de la resta
        .borrow(),                  // No se usa el borrow en este contexto
        .overflow(overflow_diff)    // Desbordamiento de la resta
    );

    // Multiplicador
    multiplier #(.WIDTH(WIDTH)) mul_unit(
        .a(a),
        .b(b),
        .result(prod)               // Resultado de la multiplicación
    );

    // Operaciones lógicas y desplazamientos
    assign and_res = a & b;         // Operación AND bit a bit
    assign or_res = a | b;          // Operación OR bit a bit
    assign xor_res = a ^ b;         // Operación XOR bit a bit
    assign shl_res = a << b[$clog2(WIDTH)-1:0];  // Desplazamiento a la izquierda (shift left)
    assign shr_res = a >> b[$clog2(WIDTH)-1:0];  // Desplazamiento a la derecha (shift right)

    // Operaciones de división y módulo (comentadas o eliminadas si no se usan)
    // assign quotient = b != 0 ? a / b : {WIDTH{1'b0}};  // División (protección contra división por cero)
    // assign remainder = b != 0 ? a % b : {WIDTH{1'b0}}; // Módulo (protección contra división por cero)

    // Selección de la operación basada en el opcode
    always_comb begin
        case (opcode)
            4'b0000: result = sum;          // Suma
            4'b0001: result = diff;         // Resta
            4'b0010: result = prod;         // Multiplicación
            4'b0101: result = and_res;      // AND
            4'b0110: result = or_res;       // OR
            4'b0111: result = xor_res;      // XOR
            4'b1000: result = shl_res;      // Shift left
            4'b1001: result = shr_res;      // Shift right
            default: result = 4'b0000;      // Default (resultado 0 si el opcode no coincide)
        endcase
    end

    // Cálculo de banderas de estado
    assign N = result[WIDTH-1];             // Bandera Negativo: 1 si el bit más significativo es 1
    assign Z = (result == {WIDTH{1'b0}});   // Bandera Cero: 1 si el resultado es 0

    // Bandera de acarreo (C)
    assign C = (opcode == 4'b0000) ? carry_out :           // Acarreo para Suma
               (opcode == 4'b1000) ? a[WIDTH-1] :          // Acarreo para Shift Left (bit más significativo de a)
               (opcode == 4'b1001) ? a[0] : 1'b0;          // Acarreo para Shift Right (bit menos significativo de a)

    // Bandera de desbordamiento (V)
    assign V = (opcode == 4'b0000) ? overflow_sum :        // Desbordamiento para Suma
               (opcode == 4'b0001) ? overflow_diff : 1'b0; // Desbordamiento para Resta

endmodule