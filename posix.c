// Write a 'C' program in LINUX to create a thread that determines the summation of N natural numbers using POSIX thread library.

// POSIX Threads: programming with pthread functions (pthread_create, pthread_join, pthread_exit, pthread_attr_init, pthread_cancel)
#include<stdio.h>
#include<pthread.h>

static volatile int sum = 0;

void *mythread(void *arg){
    int *n = (int *)arg;
    for(int i=1;i<=*n;i++){
        sum+=i;
    }
    printf("Child thread is terminated\n");
    pthread_exit(NULL); // pthread_exit() is used to explicitly exit a thread. It’s like exit() method in C/C++.
    

}

int main(int argc,char *argv[]){
    pthread_t thd;
    int n;
    printf("Enter the number :");
    scanf("%d",&n);
    pthread_create(&thd,NULL,mythread,(void *)&n);

    pthread_join(thd,NULL);
    printf("Sum of %d natural numbers is %d\n",n,sum);
    printf("Main thread is terminated\n");
    return 0;
}