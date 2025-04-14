#include "stdio.h"
#include "stdlib.h"
#include "string.h"

const static char *str1 = "BlaBla";
const static char *str2 = "GlaGla";

char* myStrCat(const char* s1, const char* s2) {
    char* result = calloc(strlen(s1) + strlen(s2), sizeof(char));
    for (int i = 0; i < strlen(s1); i++) {
        result[i] = s1[i];
    }
    for (int i = 0; i < strlen(s2); i++) {
        result[i + strlen(s2)] = s2[i];
    }
    return result;
}

int main() {
    char* str = myStrCat(str1, str2);
    printf("%s\n", str);

    free(str);

    return 0;
}