#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<fcntl.h>
#include<sys/types.h>
#include<string.h>
#include<sys/stat.h>

int main(){
    char str1[100],str2[100],res[100];
    int fd1 = open("fifo1",O_RDONLY);
    int fd2 =open("fifo2",O_WRONLY);
    read(fd1,str1,sizeof(str1));
    read(fd1,str2,sizeof(str2));
    if(strlen(str1)!=strlen(str2)){
        strcpy(res,"NOT SAME");
        write(fd2,res,sizeof(res));
        return 1;
    }
    if(strcmp(str1,str2)!=0){
        strcpy(res,"NOT SAME");
        write(fd2,res,sizeof(res));
    }else{
        strcpy(res,"SAME");
        write(fd2,res,sizeof(res));
    }
    return 0;
}