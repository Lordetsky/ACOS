#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int sravn(const void *a, const void *b) {
    const char *str1 = *(const char **)a;
    const char *str2 = *(const char **)b;
    return strcmp(str1, str2);
}


void puzirek(char *str[], int size) {
    for (int i = 0; i < size; i++) {
        for
    }
}


int main(int argc, char *argv[]) {
    qsort(argv + 1, argc - 1, sizeof(char *), sravn);

    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }

    return 0;
}