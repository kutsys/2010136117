#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include "subproc_func.h"

#define EXECTO 10

void* subprocThread(void* arg) {
	subproc_func(20,10);
	return NULL;
}

int main(int argc, char* argv[]) {
	srand(time(NULL));
	pthread_t threads[EXECTO];
	for(int i=0; i<EXECTO; ++i) {
		int res = pthread_create(&threads[i], NULL, subprocThread, NULL);
		if(res!=0) {
			printf("thread create failed. exit program...\n");
			exit(EXIT_FAILURE);
		}
	}
	for(int i=0; i<EXECTO; ++i) {
		int res = pthread_join(threads[i], NULL);
		if(res!=0) {
			printf("Thread join failed. exit program...\n");
			exit(EXIT_FAILURE);
		}
	}
	printf("Finish\n");
	exit(0);
}