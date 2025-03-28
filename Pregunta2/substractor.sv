module subtractor #(
    parameter WIDTH = 4  // Parámetro para definir el ancho de los buses (por defecto es 4 bits)
)(
    input logic [WIDTH-1:0] a, b,             // Entradas de WIDTH bits (minuendo y sustraendo)
    output logic [WIDTH-1:0] result,          // Resultado de WIDTH bits (diferencia)
    output logic borrow,                      // Bandera de préstamo (borrow)
    output logic overflow                     // Bandera de desbordamiento (overflow)
);

    // Señales internas
    logic [WIDTH-1:0] b_complement;           // Complemento a 2 de b
    logic [WIDTH-1:0] sum_result;             // Resultado de la suma (a + complemento a 2 de b)
    logic carry_out;                          // Acarreo de salida de la suma

    // Calcular el complemento a 1 de b
    logic [WIDTH-1:0] b_not;
    assign b_not = ~b;                        // Complemento a 1 de b (inversión bit a bit)

    // Sumar 1 al complemento a 1 para obtener el complemento a 2 de b
    adder #(.WIDTH(WIDTH)) add_1_to_complement (
        .a(b_not),                            // Complemento a 1 de b
        .b({{WIDTH-1{1'b0}}, 1'b1}),          // Sumar 1 (constante de 1 bit con ancho parametrizable)
        .result(b_complement),                // Complemento a 2 de b
        .carry(),                             // No se usa el acarreo en este contexto
        .overflow()                           // No se usa el desbordamiento en este contexto
    );

    // Sumar a y el complemento a 2 de b para obtener el resultado de la resta
    adder #(.WIDTH(WIDTH)) subtract_add (
        .a(a),                                // Minuendo (a)
        .b(b_complement),                     // Complemento a 2 del sustraendo (b)
        .result(result),                      // Resultado de la resta
        .carry(carry_out),                    // Acarreo de salida
        .overflow(overflow)                   // Desbordamiento de la resta
    );

    // Calcular la bandera de préstamo (borrow)
    assign borrow = ~carry_out;               // El préstamo es el inverso del acarreo de salida

endmodule