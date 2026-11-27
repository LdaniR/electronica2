#include <stdbool.h>        // habilita los tipos de datos booleanos
#include <stdint.h>         // uint

/*
Los archivos tipo .h en c se utilizan de cabecera (.h por header) sirven para conectar archivos .c y nos sirve de interfaz
para conectar la alu (.c) con el resto del programa

*/

// Con datos tipo uint me aseguro que cualquier compilador o computadora entienda al ancho de 32 bits como un entero
// sin signo de 32 bits de tamaño.

/*
En C las enumeraciones empiezan con un valor decimal de cero y hacia abajo aumentan.
*/

enum Operaciones_e {
    OP_SUMA,                 //0
    OP_RESTA,
    OP_DESP_IZQ,
    OP_DESP_IZQ_ALT,
    OP_MENOR_C2,
    OP_MENOR_C2_ALT,
    OP_MENOR_BIN,
    OP_MENOR_BIN_ALT,
    OP_XOR,
    OP_XOR_ALT,             // La agregue yo
    OP_DESP_DER_BIN,
    OP_DESP_DER_C2,
    OP_OR,
    OP_OR_ALT,
    OP_AND,
    OP_AND_ALT,             // 15
};
/**
 * @brief Calcula la salida de la unidad aritmética lógica según las entradas
 * dadas
 *
 * @param a Operando izquierdo
 * @param b Operando derecho
 * @param sel_fn Selector de operador
 * @param y Puntero a variable donde guardar el resultado
 * @param z Puntero a variable donde guardar la bandera de resultado igual a cero
 *
 */

 // No hay uint de 4 bits por lo tanto sel_fn tiene el menor posible. :(
 // La FPGA trabaja a 32 bits por lo q dejamos a las entradas con ese numero

void Alu_calcular(uint32_t a, uint32_t b, uint8_t sel_fn, uint32_t* y, bool* z);

// TEORIA: al declarar uint32_t *y significa que y es un puntero que apunta a un tipo de dato entero unsigned (direccion)