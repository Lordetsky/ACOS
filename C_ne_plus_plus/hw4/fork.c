#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();
    if (pid == 0) {
        printf("Hello from child\n");
        pid_t pid2 = fork();
        if (pid2 == 0) {
            printf("Hello from grandchild\n");
            exit(0);
        } else if (pid2 > 0) {
            wait(NULL);
            exit(0);
        } else {
            perror("fork");
            exit(1);
        }
    } else if (pid > 0) {
        wait(NULL);
        printf("Hello from parent\n");
    } else {
        perror("fork");
        return 1;
    }

    return 0;
}
