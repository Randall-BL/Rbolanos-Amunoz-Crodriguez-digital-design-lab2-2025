module frequency_measurement #(
    parameter WIDTH = 4  // Ancho de los operandos y resultados
)(
    input logic clk,                // Reloj del sistema
    input logic reset,              // Reset del sistema
    input logic [WIDTH-1:0] a, b,   // Entradas para la ALU
    input logic [3:0] opcode,       // Código de operación para la ALU
    output logic [WIDTH-1:0] result,// Resultado de la ALU
    output logic N, Z, C, V         // Banderas de la ALU
);
