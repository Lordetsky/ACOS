#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    char *path = calloc(1024, sizeof(char));;
    int n;
    sscanf(argv[1], "%s%d", path, &n);
    int f = open(path, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    char* c = calloc(1024, sizeof(char));

    for (int i = 0; i < n; i++) {
        size_t res = read(0, &c, 100);

        write(f, &c, res);
    }

    close(f);
    free(path);
    free(c);

    return 0;
}