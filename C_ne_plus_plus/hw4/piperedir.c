#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <command> <output_file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int out_fd = open(argv[2], O_CREAT | O_WRONLY | O_TRUNC, 0644);
    if (out_fd < 0) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    dup2(out_fd, STDOUT_FILENO);
    close(out_fd);

    execlp(argv[1], argv[1], NULL);
    perror("execlp");
    return 1;
}
