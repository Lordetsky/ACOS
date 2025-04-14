#ifndef COMPLEX_H
#define COMPLEX_H

typedef struct {
    double real;
    double imaginary;
} Complex;

void PrintComplex(const Complex *c);

#endif // COMPLEX_H
