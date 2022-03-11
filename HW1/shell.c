#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

void prompt() {
    char cwd[64];
    getcwd(cwd, sizeof(cwd));
    printf("\n%s\n> ", cwd);
}

void get_input(char* buf) { fgets(buf, 64 * sizeof(char), stdin); }

int parser(char* str, char** argv, char** argv2) {
    char* p = strtok(str, " \n");
    int cnt = 0, cnt2 = 0, type = 0;
    while (p != NULL) {
        if (!strcmp(p, "|"))
            type = 1;
        else if (!strcmp(p, ">"))
            type = 2;
        else if (!strcmp(p, "<"))
            type = 3;
        else if (!strcmp(p, "&"))
            type = 4;
        else if (type != 0)
            argv2[cnt2++] = p;
        else
            argv[cnt++] = p;

        if (cnt >= 64) break;
        p = strtok(NULL, " \n");
    }
    argv[cnt] = NULL;
    argv2[cnt2] = NULL;
    return type;
}

void proc_single(char** argv) {
    pid_t pid = fork();
    if (pid == 0) {
        execvp(argv[0], argv);
        perror("Command error");
        _exit(0);
    } else
        waitpid(pid, NULL, 0);
}

void proc_pipe(char** argv, char** argv2) {
    int fd[2];
    pipe(fd);
    pid_t pid = fork();
    if (pid == 0) {
        pid_t pid2 = fork();
        if (pid2 == 0) {
            dup2(fd[1], 1);
            close(fd[1]);
            execvp(argv[0], argv);
            perror("Command error");
            _exit(0);
        } else {
            dup2(fd[0], 0);
            close(fd[0]);
            execvp(argv2[0], argv2);
            perror("Command error");
            _exit(0);
        }
    } else
        waitpid(pid, NULL, 0);
}

void proc_bg(char** argv) {
    pid_t pid = fork();
    if (pid == 0) {
        execvp(argv[0], argv);
        perror("Command error");
        _exit(0);
    }
}

void proc_right(char** argv, char** argv2) {
    pid_t pid = fork();
    if (pid == 0) {
        int f = open(argv2[0], O_WRONLY | O_CREAT, 777);
        if (f == -1) {
            perror("File error");
            return;
        }
        dup2(f, 1);
        close(f);
        execvp(argv[0], argv);
        perror("Command error");
        _exit(0);
    } else
        waitpid(pid, NULL, 0);
}

void proc_left(char** argv, char** argv2) {
    pid_t pid = fork();
    if (pid == 0) {
        int f = open(argv2[0], O_RDONLY, 777);
        if (f == -1) {
            perror("File error");
            return;
        }
        dup2(f, 0);
        close(f);
        execvp(argv[0], argv);
        perror("Command error");
        _exit(0);
    } else
        waitpid(pid, NULL, 0);
}
int main() {
    while (1) {
        char buf[64], *argv[64], *argv2[64];
        int type = 0;
        prompt();
        get_input(buf);
        type = parser(buf, argv, argv2);
        if (argv[0] == NULL) continue;

        if (!strcmp(argv[0], "exit")) break;
        if (!strcmp(argv[0], "cd")) {
            if (chdir(argv[1]) == -1) perror("Address error");
            continue;
        }
        switch (type) {
            case 0:
                proc_single(argv);
                break;
            case 1:
                proc_pipe(argv, argv2);
                break;
            case 2:
                proc_right(argv, argv2);
                break;
            case 3:
                proc_left(argv, argv2);
                break;
            case 4:
                proc_bg(argv);
                break;
            default:
                break;
        }
    }
    return 0;
}