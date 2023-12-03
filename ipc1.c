// a) Implement IPC between a parent and a child process where parent will print a message received from the child, who will take the message as user input. Use un-nnamed pipe for IPC.
//using unnamed pipe
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<fcntl.h>
#include<string.h>

int main(){
    int fd[2];
    if(pipe(fd)==-1){
        printf("pipe failed\n");
        return 1;
    }
    pid_t pid = fork();//create a child process
    if(pid<0){
        printf("fork failed\n");
        return 1;
    }
    if(pid == 0){
        //child process
        close(fd[0]);
        char msg[100];
        printf("Enter message: ");
        fgets(msg,100,stdin);
        write(fd[1],msg,sizeof(msg));//Write to pipe
        close(fd[1]);
    }else{
        //parent process
        close(fd[1]);
        char msg[100];
        read(fd[0],msg,sizeof(msg));//read to a pipe
        printf("Message received:: %s\n",msg);
        close(fd[0]);
    }
    return 0;
}