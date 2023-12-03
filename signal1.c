// Write a Program to demonstrate the use of signal. The process will print a message infinitely until an interrupt signal occurs. It will handle the signal and will print a message along with the signal number that it has got.(Help: signal(SIGINT,SIG_DFL))
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<fcntl.h>
#include<sys/types.h>
#include<string.h>
#include<sys/stat.h>
#include<signal.h>

void handler(int sig){
    printf("siganl %d\n",sig);
    exit(0);
}
int main(){
    signal(SIGINT,handler);
    while(1){
        printf("hello\n");
        sleep(1);
    }
}
