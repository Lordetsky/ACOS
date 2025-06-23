#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <command> <input_file> <output_file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int in_fd = open(argv[2], O_RDONLY);
    if (in_fd < 0) {
        perror("open input");
        exit(EXIT_FAILURE);
    }

    int out_fd = open(argv[3], O_CREAT | O_WRONLY | O_TRUNC, 0644);
    if (out_fd < 0) {
        perror("open output");
        close(in_fd);
        exit(EXIT_FAILURE);
    }

    pid_t pid = fork();
    if (pid == 0) {
        dup2(in_fd, STDIN_FILENO);
        dup2(out_fd, STDOUT_FILENO);
        close(in_fd);
        close(out_fd);
        execlp(argv[1], argv[1], NULL);
        perror("execlp");
        exit(EXIT_FAILURE);
    } else if (pid > 0) {
        close(in_fd);
        close(out_fd);
        int status;
        wait(&status);
        printf("STATUS: %d\n", WEXITSTATUS(status));
    } else {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    return 0;
}
