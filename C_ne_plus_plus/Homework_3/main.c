#include <stdio.h>
#include "Complex.h"

int main() {
    Complex a;
    scanf("%lf %lf", &a.real, &a.imaginary);
    PrintComplex(&a);
    return 0;
}
