// Implement IPC between two processes where proceess-1 will take two strings as user input and send them to process-2. Process-2 will compare them and return the result ("SAME" or "NOT SAME") back to process-1. Use FIFO for IPC.
#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<fcntl.h>
#include<string.h>
#include<sys/stat.h>
#include<stdlib.h>

int main(){
    char str1[100],str2[100],res[100];
    mkfifo("fifo1",0666);
    perror("mkfifo");
    mkfifo("fifo2",0666);
    perror("mkfifo");
    int fd1 = open("fifo1",O_WRONLY);
    int fd2 =open("fifo2",O_RDONLY);
    printf("Enter string 1: ");
    fgets(str1,100,stdin);
    printf("Enter string 2: ");
    fgets(str2,100,stdin);
    write(fd1,str1,sizeof(str1));
    write(fd1,str2,sizeof(str2));
    read(fd2,res,sizeof(res));
    printf("String result :: %s\n",res);
    close(fd1);
    close(fd2);
    unlink("fifo1");
    unlink("fifo2");
    return 0;   
}