#include "alu.h"        // las comillas para que el procesador busque alu.h en su carpeta local primero
#include <stdio.h>      // Para el printf


void Alu_calcular(uint32_t a, uint32_t b, uint8_t sel_fn, uint32_t* y, bool* z) {



    switch (sel_fn)
    {
        case OP_SUMA: *y = a + b; 
        break;
        
        case OP_RESTA: *y = a - b;
        break;

        case OP_DESP_IZQ: *y = a << (b & 0x1F);         // b & 0x1F Funciona de mascara para usar los 5 bits de b
        break;

        case OP_DESP_IZQ_ALT: *y = a << (b & 0x1F);
        break;


        case OP_MENOR_C2:
        case OP_MENOR_C2_ALT: *y = ((int32_t)a < (int32_t)b);
        break;

        case OP_MENOR_BIN:
        case OP_MENOR_BIN_ALT: *y = a < b;
        break;

        case OP_XOR:
        case OP_XOR_ALT: *y = a ^ b;
        break;

        case OP_DESP_DER_BIN: *y = (a >> (b & 0x1f));
        break;
        
        case OP_DESP_DER_C2: *y = (uint32_t)((int32_t)a >> (b & 0x1F));
        break;

        case OP_OR:
        case OP_OR_ALT: *y = a | b;
        break;


        case OP_AND:
        case OP_AND_ALT: *y = a & b;
        break;

        default: printf("/n case no evaluado /n");
    }

    *z = (*y == 0);

}
