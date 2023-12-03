#include<stdio.h>
#include<stdlib.h>
#include<sys/shm.h>
#include<unistd.h>
#include<string.h>

int main(int argc,char *argv[]){
    char str[100];
    int shmid=shmget(1234,sizeof(str),0666|IPC_CREAT);
    int res=-1;
    void *s = (void *)shmat(shmid,NULL,0);
    printf("Enter the string ::");
    scanf("%s",str);
    strcpy((char *)s,str);
    sleep(10);
    res = *((int *)s);
    if(res==0){
        printf("String is not palindrome\n");
    }else{ 
        printf("String is palindrome\n");
    }
    shmdt(s);
    shmctl(shmid,IPC_RMID,NULL);
    return 0;
}