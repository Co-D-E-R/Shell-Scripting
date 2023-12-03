// Write a Program to create a child process. The parent will send a signal to the child every 5 seconds and the child will handle the signal and check if an input number is a leap year or not.
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<signal.h>

int res=0;

void leap(int year){
    if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)) {
        printf("%d is a leap year.\n", year);
    } else {
        printf("%d is not a leap year.\n", year);
    }
}
void handler(int sig){
    res = 1;
}


int main() {
    int n;
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork failed");
        exit(1);
    }
    signal(SIGCHLD,handler);

    if (pid == 0) {
        // Child process
         // Handle SIGUSR1
        while (1) {
            pause();  // Wait for signals
            if(res==1){
                printf("Enter a year: ");
                scanf("%d", &n);
                leap(n);
                res=0;
            }
        }
    } else {
        // Parent process
        while (1) {
            kill(pid, SIGCHLD);  // Send SIGUSR1 to child process
            sleep(5);
        }
    }

    return 0;
}