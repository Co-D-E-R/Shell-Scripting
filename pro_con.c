// Simulate the  producer-consumer problem using multi-threading.


#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

#define bufferSize 1
sem_t mutex,emp,full;
int buffer[bufferSize];
int in=0,out=0;
int shared=0;

void handler(int sig){
    printf("program is terminated\n");
    exit(0);
}

void *producer(void *input){
    int item;
    signal(SIGINT,handler);
    while(1){
        sem_wait(&emp);
        sem_wait(&mutex);
        item = shared;
        printf("Producer produced item %d\n",item);
        buffer[in] = item;
        in = (in+1) % bufferSize;
        sleep(1);
        sem_post(&mutex);
        shared++;
        sleep(1);
        sem_post(&full);
    }
    pthread_exit(NULL);

}

void *consumer(void *input){
    int item;
    signal(SIGINT,handler);
    while(1){
        sem_wait(&full);
        sem_wait(&mutex);
        item= buffer[out];
        printf("Consumer consumed item %d\n",item);
        out = (out + 1) % bufferSize;
        sleep(1);
        sem_post(&mutex);
        sleep(1);
        sem_post(&emp);
    }
    pthread_exit(NULL);
}


int main(){
    pthread_t pro,con;
    sem_init(&mutex,0,1);
    sem_init(&emp,0,bufferSize);
    sem_init(&full,0,0);
    pthread_create(&pro,NULL,producer,NULL);
    pthread_create(&con,NULL,consumer,NULL);
    pthread_join(pro,NULL);
    pthread_join(con,NULL);
    sem_destroy(&mutex);
    sem_destroy(&emp);
    sem_destroy(&full);
    return 0;

}