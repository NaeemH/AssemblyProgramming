#include <stdio.h>
#include <stdlib.h>
#include "nCr.h"
#include <time.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include <sys/types.h>
#define BIT_SIZE 32
#define MAX 12

/*
Naeem Hossain
Computer Architecture
November 6, 2016
*/

void help(){
	printf("Usage: formula <positive integer>\n");
}

void large(){
	printf("ERROR: input size is too large. enter an input <= 12 \n");
}

int main(int argc, const char * argv[]) {
	/*
	struct timeval{
		suseconds_t tv_usec;
		suseconds_t tv_usec;
	}*/
	struct timeval start, stop;
	int ptr;
	int a = 0;
	int n;
	/*Check*/
	if (strcmp(argv[1],"-h") == 0) {
        help();
        exit(0);
    	}	
	if (argv[1][0] == '-'){	
	} else {
		n = atoi(argv[1]);
		/*Start timer*/
		gettimeofday(&start, NULL);
		printf("(1 + x)^%i = ", n);\

		if (n == 0){
			printf("0\n");
			exit(0);
		}  else if (n > 12) {
			large();
			exit(0);
		} else {
			for (; a <= n; a++){
				ptr = nCr(n, a);
				if (ptr == -1) {
				exit(1);
			} else {
				if (a != 0){
					if(a == 1){
						printf("1 + ");
					}
					printf("%i*x^%i ",ptr , a);
				}
				if (a != n && a != 0){
					printf("+ ");
				}
			}
		}
		/*End timer*/
		gettimeofday(&stop, NULL);}
	}


	/*Note to self; figure out how to declare timesec values
	uint startSec = (start.tv_sec * 1000000 + start.tv_usec);
	uint stopSec = (stop.tv_sec * 1000000 + stop.tv_usec);
	uint totalSec = stopSec - startSec;
	*/

	/*Note to self: no type declaration works, will do it manually*/
	printf("\n Time Required = %ld microseconds \n", ((stop.tv_sec * 1000000 + stop.tv_usec)
		  - (start.tv_sec * 1000000 + start.tv_usec)));
	return 0;
}

/*
     o %eip contains return address
      o %esp points at arguments pushed by caller
      o called function may have trashed arguments
      o %eax contains return value (or trash if function is void)
      o %ecx, %edx may be trashed
      o %ebp, %ebx, %esi, %edi must contain contents from time of call 
*/

