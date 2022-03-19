#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

char* cmd[64];
int main() {
    cmd[0] = "sleep";
    cmd[1] = "5";
    pid_t pid = fork();
    if (pid == 0) {
        execvp(cmd[0], cmd);
    } else {
        waitpid(pid, NULL, 0);
    }
    printf("HI\n");
    return 0;
}