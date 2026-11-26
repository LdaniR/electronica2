#include <stdbool.h>
#include <stdint.h>

/*
Los archivos tipo .h en c se utilizan de cabecera (.h por header) sirven para conectar archivos .c y nos sirve de interfaz
para conectar la alu (.c) con el resto del programa

*/



enum Operaciones_e {
    OP_SUMA,
    OP_RESTA,
    OP_DESP_IZQ,
    OP_DESP_IZQ_ALT,
    OP_MENOR_C2,
    OP_MENOR_C2_ALT,
    OP_MENOR_BIN,
    OP_MENOR_BIN_ALT,
    OP_XOR,
    OP_DESP_DER_BIN,
    OP_DESP_DER_C2,
    OP_OR,
    OP_OR_ALT,
    OP_AND,
    OP_AND_ALT,
};
/**
 * @brief Calcula la salida de la unidad aritmética lógica según las entradas
 * dadas
 *
 * @param a Operando izquierdo
 * @param b Operando derecho
 * @param sel_fn Selector de operador
 * @param y Puntero a variable donde guardar el resultado
 * @param z Puntero a variable donde guardar la bandera de resultado igual a
 * cero
 */
void Alu_calcular(uint32_t a, uint32_t b, uint8_t sel_fn, uint32_t* y, bool* z);
