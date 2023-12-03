#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<pthread.h>

void *prime(void *input){
	int n = *((int *)input);
	if(n==1)
		pthread_exit("Niether prime nor Composite.\n");
	int i=1;
	int cnt=0;
	for(i=1;i<n;i++){
		if(n%i==0){
			cnt+=1;
		}
	}
	if(cnt==2){
		pthread_exit("Prime Number.\n");
	}
	pthread_exit("Composite Number.\n");
}
void main(){
	pthread_t t;
	void *res;
	int n;
	printf("Enter the number:\n");
	scanf("%d",&n);
	getchar();
	pthread_create(&t,NULL,prime,NULL);
	pthread_join(t,&res);

	printf("%s",(char *)res);
}