#include<stdio.h>
#include<string.h>
#include<sys/shm.h>
#include<unistd.h>
#include<stdlib.h>

int main(){
    char str[100];
    char rev[100];
    int shmid = shmget(1234,sizeof(str),0666);
    void *s=(void *)shmat(shmid,NULL,0);
    int res=1;
    strcpy(str,(char*)s);
    printf("String is ::%s\n",str);
    int len = strlen(str)-1;
    int i=0;
    while(len>=0){
        rev[i++] = str[len--];
    }
    rev[i] = '\0';
    res = (!strcmp(str,rev))?1:0;
    *((int *)s) = res;
    shmdt(s);
    return 0;
}