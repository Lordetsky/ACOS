#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b) {
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);

    int** arr = calloc(n, sizeof(int*));
    for (int i = 0; i < n; i++) {
        arr[i] = calloc(m, sizeof(int));
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            scanf("%d", &arr[i][j]);
        }
    }

    int** trans_arr = calloc(m, sizeof(int*));
    for (int i = 0; i < m; i++) {
        trans_arr[i] = calloc(n, sizeof(int));
    }

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            trans_arr[i][j] = arr[j][i];
        }
    }

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", trans_arr[i][j]);
        }
        printf("\n");
    }

    for (int i = 0; i < n; i++) {
        free(arr[i]);
    }
    free(arr);

    for (int i = 0; i < m; i++) {
        free(trans_arr[i]);
    }
    free(trans_arr);

    return 0;
}