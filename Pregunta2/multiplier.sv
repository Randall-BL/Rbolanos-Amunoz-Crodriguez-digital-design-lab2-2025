module multiplier #(
    parameter WIDTH = 4  // Parámetro para definir el ancho de los buses (por defecto es 4 bits)
)(
    input logic [WIDTH-1:0] a, b,              // Entradas de WIDTH bits (multiplicando y multiplicador)
    output logic [WIDTH-1:0] result            // Resultado de WIDTH bits (producto)
);

    // Señales internas
    logic [(2*WIDTH)-1:0] partial_sum[WIDTH-1:0]; // Sumas parciales de 2*WIDTH bits
    logic [(2*WIDTH)-1:0] product;               // Producto final de 2*WIDTH bits

    // Instancias de partial_multiplier parametrizadas
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : partial_multipliers
            // Instancia de partial_multiplier para cada bit del multiplicador (b)
            partial_multiplier #(.WIDTH(WIDTH)) pm (
                .a(a),                          // Multiplicando (a)
                .b(b[i]),                       // Bit i del multiplicador (b)
                .shift(i),                      // Desplazamiento según la posición del bit
                .result(partial_sum[i])         // Resultado parcial de la multiplicación
            );
        end
    endgenerate

    // Suma de los resultados parciales
    always_comb begin
        product = '0;  // Inicializar el producto a 0
        for (int j = 0; j < WIDTH; j = j + 1) begin
            // Acumular las sumas parciales para obtener el producto final
            product = product + partial_sum[j];
        end
        // Tomar solo los primeros WIDTH bits del producto final
        result = product[WIDTH-1:0];
    end

endmodule