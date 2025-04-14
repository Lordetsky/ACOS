#include <stdio.h>
#include "Complex.h"

void PrintComplex(const Complex *c) {
    printf("%.2f + %.2fi\n", c->real, c->imaginary);
}
