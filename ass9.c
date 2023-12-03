// Write a program where two threads will synchronize each other to print the pattern "baabbaabbaab".

// Note: The output is not guaranteed to be in order.

#include <stdio.h>
#include <pthread.h>
#include<semaphore.h>
#include<ctype.h>
#include <unistd.h>

sem_t sem1,sem2;

void *thread1(void *arg){
   int i=0;
        sem_wait(&sem1);
        printf("ba");
        sem_post(&sem2);
    i++;
}

void *thread2(void *arg){
   int i=0;
        sem_wait(&sem2);
        printf("ab");
        sem_post(&sem1);
    i++;
}

int main(int argc, char const *argv[])
{
    pthread_t thd1,thd2;
    sem_init(&sem1,0,1);
    sem_init(&sem2,0,0);
    for(int i=0;i<3;i++){
        pthread_create(&thd1,NULL,thread1,NULL);
        pthread_create(&thd2,NULL,thread2,NULL);
        pthread_join(thd1,NULL);
        pthread_join(thd2,NULL);
    }
    sem_destroy(&sem1);
    sem_destroy(&sem2);
    return 0;
}
