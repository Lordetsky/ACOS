#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid;
    pid = fork();
    if (pid < 0) {
        perror("Fork Failed");
        return 1;
    } else if (pid == 0) {
        pid_t pid_new;

        pid_new = fork();
        if (pid_new < 0) {
            perror("Fork Failed");
        }
        else if (pid_new == 0) {
            printf("Child process from child created\n");
        }
        else {
            wait(NULL);
            printf("Parent process from parent created\n");
        }
    } else {
        wait(NULL);
        printf("Child Complete");
    }
    return 0;
}