// Write a program to demonstrate the use of signal. Parent process will stop until an alarm received from child process.
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<signal.h>
#include<sys/types.h>
#include<sys/wait.h>


void handler(int sig){
    printf("Received signal %d\n",sig);
    exit (0);
}
int main(){
    pid_t pid =fork();
    if(pid <0){
        printf("Error\n");
        exit(1);
    }
    if(pid == 0){
        sleep(5);
        kill(getppid(),SIGALRM);
    }else{
        signal(SIGALRM,handler);
        while(1){
            printf("Waiting for signal\n");
            sleep(1);
        }

    }
    return 0;
}