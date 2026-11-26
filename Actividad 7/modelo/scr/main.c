#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include "alu.h"

#define NUM_VECTORES 1000
#define ARCHIVO_SALIDA "vectores_prueba.txt"

#define MASCARA_NBITS_U32(nbits) \
    (((uint32_t)1 << (uint32_t)(nbits)) - (uint32_t)1)

int rand_15bit(void) { return rand() & MASCARA_NBITS_U32(15); }

uint32_t rand_32bit(void) {
    const uint32_t a = rand_15bit();  // bits 0 a 14
    const uint32_t b = rand_15bit();  // bits 15 a 29
    const uint32_t c = rand_15bit();  // bits 30 a 31
    return a | (b << 15U) | (c << 30U);
}

int main(void) {}
