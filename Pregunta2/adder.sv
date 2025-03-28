module adder #(
    parameter WIDTH = 4  // Parámetro para definir el ancho de los buses (por defecto es 4 bits)
)(
    input logic [WIDTH-1:0] a, b,          // Entradas de WIDTH bits (operandos a sumar)
    output logic [WIDTH-1:0] result,       // Salida de WIDTH bits (resultado de la suma)
    output logic carry,                    // Salida de acarreo (indica si hubo un acarreo en la suma)
    output logic overflow                  // Salida de desbordamiento (indica si hubo un desbordamiento en la suma)
);

    // Señales internas
    logic [WIDTH-1:0] carry_out;           // Acarreos intermedios para cada bit
    logic cin;                             // Acarreo de entrada para el primer bit

    // Inicializar el acarreo de entrada (cin) a 0 para el primer bit
    assign cin = 1'b0; // No carry-in para el primer bit

    // Generación de sumadores completos (full_adder) para cada bit
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : adder_block // Iteraciones parametrizadas
            if (i == 0) begin
                // Primer bit: el acarreo de entrada es cin (0)
                full_adder fa (
                    .a(a[i]),              // Bit i del operando a
                    .b(b[i]),              // Bit i del operando b
                    .cin(cin),            // Acarreo de entrada (0 para el primer bit)
                    .sum(result[i]),      // Bit i del resultado
                    .cout(carry_out[i])   // Acarreo de salida para el bit i
                );
            end else begin
                // Bits restantes: el acarreo de entrada es el acarreo de salida del bit anterior
                full_adder fa (
                    .a(a[i]),              // Bit i del operando a
                    .b(b[i]),              // Bit i del operando b
                    .cin(carry_out[i-1]), // Acarreo de entrada (acarreo del bit anterior)
                    .sum(result[i]),      // Bit i del resultado
                    .cout(carry_out[i])   // Acarreo de salida para el bit i
                );
            end
        end
    endgenerate

    // Asignar el acarreo final (último bit del acarreo intermedio)
    assign carry = carry_out[WIDTH-1]; // Último bit parametrizado

    // Calcular el desbordamiento (overflow)
    // El desbordamiento ocurre si los bits más significativos de a y b son iguales,
    // pero el bit más significativo del resultado es diferente.
    assign overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);

endmodule