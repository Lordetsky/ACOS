#include <stdio.h>
#include <unistd.h>
#include <signal.h>

void handler(int sig) {
    printf("Caught %d\n", sig);
}

int main(int argc, char *argv[]) {
    signal(SIGINT,  handler);
    signal(SIGSEGV, handler);

    int i;
    for (i = 0;; i++) {
        sleep(1);
        printf("%d\n", i);
    }
    return 0;
}