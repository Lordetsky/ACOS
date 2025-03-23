#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b) {
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

int main() {
    int* arr = NULL;
    int num, index = 0, size = 0;
    scanf("%d", &num);
    while (num != 0) {
        arr = realloc(arr, (++size) * sizeof(int));
        arr[index++] = num;
        scanf("%d", &num);
    }

    for (int i = 0; i < size / 2; i++) {
        swap(&arr[i], &arr[size - i - 1]);
    }

    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }

    free(arr);

    return 0;
}