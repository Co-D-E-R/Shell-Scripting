//  write a program where the main thread will accept an integer as input and will create a sub-thread, which will check whether the number is prime or not
//  and return the result ("PRIME" or "NOT PRIME") to the main thread

#include<stdio.h>
#include<pthread.h>
#include<unistd.h>
#include<stdlib.h>


void *prime(void *arg){
    int n = *((int *)arg);
    int *flag = malloc(sizeof(int));
    if(n==1){
        *flag = 1;
    }else{
        for(int i=2;i<=n/2;i++){
            if(n%i==0){
                *flag=1;
                break;
            }
        }
    }
    return (void *)flag;



}

int main(){
    int n;
    int *result;
    printf("Enter the number ::");
    scanf("%d",&n);
    pthread_t thrd;
    pthread_create(&thrd,NULL,prime,(void *)&n);
    pthread_join(thrd,(void **)&result);
    if(*result == 0){
        printf("PRIME\n");
    }else{
        printf("NOT PRIME\n");
    }
    free(result);
    return 0;
    
}